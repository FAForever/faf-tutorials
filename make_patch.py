#!/usr/bin/python3
# -*- coding: utf-8 -*-

"""
clone: https://github.com/FAForever/faf-tutorials/

FAF featured mod updater

All default settings are setup for FAF production!
Override the directory settings for local testing.
To get more help run
    $ make_patch.py -h

Default usage:
    $ make_patch.py -s <version>
    or
    $ python make_patch.py --git-directory-base .. 2

"""

import argparse
import hashlib
import logging
import os
import shutil
import subprocess
import stat
import sys
import urllib.request
import zipfile
from collections import namedtuple
from typing import List, Tuple

from github import Github

ASSET_FOLDER = ".assets"

UpdateFileVersionRecord = namedtuple('UpdateFileVersionRecord', [
    # column contents of db table updates_{featured_mod}
    'id', 'filename', 'path',
    # column contents of db table updates_{featured_mod}_files
    'file_id', 'versioned_name', 'version', 'md5'
])

GithubAssetFile = namedtuple('GithubAssetFile', ['name', 'url'])
ModFile = namedtuple('ModFile', ['path', 'md5'])

logger = logging.getLogger()  # type: logging.Logger
logger.setLevel(logging.DEBUG)


class FeaturedMod:
    def __init__(self, db_name, git_organisation, git_project, init_lua_file,
                 git_base_directory, content_base_directory):
        # type: (str, str, str, str, str, str) -> None
        self.db_name = db_name  # type: str
        self.git_organisation = git_organisation  # type: str
        self.git_project = git_project  # type: str
        self.init_lua_file = init_lua_file  # type: str
        self.git_base_directory = git_base_directory  # type: str
        self.content_base_directory = content_base_directory  # type: str

    def __str__(self):
        return "FeaturedMod(db_name='{db_name}', git_organisation='{git_organisation}', " \
            "git_project='{git_project}', init_lua_file='{init_lua_file}', " \
            "git_base_directory='{git_base_directory}', content_base_directory='{content_base_directory}')".format(
            db_name=self.db_name,
            git_organisation=self.git_organisation,
            git_project=self.git_project,
            init_lua_file=self.init_lua_file,
            git_base_directory=self.git_base_directory,
            content_base_directory=self.content_base_directory
        )

    def git_folder(self):
        # type: () -> str
        return os.path.join(self.git_base_directory, self.git_project)

    def init_lua_path(self):
        # type: () -> str
        return os.path.join(self.git_base_directory, self.git_project, self.init_lua_file)

    def asset_folder(self):
        # type: () -> str
        return os.path.join(self.git_base_directory, self.git_project, ASSET_FOLDER)

    def build_file_asset_path(self, name):
        # type: (str) -> str
        return os.path.join(self.asset_folder(), name)

    def content_folder(self):
        # type: () -> str
        return os.path.join(self.content_base_directory, "updates_{db_name}_files".format(db_name=self.db_name))

    def build_file_content_path(self, name, version):
        # type: (str, int) -> str
        return os.path.join(self.content_folder(), enrich_filename_with_version(name, version))


def calc_md5(filename):
    # type: (str) -> str
    """
    Calculate the MD5 hash of a file
    """
    hash_md5 = hashlib.md5()
    with open(filename, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()


def run_checked_shell(cmd):
    # type: (List[str]) -> subprocess.CompletedProcess
    """
    Runs a command as a shell process and checks for success
    Output is captured in the result object
    :param cmd: command to run
    :return: CompletedProcess of the execution
    """
    logger.debug("Run shell command: {cmd}".format(cmd=cmd))
    return subprocess.run(cmd, check=True, stdout=subprocess.PIPE)


def run_sql(sql, container="faf-db", database="faf_lobby"):
    # type: (str, str, str) -> str

    """
    Run a sql-query against the faf-db in the docker container
    :param database: name of the database where to run the query
    :param container: name of the docker container where to run the query
    :param sql: the sql-query to run
    :return: the query output as string
    """
    try:
        sql_text_result = run_checked_shell(
            ["docker", "exec", container, "mysql", database, "-e", sql]
        ).stdout.decode()  # type: str
        logger.debug("SQL output >>> \n{sql_text_result}<<<".format(sql_text_result=sql_text_result))
        return sql_text_result
    except subprocess.CalledProcessError as e:
        logger.error("""Executing sql query failed: {sql}\n\t\tError message: {e}""".format(sql=sql, e=str(e)))
        exit(1)


def read_latest_patch_files(featured_mod):
    # type: (FeaturedMod) -> List[UpdateFileVersionRecord]
    """
    Read the latest patch files list in the updates_{featured_mod}_files table in faf-db
    :param featured_mod: the featured mod to lookup
    :return: list of latest file records
    """

    sql = "SELECT id, filename, path, fileId, versioned_name, version, md5 " \
        "FROM updates_{featured_mod.db_name} as master " \
        "LEFT JOIN ( " \
        "   SELECT fileId, name as versioned_name,version, md5 FROM updates_{featured_mod.db_name}_files AS all_patches " \
        "  INNER JOIN " \
        "    (SELECT fileId as max_id, MAX(version) as max_version " \
        "        FROM updates_{featured_mod.db_name}_files" \
        "        GROUP BY fileId) max_patches " \
        "  ON all_patches.fileId = max_patches.max_id " \
        "  AND all_patches.version = max_patches.max_version " \
        "  ) as latest_patches " \
        "  ON master.id = latest_patches.fileId;".format(
        featured_mod=featured_mod
    )  # type: str

    result = run_sql(sql)  # type: str

    patch_files = []  # type: List[UpdateFileVersionRecord]

    # skip first line (headers) and last line (empty line)
    for line in result.split('\n')[1:-1]:
        fields = line.split('\t')  # type: List[str]

        # Handle NULL results from database
        as_str = lambda x: None if x == 'NULL' else x
        as_int = lambda x: None if x == 'NULL' else int(x)

        record = UpdateFileVersionRecord(as_str(fields[0]), as_str(fields[1]), as_str(fields[2]), as_int(fields[3]),
                                         as_str(fields[4]), as_int(fields[5]), as_str(fields[6]))
        logger.debug("Found file record: {record}".format(record=record))
        patch_files.append(record)

    return patch_files


def create_patch_file_records(featured_mod, patch_files, simulate, override):
    # type: (FeaturedMod, List[UpdateFileVersionRecord], bool, bool) -> None
    """
    Write the new UpdateFileVersionRecord to the database

    :param featured_mod: affected featured mod
    :param patch_files: list of UpdateFileVersionRecord to write
    :param simulate: if true only prints SQL without running it
    :param override: if true deletes records of the same file_id and version first
    :return: None
    """

    def insert_patch_file(ufr):
        # type: (UpdateFileVersionRecord) -> None
        sql_delete = "DELETE FROM updates_{featured_mod.db_name}_files " \
            "WHERE fileId={ufr.file_id} AND version={ufr.version}".format(
            ufr=ufr, featured_mod=featured_mod
        )
        sql_insert = "INSERT INTO updates_{featured_mod.db_name}_files (fileId, version, name, md5, obselete) " \
            "VALUES ({ufr.file_id}, {ufr.version}, '{ufr.versioned_name}', '{ufr.md5}', 0)".format(
            ufr=ufr, featured_mod=featured_mod
        )

        if override:
            if simulate:
                logger.debug("SIMULATE: {sql_delete}".format(sql_delete=sql_delete))
            else:
                run_sql(sql_delete)

        if simulate:
            logger.debug("SIMULATE: {sql_insert}".format(sql_insert=sql_insert))
        else:
            run_sql(sql_insert)

    logger.debug("Creating patch file records for featured mod {featured_mod} "
                 "(simulate: {simulate}, override: {override}".format(
        featured_mod=featured_mod, simulate=simulate, override=override
    ))

    for patch_file in patch_files:
        insert_patch_file(patch_file)


def git_checkout(featured_mod, version):
    # type: (FeaturedMod, int) -> None
    """
    Checkout a git tag of the git repository. This requires the repo to be checked out in the same folder!

    :param featured_mod: the featured mod to checkout
    :param version: version of the git tag without the prefix 'v'
    :return: nothing
    """

    os.chdir(featured_mod.git_folder())

    try:
        run_checked_shell(["git", "fetch"])
        run_checked_shell(["git", "checkout", "v{version}".format(version=version)])
    except subprocess.CalledProcessError as e:
        logger.error("git checkout failed - please check the error message: {e.stderr}".format(e=e))
        exit(1)


def download_github_release_assets(featured_mod, version):
    # type: (FeaturedMod, int) -> List[ModFile]
    """
    Download all assets of a Github release of the featured mods version
    :param featured_mod: the featured mod that will be looked up
    :param version: the git tags version (a 'v' prefix will be added!)
    :return: a list of files containing the name and their location on disk
    """

    def list_github_release_assets():
        # type: () -> List[GithubAssetFile]
        """
        Create a list of assets (manual uploads) of a Github release
        """
        github = Github()

        github_repo = github.get_repo("{featured_mod.git_organisation}/{featured_mod.git_project}".format(
            featured_mod=featured_mod))
        release = github_repo.get_release("v{version}".format(version=version))
        assets = release.get_assets()

        result = []  # type: List[GithubAssetFile]

        for next_asset in assets:
            asset_file = GithubAssetFile(next_asset.name, next_asset.browser_download_url)
            logger.info("Found asset: {asset_file}".format(asset_file=asset_file))
            result.append(asset_file)

        return result

    def download_github_asset(github_file, filename):
        # type: (GithubAssetFile, str) -> None
        """
        Download a single Github asset to disk
        """
        logger.debug("Download asset {github_file} to {filename}".format(github_file=github_file, filename=filename))
        urllib.request.urlretrieve(github_file.url, filename)

    if not os.path.exists(ASSET_FOLDER):
        os.makedirs(ASSET_FOLDER)

    github_assets = list_github_release_assets()  # type: List[GithubAssetFile]
    release_files = []  # type: List[ModFile]

    for asset in github_assets:
        output_file = featured_mod.build_file_asset_path(asset.name)
        download_github_asset(asset, output_file)
        md5 = calc_md5(output_file)  # type: str
        release_files.append(ModFile(asset.name, md5))

    return release_files


def enrich_filename_with_version(filename, version):
    # type: (str, int) -> str
    """
    Extends a filename with a tag. Example
        some_asset.nx2 --> some_asset.v1.nx2
    """
    index = filename.rfind('.')
    return filename[:index] + '.v' + str(version) + filename[index:]


def create_files_from_git(featured_mod):
    # type: (FeaturedMod) -> List[ModFile]
    """
    Create the versioned files from github repos
    :param featured_mod: the current featured mod
    :return: list of created ModFiles
    """

    def copy_init_file():
        # type: () -> ModFile
        """
        The init file is just to be copied
        """
        source = featured_mod.init_lua_path()
        md5 = calc_md5(source)
        destination = featured_mod.build_file_asset_path(featured_mod.init_lua_file)
        shutil.copyfile(source, destination)
        os.chmod(destination, stat.S_IROTH | stat.S_IRGRP | stat.S_IWGRP | stat.S_IWRITE | stat.S_IREAD)

        return ModFile(featured_mod.init_lua_file, md5)

    def create_zip_file(name, content):
        # type: (str, List[str]) -> ModFile
        """
        Zip all files and subdirectories in the content list
        :param name: filename for the zip file (without versioning)
        :param content: list of files and subdirectories to zip
        """
        output_file = featured_mod.build_file_asset_path(name)

        with zipfile.ZipFile(output_file, 'w', zipfile.ZIP_DEFLATED) as zip_file:
            for path in content:
                absolute_path = os.path.join(featured_mod.git_folder(), path)

                if os.path.isdir(absolute_path):
                    for root, dirs, files in os.walk(absolute_path):
                        for next_file in files:
                            zip_file.write(os.path.join(root, next_file))
                else:
                    zip_file.write(path)
        os.chmod(output_file, stat.S_IROTH | stat.S_IRGRP | stat.S_IWGRP | stat.S_IWRITE | stat.S_IREAD)

        md5 = calc_md5(output_file)
        return ModFile(name, md5)

    if not os.path.exists(featured_mod.asset_folder()):
        os.makedirs(featured_mod.asset_folder())

    directory_content = os.listdir(".")
    exclude_files = [ASSET_FOLDER, featured_mod.init_lua_file, os.path.basename(__file__),
                     ".git", ".gitattributes", ".gitignore", "deployment.md"]

    for file in exclude_files:
        if file in directory_content:
            directory_content.remove(file)

    return [
        copy_init_file(),
        create_zip_file("faf_tutorial.tut", directory_content)
    ]  # type: List[ModFile]


def create_new_patch_file(featured_mod, patch_file):
    # type: (FeaturedMod, UpdateFileVersionRecord) -> UpdateFileVersionRecord
    """
    Write a new patch file to the masterdata table updates_{featured_mod}
    :param featured_mod: featured mod that is being patched
    :param patch_file: new file
    :return:
    """

    sql_insert = "INSERT into updates_{featured_mod.db_name} (filename, path) " \
        "VALUES ('{patch_file.filename}', '{patch_file.path}')".format(
        featured_mod=featured_mod, patch_file=patch_file
    )  # type: str

    sql_get_id = "SELECT id FROM updates_{featured_mod.db_name} " \
        "WHERE filename = '{patch_file.filename}' AND path = '{patch_file.path}'".format(
        featured_mod=featured_mod, patch_file=patch_file
    )  # type: str

    run_sql(sql_insert)
    id_result = run_sql(sql_get_id)
    new_id = int(id_result.split("\n")[1])

    return UpdateFileVersionRecord(None, patch_file.filename, patch_file.path, patch_file.file_id or new_id,
                                   patch_file.versioned_name, patch_file.version, patch_file.md5)


def build_update_records(featured_mod, version, compare_latest_files, new_mod_files):
    # type: (FeaturedMod, int, List[UpdateFileVersionRecord], List[ModFile]) -> Tuple[List[UpdateFileVersionRecord], List[ModFile]]
    """
    Compares generated files with previous files from the database and generate update records for the database
    :param featured_mod: the featured mod under analysis
    :param version: the new version
    :param compare_latest_files: the current state in the database
    :param new_mod_files: the newly generated files
    :return:
    """
    new_update_file_versions = []  # type: List[UpdateFileVersionRecord]
    files_to_update = []  # type: List[ModFile]

    for file in new_mod_files:
        matching_patches = [patch for patch in compare_latest_files if patch.filename == file.path]

        if not matching_patches:
            path = "gamedata"
            if file.path.startswith("init"):
                path = 'bin'
            new_patch_record = UpdateFileVersionRecord("NULL", file.path, path, None,
                                                       enrich_filename_with_version(file.path, version),
                                                       version, file.md5)
            new_patch_record = create_new_patch_file(featured_mod, new_patch_record)
            files_to_update.append(file)
            logger.info("Added completely new patch file: {new_patch_record}".format(new_patch_record=new_patch_record))
            new_update_file_versions.append(new_patch_record)
        elif len(matching_patches) > 1:
            raise ValueError("There must not be two matching patches for one mod file")
        else:
            mp = matching_patches[0]

            if mp.md5 == file.md5:
                logger.info("MD5 matches with current patch, no update necessary for: {mp}".format(mp=mp))
            else:
                new_patch_record = UpdateFileVersionRecord(mp.id, mp.filename, mp.path, mp.id,
                                                           enrich_filename_with_version(file.path, version),
                                                           version, file.md5)
                logger.info("New version of patch file: {new_patch_record}".format(new_patch_record=new_patch_record))
                new_update_file_versions.append(new_patch_record)
                files_to_update.append(file)

    return new_update_file_versions, files_to_update


def move_new_files(featured_mod, new_mod_files, version):
    # type: (FeaturedMod, List[ModFile], int) -> None
    """
    Move the created patch files from the asset folder (plain names) to the content folder (versioned names)
    :param featured_mod: the featured mod of the files
    :param new_mod_files: the list of files to move
    :param version: the version to be added to the file names
    :return: None
    """
    for mod_file in new_mod_files:

        source = featured_mod.build_file_asset_path(mod_file.path)
        destination = featured_mod.build_file_content_path(mod_file.path, version)

        shutil.move(source, destination)
        os.chmod(destination, stat.S_IROTH | stat.S_IRGRP | stat.S_IWGRP | stat.S_IWRITE | stat.S_IREAD)


def validate_directories(featured_mod):
    # type: (FeaturedMod) -> None
    """
    Validate the existance of required directories of the featured mod
    :param featured_mod: The featured mod which directories will be checked
    :return: None
    """
    fail = False

    if not os.path.exists(featured_mod.git_folder()):
        logger.error(
            "You did not configure an existing git directory: {}".format(
                featured_mod.git_folder()
            )
        )
        fail = True

    if not os.path.exists(featured_mod.content_folder()):
        logger.error(
            "You either setup the wrong content directory or did not create it yet: {}".format(
                featured_mod.content_folder()
            )
        )
        fail = True

    if fail:
        exit(1)


if __name__ == "__main__":
    stream_handler = logging.StreamHandler(sys.stdout)
    stream_handler.setFormatter(logging.Formatter('%(levelname)-5s - %(message)s'))
    logger.addHandler(stream_handler)

    parser = argparse.ArgumentParser(description=__doc__)

    parser.add_argument("version", type=int, help="the git tag name of the version")
    parser.add_argument("-o", "--override", dest="override", action="store_true", default=False,
                        help="overrides existing patch")
    parser.add_argument("-s", "--simulate", dest="simulate", action="store_true", default=False,
                        help="only runs a simulation without updating the database")
    parser.add_argument("--git-directory-base", dest="git_base_directory", action="store",
                        default="/opt/featured_mods/",
                        help="base directory of all featured mod git repositories")
    parser.add_argument("--content-directory-base", dest="content_base_directory", action="store",
                        default="/opt/faf/data/content/legacy-featured-mod-files/",
                        help="base directory of the versioned files of all featured mods (content server)")

    args = parser.parse_args()

    tutorials_featured_mod = FeaturedMod("tutorials", "FAForever", "faf-tutorials", "init_tutorials.lua",
                                         args.git_base_directory, args.content_base_directory)

    validate_directories(tutorials_featured_mod)
    git_checkout(tutorials_featured_mod, args.version)

    mod_files = []  # type: List[ModFile]
    mod_files += create_files_from_git(tutorials_featured_mod)
    mod_files += download_github_release_assets(tutorials_featured_mod, args.version)

    latest_patch_files = read_latest_patch_files(tutorials_featured_mod)
    update_records, mod_files = build_update_records(tutorials_featured_mod, args.version, latest_patch_files, mod_files)
    create_patch_file_records(tutorials_featured_mod, update_records, args.simulate, args.override)

    if not args.simulate:
        move_new_files(tutorials_featured_mod, mod_files, args.version)
