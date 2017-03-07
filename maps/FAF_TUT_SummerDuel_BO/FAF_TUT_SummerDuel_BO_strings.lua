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
    {text = '[{i TrainingOfficer}]: Welcome to this Supreme Commander Forged Alliance Forever map tutorial. This tutorial will teach you about the map Summer Duel. Let\'s get started.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Summer Duel is a 5x5km map. As most 5x5km maps it\'s all about the T1 land spam. For now let\'s take a look at the key features of the map.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

StartPosition = {
    {text = '[{i TrainingOfficer}]: Your starting position has 4 Mass Extranctors (mex) and a close hydro.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Stones = {
    {text = '[{i TrainingOfficer}]: There are quite a few rocks to reclaim around this hill. Make sure to get them as soon as possible to boost your economy.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

MainRoute = {
    {text = '[{i TrainingOfficer}]: Summer duel is defined by 3 choke points. This one is the direct route to your opponent\'s base and therefore the main battleground.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

NorthernChoke = {
    {text = '[{i TrainingOfficer}]: By using the other two chokes you can sneak some raiding parties around the mainforce of your opponent.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SouthernChoke = {
    {text = '[{i TrainingOfficer}]: But be careful to not get raided yourself.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ACURush = {
    {text = '[{i TrainingOfficer}]: A common strategy on this map is to rush the enemy base with the ACU before building a second factory. To counter that, it is important to identify the rush in time.', vid = '', bank = '', cue = '', faction = 'UEF'},
	{text = '[{i TrainingOfficer}]: Therefore you send an early t1 landscout to the choke, as you will see in the buildorder. If the scout sees the ACU or gets killed you immideatly build a t1 point defence in your base, before building further factories.', vid = '', bank = '', cue = '', faction = 'UEF'},
}



--------------
-- Build order
--------------
LandFirst = {
    {text = '[{i TrainingOfficer}]: A Land Factory is built first, followed by 1 Power Generator and 4 mexes. Then set a move command for the ACU towards the hydro and let it assist the second engi.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: The Land Factory builds 3 Enginners (engies), 1 tank, 2 Landscouts, 2 engis and then a mix of 2 tanks and 1 engi on repeat.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Changing factory rally point will also affect which way the units will leave the factory, you can save some time by that.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FirstEngineer = {
    {text = '[{i TrainingOfficer}]: First engi builds the hydro, then 1 pgen, 1 Land factory, 1 pgen, 2 Land factory, 1 pgen, 1 Air factory, 1 landfactory, 1 pgen.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondEngineer = {
    {text = '[{i TrainingOfficer}]: The second engi expands south towards the reclaim field and builds the mex on the way.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ThirdEngineer = {
    {text = '[{i TrainingOfficer}]: Third engi builds 2 mexes by heading north and then comes back towards the middle and builds 1 more mex and a radar.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

TankScout = {
    {text = '[{i TrainingOfficer}]: The tank and 1 scout escort the engie heading south.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondScout = {
    {text = '[{i TrainingOfficer}]: The second scouts gets sent to the mid choke to spot an incoming ACU rush, as it was explained in the Map info.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondFactory = {
    {text = '[{i TrainingOfficer}]: The second factory will be your main Land factory. Queue up a mix of 5 tanks, 1 landscout, 2 arties and set the waypoint towards the mid Choke. But don\'t forget repeat build!', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FourthEngineer = {
    {text = '[{i TrainingOfficer}]: Fourth engi assists the second engi building factories.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FithEngineer = {
    {text = '[{i TrainingOfficer}]: The fifth engi builds the untaken mex in the south. After that the southern mex in the mid choke.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

DualTank = {
    {text = '[{i TrainingOfficer}]: The 2 tanks which are built now will protect the nothern choke.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ACUMove = {
    {text = '[{i TrainingOfficer}]: After the third factory is finished the ACU goes straight through the mid choke towards the enemy base. Now you set the waypoint of your factories close to the enemy base.That way the tanks arrive fast at the front to assist your ACU.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SeventhEngineer = {
    {text = '[{i TrainingOfficer}]: Seventh engi tries to take the northern mid choke mex.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

AirFactory = {
    {text = '[{i TrainingOfficer}]: The airfactory builds a queue of 1 airscout and 3 intercepters. The first airscout is done shortly before your ACU arrives at the enemy base, use it and scout what your opponent has before you attack.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FollowUp = {
    {text = '[{i TrainingOfficer}]: You are putting great pressure on your opponent now, keep on spamming units and try to reclaim the wrecks with engis, that way you will take the victory. However don\'t be temped to upgrade a mex, it is a big investement, which could, done at the wrong time, delay your unit production and make you lose. Good Luck commander!', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: However don\'t be temped to upgrade a mex, it is a big investement, which could, done at the wrong time, delay your unit production and make you lose. Better invest spare mass into more Landfactories and tanks. Good Luck commander!', vid = '', bank = '', cue = '', faction = 'UEF'},
}