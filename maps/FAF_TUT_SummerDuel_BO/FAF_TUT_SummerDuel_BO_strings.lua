local TutorialStrings = import('/lua/TutorialStrings.lua')

-----------------
-- Common strings
-----------------
IntroChoice_Dialogue = TutorialStrings.IntroChoice_Dialogue
IntroChoice_Title = TutorialStrings.IntroChoice_Title
IntroChoice_MapInfo = TutorialStrings.IntroChoice_MapInfo
IntroChoice_ExampleBO = TutorialStrings.IntroChoice_ExampleBO
IntroChoice_TryBO = TutorialStrings.IntroChoice_TryBO
StartBuildOrder = TutorialStrings.StartBuildOrder



---------------------
-- Cinematic map info
---------------------
MapInfo = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_MapInfo_1>[{i TrainingOfficer}]: Welcome to this Supreme Commander Forged Alliance Forever map tutorial. This tutorial will teach you about the map Summer Duel. Let\'s get started.',
        vid = 'FAF_TUT_SummerDuel_BO_MapInfo_1.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_MapInfo_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_MapInfo_2>[{i TrainingOfficer}]: Summer Duel is a 5x5km map. As most 5x5km maps it\'s all about the T1 land spam. For now let\'s take a look at the key features of the map.',
        vid = 'FAF_TUT_SummerDuel_BO_MapInfo_2.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_MapInfo_2', faction = 'UEF'
    },
}

StartPosition = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_StartPosition>[{i TrainingOfficer}]: Your starting position has 4 Mass Extractors (mex) and a close hydro.',
        vid = 'FAF_TUT_SummerDuel_BO_StartPosition.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_StartPosition', faction = 'UEF'
    },
}

Stones = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_Stones>[{i TrainingOfficer}]: There are quite a few rocks to reclaim around this hill. Make sure to get them as soon as possible to boost your economy.',
        vid = 'FAF_TUT_SummerDuel_BO_Stones.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_Stones', faction = 'UEF'
    },
}

MainRoute = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_MainRoute>[{i TrainingOfficer}]: Summer duel is defined by 3 choke points. This one is the direct route to your opponent\'s base and therefore the main battleground.',
        vid = 'FAF_TUT_SummerDuel_BO_MainRoute.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_MainRoute', faction = 'UEF'
    },
}

NorthernChoke = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_NorthernChoke>[{i TrainingOfficer}]: By using the side passes you can sneak some raiding parties around your opponent\'s main force.',
        vid = 'FAF_TUT_SummerDuel_BO_NorthernChoke.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_NorthernChoke', faction = 'UEF'
    },
}

SouthernChoke = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_SouthernChoke>[{i TrainingOfficer}]: But be careful to not get raided yourself. You can wall of the area if you want.',
        vid = 'FAF_TUT_SummerDuel_BO_SouthernChoke.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_SouthernChoke', faction = 'UEF'
    },
}

ACURush = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_ACURush_1>[{i TrainingOfficer}]: A common strategy on this map is to rush the enemy base with the ACU before building a second factory. To counter that, it is important to identify the rush in time.',
        vid = 'FAF_TUT_SummerDuel_BO_ACURush_1.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_ACURush_1', faction = 'UEF'
    },
	{
        text = '<LOC FAF_TUT_SummerDuel_BO_ACURush_2>[{i TrainingOfficer}]: Therefore you send an early t1 landscout to the choke, as you will see in the buildorder. If the scout sees the ACU or gets killed you immediately build a T1 Point Defense (PD) in your base, before building further factories.',
        vid = 'FAF_TUT_SummerDuel_BO_ACURush_2.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_ACURush_2', faction = 'UEF'
    },
}



--------------
-- Build order
--------------
LandFirst = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_LandFirst_1>[{i TrainingOfficer}]: A Land Factory is built first, followed by 1 Power Generator and 4 mexes. Then set a move command for the ACU towards the hydro and let it assist the second engie.',
        vid = 'FAF_TUT_SummerDuel_BO_LandFirst_1.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_LandFirst_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_LandFirst_2>[{i TrainingOfficer}]: The Land Factory builds 3 Engineers (engies), 1 tank, 2 Landscouts, 2 engies and then a mix of 2 tanks and 1 engie on repeat.',
        vid = 'FAF_TUT_SummerDuel_BO_LandFirst_2.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_LandFirst_2', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_LandFirst_3>[{i TrainingOfficer}]: Changing factory rally point will also affect which way the units will leave the factory, you can save some time by that.',
        vid = 'FAF_TUT_SummerDuel_BO_LandFirst_3.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_LandFirst_3', faction = 'UEF'
    },
}

FirstEngineer = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_FirstEngineer>[{i TrainingOfficer}]: The first engie builds the hydro and then mix of pgens and factories.',
        vid = 'FAF_TUT_SummerDuel_BO_FirstEngineer.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_FirstEngineer', faction = 'UEF'
    },
}

SecondEngineer = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_SecondEngineer_1>[{i TrainingOfficer}]: The second engie expands south towards the reclaim field and builds the mex on the way.',
        vid = 'FAF_TUT_SummerDuel_BO_SecondEngineer_1.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_SecondEngineer_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_SecondEngineer_2>[{i TrainingOfficer}]: It\'s quite important to not lose this engie as the rocks give you good amount of mass. Your first tank will protect this engie.',
        vid = 'FAF_TUT_SummerDuel_BO_SecondEngineer_2.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_SecondEngineer_2', faction = 'UEF'
    },
}

ThirdEngineer = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_ThirdEngineer>[{i TrainingOfficer}]: Your third engie builds 2 mexes by heading north and then comes back towards the middle and builds the last mex there, and a T1 Radar.',
        vid = 'FAF_TUT_SummerDuel_BO_ThirdEngineer.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_ThirdEngineer', faction = 'UEF'
    },
}

TankScout = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_TankScout>[{i TrainingOfficer}]: Send the first tank and scout to protect your engineer reclaiming the rocks.',
        vid = 'FAF_TUT_SummerDuel_BO_TankScout.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_TankScout', faction = 'UEF'
    },
}

SecondScout = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_SecondScout_1>[{i TrainingOfficer}]: The second scout gets sent to the middle to spot an incoming ACU rush, as it was explained in the map info.',
        vid = 'FAF_TUT_SummerDuel_BO_SecondScout_1.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_SecondScout_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_SecondScout_2>[{i TrainingOfficer}]: If you spot an incoming ACU, cancel the current build queue and build a T1 PD immediately.',
        vid = 'FAF_TUT_SummerDuel_BO_SecondScout_2.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_SecondScout_2', faction = 'UEF'
    },
}

SecondFactory = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_SecondFactory>[{i TrainingOfficer}]: The second Land Factory will be your main factory. Queue up a mix of 5 tanks, 1 scout, 2 arties and set the waypoint towards the middle choke point. Don\'t forget to set the factory on a repeat build!',
        vid = 'FAF_TUT_SummerDuel_BO_SecondFactory.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_SecondFactory', faction = 'UEF'
    },
}

FourthEngineer = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_FourthEngineer>[{i TrainingOfficer}]: The fourth engie will assist the first one with building your base.',
        vid = 'FAF_TUT_SummerDuel_BO_FourthEngineer.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_FourthEngineer', faction = 'UEF'
    },
}

FithEngineer = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_FithEngineer>[{i TrainingOfficer}]: The fifth engie builds the untaken mex in the south. After that the southern mex in the mid choke.',
        vid = 'FAF_TUT_SummerDuel_BO_FithEngineer.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_FithEngineer', faction = 'UEF'
    },
}

DualTank = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_DualTank>[{i TrainingOfficer}]: The 2 tanks which are built now will protect the northern choke.',
        vid = 'FAF_TUT_SummerDuel_BO_DualTank.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_DualTank', faction = 'UEF'
    },
}

ACUMove = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_ACUMove>[{i TrainingOfficer}]: After the third factory is finished the ACU goes straight through the mid choke towards the enemy base. Now you set the waypoint of your factories close to the enemy base.That way the tanks arrive fast at the front to assist your ACU.',
        vid = 'FAF_TUT_SummerDuel_BO_ACUMove.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_ACUMove', faction = 'UEF'
    },
}

SixthEngineer = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_SixthEngineer>[{i TrainingOfficer}]: The sixth engie will also assist with building the base.',
        vid = 'FAF_TUT_SummerDuel_BO_SixthEngineer.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_SixthEngineer', faction = 'UEF'
    },
}

SeventhEngineer = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_SeventhEngineer>[{i TrainingOfficer}]: The seventh engie tries to take the northern mid choke mex.',
        vid = 'FAF_TUT_SummerDuel_BO_SeventhEngineer.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_SeventhEngineer', faction = 'UEF'
    },
}

AirFactory = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_AirFactory>[{i TrainingOfficer}]: The Air Factory builds a queue of 1 air scout and 3 interceptors (inties). The first air scout is done shortly before your ACU arrives at the enemy base, use it and scout what your opponent has before you attack.',
        vid = 'FAF_TUT_SummerDuel_BO_AirFactory.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_AirFactory', faction = 'UEF'
    },
}

FollowUp = {
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_FollowUp_1>[{i TrainingOfficer}]: You are putting a great pressure on your opponent now, keep on spamming the units and try to reclaim the wrecks with engies, that way you will take the victory.',
        vid = 'FAF_TUT_SummerDuel_BO_FollowUp_1.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_FollowUp_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_SummerDuel_BO_FollowUp_2>[{i TrainingOfficer}]: However don\'t be tempted to upgrade a mex as it is a big investment, which could, done at the wrong time, delay your unit production and lose you the game. Better invest spare mass into more Land Factories and tanks. Good Luck commander!',
        vid = 'FAF_TUT_SummerDuel_BO_FollowUp_2.sfd', bank = 'FAF_TUT_SummerDuel_BO_VO', cue = 'FAF_TUT_SummerDuel_BO_FollowUp_2', faction = 'UEF'
    },
    TutorialStrings.EndBuildOrder[1],
}
