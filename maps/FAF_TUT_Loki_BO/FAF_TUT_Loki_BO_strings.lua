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
    {text = '[Training Officer]: Welcome to this Supreme Commander Forged Alliance Forever map tutorial. This tutorial will teach you about the classic 1v1 map Loki. Let\'s get started.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: Loki is a 10x10km land map, the most played format in 1v1. This map is suitable for a lot of different strategies, but we will stick to T1 landspam at first. For now let\'s take a look at the key features of the map.', vid = '', bank = '', cue = '', faction = 'UEF'},
}


StartPosition = {
    {text = '[Training Officer]: You start in one corner of the map, with 4 Mass Extractors (mexes).', vid = '', bank = '', cue = '', faction = 'UEF'},
}


TwoMexHydro = {
    {text = '[Training Officer]: The back of your base is pretty safe against raiding and the hydro will offer you a nice powerboost.' , vid = '', bank = '', cue = '', faction = 'UEF'},
}


ReclaimNearBase = {
    {text = '[Training Officer]: This reclaim is important to boost your buildorder.', vid = '', bank = '', cue = '', faction = 'UEF'},
}


ThreeMexHillside = {
    {text = '[Training Officer]: Your first and most important expansion is this one. As you can see there are 3 mexes and a lot of reclaim. If you manage to secure it and get engies here to reclaim, you are going to have a strong early game economy. Don\'t rush for the civilians, they don\'t give a lot of mass.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

TwoMexSide = {
    {text = '[Training Officer]: Some more mexes here. Those don\'t really count as an expansion. Most of the time 3 or 4 mexes in one spot are called an "expansion".', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FourMexCorner = {
    {text = '[Training Officer]: Here in the corner is with 4 mexes the biggest expansion on your side of the map.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Pond = {
    {text = '[Training Officer]: There is a small pond between your base and the expansion, which only hover or amphibious units can cross, which means it is difficult to reinforce that position from your mainbase. However it can also be helpful as it blocks ground access to your base, unless enemy hover/amphibious units exist. ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ThreeMexTop = {
    {text = '[Training Officer]: This 3 mex expansion is very close to the one in the corner. If you manage to secure this expansion the one behind is generally protected aside from aerial drops. To achieve that, we will send the ACU to this position. ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Choke = {
    {text = '[Training Officer]: The direct path to the mainbase of your opponent is only a small choke. This is an obstacle for your armies, so better avoid it with bigger forces. If your units are split up by the terrain/buildings, the enemy will find it easy to destroy them.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

PlateauWest = {
    {text = '[Training Officer]: The main area where army manuevers will take place are these plateaus.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

PlateauEast = {
    {text = '', vid = '', bank = '', cue = '', faction = 'UEF'},
}



--------------
-- Build order
--------------
InitialBO = {
    {text = '[Training Officer]: Land Factory is built first, followed by 2 Power Generators (pgens) and 2 Mass Extractors (mex). Then 3 more pgens and 1 Land Factory. After that, again 3 pgens, but this time an Air Factory.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: After finishing all buildings the ACU will move to the Hillside Expansion and build a Land Factory there, before moving up and securing the three Mex Expansion, by building the mexes and a Land Factory.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: Factory builds 3 engineers (engies). Then 1 tank and 1 scouts to protect your expanding engies and/or for raiding enemy engis.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: After that, 3 more engies and 1 tank+scout, then follow this up by an equal mix of engies and tanks.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: Changing factory rally point will also affect which way the units will leave the factory, you can save some time by that.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FirstEngineer = {
    {text = '[Training Officer]: First engie builds the other 2 mexes in the mainbase and then move to the back to build 2 mexes, hydro and a radar. After crossing the pond it secures the expansion.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondEngineer = {
    {text = '[Training Officer]: The second engie grabs some reclaim.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ThirdEngineer = {
    {text = '[Training Officer]: Third engie goes to the Hillside Expansion and builds the mexes, folowed by reclaiming.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

TankScout = {
    {text = '[Training Officer]: Those engies will be protected by your first tank.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondFactory = {
    {text = '[Training Officer]: The second Factory will be your main Land Factory. Queue up a mix of 5 tanks, 1 landscout, 2 arties and set the waypoint out of your base. But don\'t forget repeat build!', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FourthEngineer = {
    {text = '[Training Officer]: Fourth engie expands east. It is likely, that this engie wont be able to secure the 3 mex expnasion, but you might get some mass before the enemy is there to destroy it.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FithEngineer = {
    {text = '[Training Officer]: The fifth engi assists the ACU, until it moves out to get the buildings done faster.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SixthEngineer = {
    {text = '[Training Officer]: Sixth engie also goes to the Hillside Expansion to grab reclaim.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

AirFactory = {
    {text = '[Training Officer]: The Air Factory builds a queue of 1 airscout and 3 intercepters, that way you always have airscouts available and their existence will remind you of scouting.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FactorySpam = {
    {text = '[Training Officer]: By the time your seventh engie is built, the ACU will be done building and leave the base. At that point select both engis in your base and build 3 more pgens and 4 more Land Factories.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

EighthEngineer = {
    {text = '[Training Officer]: Eighth engie assists building the Land Factories, which you give an assist order on the second factory you built.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Powerspam = {
    {text = '[Training Officer]: The next two engies start your Power spam, because you will need a lot of power as soon you get all the reclaim from the Hillside Expansion. Don\'t forget to include one Energy Storage to more easily manage your power situation and to be able to Overcharge with your ACU.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ReclaimFactory = {
    {text = '[Training Officer]: The ACU is now building the factory on the Hillside Expansion. This factory will produce only engies to reclaim the stones as fast as possible.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FollowUp = {
    {text = '[Training Officer]: Now you have a running base and a good amount of land spam going. Multiple options are available; you can either build more Land Factories or upgrade your mexes one by one, assisting with your engies which were previously building factories.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: If you watch replays of high level players on this map you\'re going to notice, that they are using a different buildorder. But that build is more complex and requires more experience. The buildorder you just saw is designed to be simple but still effective. Good Luck Commander!',vid  = '', bank = '', cue = '', faction = 'UEF'},
}