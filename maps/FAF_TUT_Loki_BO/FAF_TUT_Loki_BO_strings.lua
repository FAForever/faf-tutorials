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
        text = '<LOC FAF_TUT_Loki_BO_MapInfo_1>[{i TrainingOfficer}]: Welcome to this Supreme Commander Forged Alliance Forever map tutorial. This tutorial will teach you about the classic 1v1 map Loki. Let\'s get started.',
        vid = 'FAF_TUT_Loki_BO_MapInfo_1.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_MapInfo_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_Loki_BO_MapInfo_2>[{i TrainingOfficer}]: Loki is a 10x10km land map, the most played format in 1v1. This map is suitable for a lot of different strategies, but we will stick to T1 landspam at first. For now let\'s take a look at the key features of the map.',
        vid = 'FAF_TUT_Loki_BO_MapInfo_2.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_MapInfo_2', faction = 'UEF'
    },
}


StartPosition = {
    {
        text = '<LOC FAF_TUT_Loki_BO_StartPosition>[{i TrainingOfficer}]: You start in one corner of the map, with 4 Mass Extractors (mexes).',
        vid = 'FAF_TUT_Loki_BO_StartPosition.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_StartPosition', faction = 'UEF'
    },
}


TwoMexHydro = {
    {
        text = '<LOC FAF_TUT_Loki_BO_TwoMexHydro>[{i TrainingOfficer}]: The back of your base is pretty safe against raiding and the hydro will offer you a nice powerboost.' ,
        vid = 'FAF_TUT_Loki_BO_TwoMexHydro.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_TwoMexHydro', faction = 'UEF'
    },
}


ReclaimNearBase = {
    {
        text = '<LOC FAF_TUT_Loki_BO_ReclaimNearBase>[{i TrainingOfficer}]: This reclaim is important to boost your buildorder.',
        vid = 'FAF_TUT_Loki_BO_ReclaimNearBase.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_ReclaimNearBase', faction = 'UEF'
    },
}


ThreeMexHillside = {
    {
        text = '<LOC FAF_TUT_Loki_BO_ThreeMexHillside>[{i TrainingOfficer}]: Your first and most important expansion is this one. As you can see there are 3 mexes and a lot of reclaim. If you manage to secure it and get engies here to reclaim, you are going to have a strong early game economy. Don\'t rush for the civilians, they don\'t give a lot of mass.',
        vid = 'FAF_TUT_Loki_BO_ThreeMexHillside.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_ThreeMexHillside', faction = 'UEF'
    },
}

TwoMexSide = {
    {
        text = '<LOC FAF_TUT_Loki_BO_TwoMexSide>[{i TrainingOfficer}]: Some more mexes here. Those don\'t really count as an expansion. Most of the time 3 or 4 mexes in one spot are called an "expansion".',
        vid = 'FAF_TUT_Loki_BO_TwoMexSide.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_TwoMexSide', faction = 'UEF'
    },
}

FourMexCorner = {
    {
        text = '<LOC FAF_TUT_Loki_BO_FourMexCorner>[{i TrainingOfficer}]: Here in the corner with 4 mexes is the biggest expansion on your side of the map.',
        vid = 'FAF_TUT_Loki_BO_FourMexCorner.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_FourMexCorner', faction = 'UEF'
    },
}

Pond = {
    {
        text = '<LOC FAF_TUT_Loki_BO_Pond>[{i TrainingOfficer}]: There is a small pond between your base and the expansion, which only hover or amphibious units can cross, which means it is difficult to reinforce that position from your mainbase. However it can also be helpful as it blocks ground access to your base, unless enemy hover or amphibious units exist. ',
        vid = 'FAF_TUT_Loki_BO_Pond.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_Pond', faction = 'UEF'
    },
}

ThreeMexTop = {
    {
        text = '<LOC FAF_TUT_Loki_BO_ThreeMexTop>[{i TrainingOfficer}]: This 3 mex expansion is very close to the one in the corner. If you manage to secure this expansion the one behind is generally protected aside from aerial drops. To achieve that, we will send the ACU to this position. ',
        vid = 'FAF_TUT_Loki_BO_ThreeMexTop.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_ThreeMexTop', faction = 'UEF'
    },
}

Choke = {
    {
        text = '<LOC FAF_TUT_Loki_BO_Choke>[{i TrainingOfficer}]: The direct path to the mainbase of your opponent is only a small choke. This is an obstacle for your armies, so better avoid it with bigger forces. If your units are split up by the terrain or buildings, the enemy will find it easy to destroy them.',
        vid = 'FAF_TUT_Loki_BO_Choke.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_Choke', faction = 'UEF'
    },
}

PlateauWest = {
    {
        text = '<LOC FAF_TUT_Loki_BO_PlateauWest>[{i TrainingOfficer}]: The main area where army manoeuvres will take place are these plateaus.',
        vid = 'FAF_TUT_Loki_BO_PlateauWest.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_PlateauWest', faction = 'UEF'
    },
}



--------------
-- Build order
--------------
InitialBO = {
    {
        text = '<LOC FAF_TUT_Loki_BO_InitialBO_1>[{i TrainingOfficer}]: A Land Factory is built first, followed by 2 Power Generators (pgens) and 2 Mass Extractors (mexes). Then 3 more pgens and 1 Land Factory. After that, again 3 pgens, but this time an Air Factory.',
        vid = 'FAF_TUT_Loki_BO_InitialBO_1.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_InitialBO_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_Loki_BO_InitialBO_2>[{i TrainingOfficer}]: After finishing all buildings the ACU will move to the Hillside Expansion and build a Land Factory there before moving further to the north.',
        vid = 'FAF_TUT_Loki_BO_InitialBO_2.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_InitialBO_2', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_Loki_BO_InitialBO_3>[{i TrainingOfficer}]: The Factory builds 3 engineers (engies). Then 1 tank and 1 scout to protect your expanding engineers, or for raiding enemy engis.',
        vid = 'FAF_TUT_Loki_BO_InitialBO_3.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_InitialBO_3', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_Loki_BO_InitialBO_4>[{i TrainingOfficer}]: After that, 3 more engies and 1 tank+scout, then follow this up by an equal mix of engies and tanks.',
        vid = 'FAF_TUT_Loki_BO_InitialBO_4.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_InitialBO_4', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_Loki_BO_InitialBO_5>[{i TrainingOfficer}]: Changing factory rally point will also affect which way the units will leave the factory, you can save some time by that.',
        vid = 'FAF_TUT_Loki_BO_InitialBO_5.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_InitialBO_5', faction = 'UEF'
    },
}

FirstEngineer = {
    {
        text = '<LOC FAF_TUT_Loki_BO_FirstEngineer_1>[{i TrainingOfficer}]: The first engie builds the other 2 mexes in the starting position and then takes the western route towards the top left expansion. It will build those 2 mexes and a hydro with radar on it\'s way there.',
        vid = 'FAF_TUT_Loki_BO_FirstEngineer_1.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_FirstEngineer_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_Loki_BO_FirstEngineer_2>[{i TrainingOfficer}]: After crossing the pond, build a Land Factory first to secure the expansion. In case your engineer gets killed it will be faster to rebuild it from that factory rather than having to send a new one from the main base.',
        vid = 'FAF_TUT_Loki_BO_FirstEngineer_2.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_FirstEngineer_2', faction = 'UEF'
    },
}

SecondEngineer = {
    {
        text = '<LOC FAF_TUT_Loki_BO_SecondEngineer>[{i TrainingOfficer}]: The second engie will reclaim the rocks near the base.',
        vid = 'FAF_TUT_Loki_BO_SecondEngineer.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_SecondEngineer', faction = 'UEF'
    },
}

ThirdEngineer = {
    {
        text = '<LOC FAF_TUT_Loki_BO_ThirdEngineer>[{i TrainingOfficer}]: Your third engie should go to the Hillside Expansion and build the mexes there. Once they are up, reclaim the rocks.',
        vid = 'FAF_TUT_Loki_BO_ThirdEngineer.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_ThirdEngineer', faction = 'UEF'
    },
}

TankScout = {
    {
        text = '<LOC FAF_TUT_Loki_BO_TankScout>[{i TrainingOfficer}]: These engies will be protected by your first tank. Send a scout with it to spot the incoming units sooner.',
        vid = 'FAF_TUT_Loki_BO_TankScout.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_TankScout', faction = 'UEF'
    },
}

SecondFactory = {
    {
        text = '<LOC FAF_TUT_Loki_BO_SecondFactory>[{i TrainingOfficer}]: The second Factory will be your main Land Factory. Queue up a mix of 5 tanks, 1 landscout, 2 arties and set the waypoint out of your base. Don\'t forget to set the factory on a repeat build!',
        vid = 'FAF_TUT_Loki_BO_SecondFactory.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_SecondFactory', faction = 'UEF'
    },
}

FourthEngineer = {
    {
        text = '<LOC FAF_TUT_Loki_BO_FourthEngineer>[{i TrainingOfficer}]: Fourth engie expands east. It is likely, that this engie wont be able to secure the 3 mex expansion, but you might get some mass before the enemy is there to destroy it.',
        vid = 'FAF_TUT_Loki_BO_FourthEngineer.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_FourthEngineer', faction = 'UEF'
    },
}

FithEngineer = {
    {
        text = '<LOC FAF_TUT_Loki_BO_FithEngineer>[{i TrainingOfficer}]: Order the fifth engie to assist your ACU to get the buildings done faster.',
        vid = 'FAF_TUT_Loki_BO_FithEngineer.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_FithEngineer', faction = 'UEF'
    },
}

SixthEngineer = {
    {
        text = '<LOC FAF_TUT_Loki_BO_SixthEngineer>[{i TrainingOfficer}]: Your sixth engie also goes to the Hillside Expansion to reclaim rocks.',
        vid = 'FAF_TUT_Loki_BO_SixthEngineer.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_SixthEngineer', faction = 'UEF'
    },
}

AirFactory = {
    {
        text = '<LOC FAF_TUT_Loki_BO_AirFactory>[{i TrainingOfficer}]: The Air Factory builds a queue of 1 Air Scout and 3 Intercepters (inties). That way you always have Air Scouts available and their existence should remind you to scout.',
        vid = 'FAF_TUT_Loki_BO_AirFactory.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_AirFactory', faction = 'UEF'
    },
}

FactorySpam = {
    {
        text = '<LOC FAF_TUT_Loki_BO_FactorySpam_1>[{i TrainingOfficer}]: By the time your seventh engie is built, the ACU will be done building and leaves the base. At that point select both engies in your base and build 3 more pgens and 4 more Land Factories.',
        vid = 'FAF_TUT_Loki_BO_FactorySpam_1.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_FactorySpam_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_Loki_BO_FactorySpam_2>[{i TrainingOfficer}]: The ACU will move to the Hillside Expansion to build a factory there. After that continue to the north for the expansion with 3 mexes.',
        vid = 'FAF_TUT_Loki_BO_FactorySpam_2.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_FactorySpam_2', faction = 'UEF'
    },
}

EighthEngineer = {
    {
        text = '<LOC FAF_TUT_Loki_BO_EighthEngineer_1>[{i TrainingOfficer}]: The eighth engie assists building the Land Factories.',
        vid = 'FAF_TUT_Loki_BO_EighthEngineer_1.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_EighthEngineer_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_Loki_BO_EighthEngineer_2>[{i TrainingOfficer}]: All other Land Factories should assist the second Land Factory.',
        vid = 'FAF_TUT_Loki_BO_EighthEngineer_2.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_EighthEngineer_2', faction = 'UEF'
    },
}

Powerspam = {
    {
        text = '<LOC FAF_TUT_Loki_BO_Powerspam>[{i TrainingOfficer}]: The next two engies will build more pgens, because you will need a lot of power as soon as you get all the reclaim from the Hillside Expansion. Don\'t forget to include one Energy Storage to more easily manage your power situation and to be able to Overcharge with your ACU.',
        vid = 'FAF_TUT_Loki_BO_Powerspam.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_Powerspam', faction = 'UEF'
    },
}

ReclaimFactory = {
    {
        text = '<LOC FAF_TUT_Loki_BO_ReclaimFactory>[{i TrainingOfficer}]: The ACU is now building the factory on the Hillside Expansion. This factory will produce only engies to reclaim the stones as fast as possible.',
        vid = 'FAF_TUT_Loki_BO_ReclaimFactory.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_ReclaimFactory', faction = 'UEF'
    },
}

FollowUp = {
    {
        text = '<LOC FAF_TUT_Loki_BO_FollowUp_1>[{i TrainingOfficer}]: Now you have a running base and a good amount of land spam going. Multiple options are available; you can either build more Land Factories or upgrade your mexes one by one, assisting with your engies which were previously building factories.',
        vid = 'FAF_TUT_Loki_BO_FollowUp_1.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_FollowUp_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_Loki_BO_FollowUp_2>[{i TrainingOfficer}]: If you watch replays of high level players on this map you\'re going to notice, that they are using a different buildorder. But that build is more complex and requires more experience. The buildorder you just saw is designed to be simple but still effective. Good Luck Commander!',
        vid  = 'FAF_TUT_Loki_BO_FollowUp_2.sfd', bank = 'FAF_TUT_Loki_BO_VO', cue = 'FAF_TUT_Loki_BO_FollowUp_2', faction = 'UEF'
    },
}
