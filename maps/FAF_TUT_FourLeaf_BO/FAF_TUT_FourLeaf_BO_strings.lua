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
    {text = '[{i TrainingOfficer}]: Welcome to this Supreme Commander Forged Alliance Forever map tutorial. This tutorial will teach you about Four Leaf Clover. Let\'s get started.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Four Leaf Clover is a 5x5km land map. This map is all about the reclaim, as you will see. Now let\'s take a look at the key features of the map.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

StartPosition = {
    {text = '[{i TrainingOfficer}]: You start with 4 Mass Extractors (mex) and a close hydro. however they are further spread out than on other maps.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Backdoor = {
    {text = '[{i TrainingOfficer}]: As you saw in the overview already, a big rock in the middle gives each leaf its circle structure. This offers a base around the mountain directly in the back of your base. It is very important to protect this entrance against reaiding units.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

EnemyStartPosition = {
    {text = '[{i TrainingOfficer}]: Your opponent starts in the opposite corver of the map.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Expansions = {
    {text = '[{i TrainingOfficer}]: The empty startpsoitions function as expansions.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

MidReclaim = {
    {text = '[{i TrainingOfficer}]: How i told you earlier Four Leaf Clover is all about the reclaim. There is a huge amount in the middle. Press "Ctrl+Shift" to see the values.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: the total value is 1600 mass or 2 free t2 mex upgrades. So you should invest to get at least half of it.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ReclaimBehindBase = {
    {text = '[{i TrainingOfficer}]: But there is a lot more reclaim than just the middle reclaim, as you can see here.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

OtherReclaimInBase1 = {
    {text = '[{i TrainingOfficer}]: As you can see, it is very spread out, so you have to invest apm to get it.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

OtherReclaimInBase2 = {
    {text = '[{i TrainingOfficer}]: All 4 \'leaves\' are identical, it follows that the reclaim spots in each leaf are also identical.', vid = '', bank = '', cue = '', faction = 'UEF'},
}



--------------
-- Build order
--------------
LandFirst = {
    {text = '[{i TrainingOfficer}]: This buildorder relies on getting some reclaim from mid, if that doesn\'t work you have to reduce the number of engies building factories, however this will be repeated later again.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Land Factory is built first, followed by 2 Power Generators (pgen) and 3 mex. After that 1 more pgen and a Land Factory. Remember to use the full buildrange, by setting a move command in front of the building.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Factory builds 4 engies, 1 tank+scout, 1 engie, 1 tank+scout, after that a mix of 2 engies and 2 tanks.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: After finishing all buildings the ACU will move towards the mid and builds 2 mex on the way. Then you want to deny your enemy´s access to one leaf by building a t1 Point Defence there (t1 pd).', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FirstEngineer = {
    {text = '[{i TrainingOfficer}]: First engie builds 1 mex, the hydro, 1 airfactory, 4 pgens and 4 landfactories.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondEngineer = {
    {text = '[{i TrainingOfficer}]: The second engie goes to the big stockpile of stones and gathers some reclaim. This engie should constantly reclaim stones, they give more mass than reclaiming trees. Once all of the stones have been reclaimed, move it to some other stones to reclaim them.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ThirdEngineer = {
    {text = '[{i TrainingOfficer}]: Third engie tries to get some of the middle mass and expand afterwards.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FourthEngineer = {
    {text = '[{i TrainingOfficer}]: Fourth engie assists the first engie building.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

TankScout1 = {
    {text = '[{i TrainingOfficer}]: The first tank and scout will protect the engie going mid, send them there immediately.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondFactory = {
    {text = '[{i TrainingOfficer}]: The second Land Factory will be your main Land Factory. Queue up a mix of 5 tanks, 1 landscout, 2 arties and set the waypoint towards the middle. But don\'t forget repeat build!', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FithEngineer = {
    {text = '[{i TrainingOfficer}]: The fifth engie expands towards the west and takes all mexes on the way. On the end it builds a radar and a t1 pd to protect the path to the back of your base. Afterwards you can try to expand further.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

AirFactory = {
    {text = '[{i TrainingOfficer}]: This we go for an early t1 bomber to kill engies in the enemy base. Queue up a mix of 1 bomber, 1 scout and 3 inties. The scout will be used to identify targets for the bomber.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

TankScout2 = {
    {text = '[{i TrainingOfficer}]: The second tank and scout will protect the engie expanding west. Send them through the path.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SixthEngineer = {
    {text = '[{i TrainingOfficer}]: Sixth engie assists the second engie to reclaim some stones. This is in case your engie at the middle gets killed or you can\'t get the middle mass for some other reason.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SeventhEngineer = {
    {text = '[{i TrainingOfficer}]: The seventh engie grabs more reclaim.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

BomberScout = {
    {text = '[{i TrainingOfficer}]: Now send your scout and bomber to the enemy base. The scout will arrive there before the bomber, use the vision it gives to manually target engies with your bomber.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FactorySpam = {
    {text = '[{i TrainingOfficer}]: Remember to give every factory an assist command on the second Land Factory you built.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

EighthEngineer = {
    {text = '[{i TrainingOfficer}]: Depending on your mass situation the eighth and ninth engies grab reclaim or expand towards the east where your ACU is.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Powerspam = {
    {text = '[{i TrainingOfficer}]: After your Land Factories are up give one engie the order to build more pgens. The others can be send to front to reclaim wrecks after a fight or build radars.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FollowUp = {
    {text = '[{i TrainingOfficer}]: Now you have to try to secure an expansion. One thing you can also go for is a gun upgrade for your ACU, if you have at least around 400-500 power income. Good Luck commander!', vid = '', bank = '', cue = '', faction = 'UEF'},
}
