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
    {text = '[{i TrainingOfficer}]: Welcome to this Supreme Commander Forged Alliance Forever map tutorial. This tutorial will teach you about Eye of the Storm. Let\'s get started.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Eye of the Storm is a 10x10km Land/Water map. This map is very versatile in terms of strategy. All types of units can be useful here, Land, Air and Navy are equally strong. For now let\'s take a look at the key features of the map.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

StartPosition = {
    {text = '[{i TrainingOfficer}]: Here is your starting position with 4 Mass Extractors (mex) and a hydro.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Lamp = {
    {text = '[{i TrainingOfficer}]: This little lamp contains 300 mass, which are very useful to boost your buildorder. There is one in every corner of the map. Hold down Shift+Ctrl to view reclaim counts.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

EastPath1 = {
    {text = '[{i TrainingOfficer}]: The sea is surrounded by small landpaths with small arms, which contain some mexes and reclaim. This one leads to the eastern expansion.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

EastPath2 = {
    {text = '[{i TrainingOfficer}]: Close to the expansion and far away from your mainbase are 5 mex and some reclaim. To get this position and maybe the expansion we will send the ACU here.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SouthPath = {
    {text = '[{i TrainingOfficer}]: Here is the path to the southern expansion. As you can see the 5 mex and reclaim are close to your base so they will be save anyway. No need to send your ACU this way.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Mid = {
    {text = '[{i TrainingOfficer}]: To the way to your opponents base is this island ,which counts as an expansion aswell. 4 mexes and quite some reclaim are very nice to get. Also the island is easy to defend once you secured it.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

OpponentSpawn = {
    {text = '[{i TrainingOfficer}]: This is the starting position of your opponent.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

--[[
camera info

MapInfo
TargetPos: x=270.693970,y=22.075691,z=258.023682
Orientation: 3.141593, 1.555578, 0.0
Zoom: 1251.658447

StartPosition
TargetPos: x=49.448219,y=19.034147,z=62.064301
Orientation: -2.447822, 0.742415, 0.0
Zoom: 88.274414

Lamp
TargetPos: x=86.532219,y=18.039322,z=58.658321
Orientation: -3.092500, 0.421711, 0.0
Zoom: 42.528328

EastPath1
TargetPos: x=200.853485,y=21.619913,z=68.523056
Orientation: 1.956950, 0.722730, 0.0
Zoom: 316.853790

EastPath2
TargetPos: x=329.770294,y=19.796782,z=62.248428
Orientation: 2.369284, 1.069615, 0.0
Zoom: 219.927948

SouthPath
TargetPos: x=64.253471,y=19.609150,z=200.359772
Orientation: -0.477785, 0.557674, 0.0
Zoom: 316.853790

Mid
TargetPos: x=251.938797,y=22.152128,z=260.192413
Orientation: 0.971930, 0.557999, 0.0
Zoom: 183.227753

OpponentSpawn
TargetPos: x=413.718628,y=19.013248,z=413.465912
Orientation: 0.880300, 0.459825, 0.0
Zoom: 263.979126

--]]

--------------
-- Build order
--------------
--Replay: http://content.faforever.com/faf/vault/replay_vault/replay.php?id=6018628
LandFirst = {
    {text = '[{i TrainingOfficer}]: This buildorder will focus on a heavy t1 airspam to gain aircontrol and then use bombers and gunships to deal damage.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Land Factory is built first, followed by 2 Energy Generators (pgen), 3 mexes, 3 pgens and an airfactory.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ACUmovement = {
    {text = '[{i TrainingOfficer}]: After finishing all buildings the ACU will move to the east expansion and secure some mexes and reclaim on the way.', vid = '', bank = '', cue = '', faction = 'UEF'},
}


FactoryQueue = {
    {text = '[{i TrainingOfficer}]: The first Land Factory builds 5 engis, 2x tank+scout, 2-4x times a mix of 2 engis and 2 tanks and after that only engies on repeat.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Changing factory rally point will also affect which way the units will leave the factory, you can save some time by that.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FirstEngineer = {
    {text = '[{i TrainingOfficer}]: First engi takes a mex and then goes to south to build the hydro, 1 airfactory, 7 pgens, 1 airfactory and more pgens.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondEngineer = {
    {text = '[{i TrainingOfficer}]: The second engi assists the first.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ThirdEngineer = {
    {text = '[{i TrainingOfficer}]: Third engi grabs the lamp and expands east grabbing the arms.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FourthEngineer = {
    {text = '[{i TrainingOfficer}]: Fourth engi expands south also grabbing the arms, although don\'t forget to build the t1 pd to protect the path to your base, because at first we wont send a lot of units there.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FithEngineer = {
    {text = '[{i TrainingOfficer}]: The fifth engi goes to mid. Get the reclaim before building the mexes. The mass you reclaimed is safe in your pocket, mexes need to pay off first.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

EngiAirFactory = {
    {text = '[{i TrainingOfficer}]: The airfactory built by the engies builds a queue of 1 scout and 4 inties. We go for a 4:1 ratio here because you are going to have multiple airfactories so you will also have enough scouts with a higher ratio.', vid = '', bank = '', cue = '', faction = 'UEF'},
	{text = '[{i TrainingOfficer}]: The first scout will scout if there is an engi on the way to the mid for your opponent and then fly over the mainbase.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ACUAirFactory = {
    {text = '[{i TrainingOfficer}]: The airfactory, which is build by the ACU gets a queue of 1 bomber, 1 scout and 4 inties. We build the bomber first to get the engi of your opponent which might go to the middle too.', vid = '', bank = '', cue = '', faction = 'UEF'},
	{text = '[{i TrainingOfficer}]: The scout which is built after the bomber will scout the target for the bomber. This can either be the engi heading for the mid or one on the two landpaths. But the one to middle has higher priority. This needs good timing so dont\'t worry if you can\'t manage it the first few times.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

TankScout1 = {
    {text = '[{i TrainingOfficer}]: The first pair protects the engi going south, because its the only engi going there, so we make sure it survives.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

TankScout2 = {
    {text = '[{i TrainingOfficer}]: Second pair of tank+scout protects the engi going east. We have also the ACU going there so this engi has a lower priority than the one going south.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SixthEngineer = {
    {text = '[{i TrainingOfficer}]: Sixth engi builds a landfactory followed by a naval factory.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondFactory = {
   {text = '[{i TrainingOfficer}]: The second factory will be your main Land factory. Queue up a mix of 5 tanks, 1 landscout, 2 arties and set the waypoint to the east expansion to assist your ACU and make sure you can secure it. But don\'t forget repeat build!', vid = '', bank = '', cue = '', faction = 'UEF'},
   {text = '[{i TrainingOfficer}]: Depending on the pressure from the south you can also send some units there if needed.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

AirFactory = {
    {text = '[{i TrainingOfficer}]: The airfactory builds a queue of 1 airscout and 3 intercepters, that way you always have airscouts available and their existence will remind you of scouting.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SeventhEngineer = {
    {text = '[{i TrainingOfficer}]: Seventh engi ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

EighthEngineer = {
    {text = '[{i TrainingOfficer}]: Eighth engi reclaims the stuff around your base.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

NinethEngineer = {
    {text = '[{i TrainingOfficer}]: Nineth engi assists the first engi building power.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ThirdAirFactory = {
    {text = '[{i TrainingOfficer}]: The third airfactory assists one of the others. In case youre having aircontrol you can mix more bombers in to get some damage done or go t2 air for gunships.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

NavalFactory = {
    {text = '[{i TrainingOfficer}]: The navy factories produces only subs for now. We build subs instead of frigates first because they counter frigates and frigates can not raid mexes on EotS. If you manage to kill the navy production of your opponent you can swith to frigates for their radar and Anti Air capabilites.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

MoreLandfactories = {
    {text = '[{i TrainingOfficer}]: When you managed to get some mexes out on the map you can afford to build some more landfactories. You can either build them in your mainbase to preasure the south or in your eastern expansion to preasure the mainbase.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FollowUp = {
    {text = '[{i TrainingOfficer}]: After you have your start settled out, you\'re having a lot of options to go for. T2 air is a good option, because you should win air with your heagy airbuild. However you can also increase your landspam more or go for t2 land.', vid = '', bank = '', cue = '', faction = 'UEF'},
	{text = '[{i TrainingOfficer}]: T2 Navy is also a very strong option, but it is very expensive and you have to make sure to not lose mapcontrol while doing it. Therefore it is an option for the later game. Good Luck Commander! ', vid = '', bank = '', cue = '', faction = 'UEF'},
}