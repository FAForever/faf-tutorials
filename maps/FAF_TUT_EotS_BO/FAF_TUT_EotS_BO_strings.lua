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
        text = '<LOC FAF_TUT_EotS_BO_MapInfo_1>[{i TrainingOfficer}]: Welcome to this Supreme Commander Forged Alliance Forever map tutorial. This tutorial will teach you about the map Eye of the Storm. Let\'s get started.',
        vid = 'FAF_TUT_EotS_BO_MapInfo_1.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_MapInfo_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_EotS_BO_MapInfo_2>[{i TrainingOfficer}]: Eye of the Storm is a 10x10km Land/Water map. This map is very versatile in terms of strategy. All types of units can be useful here, Land, Air and Navy are equally strong. For now let\'s take a look at the key features of the map.',
        vid = 'FAF_TUT_EotS_BO_MapInfo_2.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_MapInfo_2', faction = 'UEF'
    },
}

StartPosition = {
    {
        text = '<LOC FAF_TUT_EotS_BO_StartPosition>[{i TrainingOfficer}]: Here is your starting position with 4 Mass Extractors (mexes) and a hydro.',
        vid = 'FAF_TUT_EotS_BO_StartPosition.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_StartPosition', faction = 'UEF'
    },
}

Lamp = {
    {
        text = '<LOC FAF_TUT_EotS_BO_Lamp>[{i TrainingOfficer}]: This little lamp contains 300 mass, which is a very useful boost to your early economy. There is one in every corner of the map. Hold down Shift+Ctrl to view reclaim numbers.',
        vid = 'FAF_TUT_EotS_BO_Lamp.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_Lamp', faction = 'UEF'
    },
}

EastPath1 = {
    {
        text = '<LOC FAF_TUT_EotS_BO_EastPath1>[{i TrainingOfficer}]: The sea is surrounded by small land paths with small arms, which contain some Mass Extractors (mexes) and reclaim. This one leads to the eastern expansion.',
        vid = 'FAF_TUT_EotS_BO_EastPath1.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_EastPath1', faction = 'UEF'
    },
}

EastPath2 = {
    {
        text = '<LOC FAF_TUT_EotS_BO_EastPath2>[{i TrainingOfficer}]: This area contains 5 Mass Extractors (mexes) and some reclaim. The ACU will be sent here to secure this position, and if possible the nearby expansion as well.',
        vid = 'FAF_TUT_EotS_BO_EastPath2.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_EastPath2', faction = 'UEF'
    },
}

SouthPath = {
    {
        text = '<LOC FAF_TUT_EotS_BO_SouthPath>[{i TrainingOfficer}]: This is the second path that leads to the southern expansion. As you can see, here the 5 Mass Extractors (mexes) and reclaim are closer to your base so they will be relatively safe. No need to send your ACU this way.',
        vid = 'FAF_TUT_EotS_BO_SouthPath.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_SouthPath', faction = 'UEF'
    },
}

Middle = {
    {
        text = '<LOC FAF_TUT_EotS_BO_Middle>[{i TrainingOfficer}]: The island in the middle of the map counts as an expansion as well. The 4 Mass Extractors (mexes) and various reclaimables can give you a nice advantage. Also, the island is quite easy to defend once it has been secured.',
        vid = 'FAF_TUT_EotS_BO_Middle.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_Middle', faction = 'UEF'
    },
}

OpponentSpawn = {
    {
        text = '<LOC FAF_TUT_EotS_BO_OpponentSpawn>[{i TrainingOfficer}]: This is the starting position of your opponent.',
        vid = 'FAF_TUT_EotS_BO_OpponentSpawn.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_OpponentSpawn', faction = 'UEF'
    },
}



--------------
-- Build order
--------------
LandFirst = {
    {
        text = '<LOC FAF_TUT_EotS_BO_LandFirst_1>[{i TrainingOfficer}]: This build order will focus on heavy T1 Air spam to gain early air control, followed by the use of Bombers and Gunships to deal damage.',
        vid = 'FAF_TUT_EotS_BO_LandFirst_1.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_LandFirst_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_EotS_BO_LandFirst_2>[{i TrainingOfficer}]: A Land Factory is built first, followed by 2 Power Generators (pgens), 3 Mass Extractors (mexes), 3 more pgens and an Air Factory.',
        vid = 'FAF_TUT_EotS_BO_LandFirst_2.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_LandFirst_2', faction = 'UEF'
    },
}

ACUMove = {
    {
        text = '<LOC FAF_TUT_EotS_BO_ACUMove>[{i TrainingOfficer}]: After finishing its build queue, the ACU will move to the east expansion. Secure some Mass Extractors (mexes) and reclaim the big rocks on the way there.',
        vid = 'FAF_TUT_EotS_BO_ACUMove.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_ACUMove', faction = 'UEF'
    },
}

FactoryQueue = {
    {
        text = '<LOC FAF_TUT_EotS_BO_FactoryQueue_1>[{i TrainingOfficer}]: The first Land Factory builds 5 Engineers (engis), 2x Tank + Scout, 2-4x times a mix of 2 engies and 2 tanks and after that only engies on repeat.',
        vid = 'FAF_TUT_EotS_BO_FactoryQueue_1.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_FactoryQueue_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_EotS_BO_FactoryQueue_2>[{i TrainingOfficer}]: Changing factory rally points will affect which way the units will leave the factory, you can save some time by exploting that mechanic.',
        vid = 'FAF_TUT_EotS_BO_FactoryQueue_2.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_FactoryQueue_2', faction = 'UEF'
    },
}

FirstEngineer = {
    {
        text = '<LOC FAF_TUT_EotS_BO_FirstEngineer>[{i TrainingOfficer}]: The first engineer (engie) builds the last core Mass Extractor (mex) and then goes to the south to build the hydro, an Air Factory and more Power Generators (pgens).',
        vid = 'FAF_TUT_EotS_BO_FirstEngineer.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_FirstEngineer', faction = 'UEF'
    },
}

SecondEngineer = {
    {
        text = '<LOC FAF_TUT_EotS_BO_SecondEngineer>[{i TrainingOfficer}]: The second engineer (engie) assists the first one.',
        vid = 'FAF_TUT_EotS_BO_SecondEngineer.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_SecondEngineer', faction = 'UEF'
    },
}

ThirdEngineer = {
    {
        text = '<LOC FAF_TUT_EotS_BO_ThirdEngineer>[{i TrainingOfficer}]: The third engie reclaims the lamp and expands east, building mexes and radars on the "arms".',
        vid = 'FAF_TUT_EotS_BO_ThirdEngineer.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_ThirdEngineer', faction = 'UEF'
    },
}

FourthEngineer = {
    {
        text = '<LOC FAF_TUT_EotS_BO_FourthEngineer>[{i TrainingOfficer}]: The fourth engie expands south, grabbing the arms along the way. Don\'t forget to build the T1 PD to protect the path to your base, since we wont be sending a lot of units there early on.',
        vid = 'FAF_TUT_EotS_BO_FourthEngineer.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_FourthEngineer', faction = 'UEF'
    },
}

FithEngineer = {
    {
        text = '<LOC FAF_TUT_EotS_BO_FithEngineer>[{i TrainingOfficer}]: The fifth engie goes to the middle island. Get the reclaim before building the mexes. The mass you reclaimed is safe in your pockets, while mexes need to pay for themselves first.',
        vid = 'FAF_TUT_EotS_BO_FithEngineer.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_FithEngineer', faction = 'UEF'
    },
}

EngiAirFactory = {
    {
        text = '<LOC FAF_TUT_EotS_BO_EngiAirFactory>[{i TrainingOfficer}]: The second Air Factory that is built by the engies builds a queue of 1 Scout and 4 inties. We go for a 4:1 ratio here because you are going to have multiple Air Factories so you will also have enough scouts with a higher ratio.',
        vid = 'FAF_TUT_EotS_BO_EngiAirFactory.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_EngiAirFactory', faction = 'UEF'
    },
}

ACUAirFactory = {
    {
        text = '<LOC FAF_TUT_EotS_BO_ACUAirFactory_1>[{i TrainingOfficer}]: The Air Factory built by the ACU build a queue of 1 Bomber, 1 Scout and 4 Interceptors (inties). Build the bomber first to kill the engie of your opponent that might go to the middle island.',
        vid = 'FAF_TUT_EotS_BO_ACUAirFactory_1.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_ACUAirFactory_1', faction = 'UEF'
    },
	{
        text = '<LOC FAF_TUT_EotS_BO_ACUAirFactory_2>[{i TrainingOfficer}]: The Scout that is built after the Bomber will spot the target for the Bomber. This can either be the engie heading for the middle or one of the two engineers expanding to the sides. Keep in mind that the one going to the middle has higher priority. This needs good timing so dont\'t worry if you can\'t execute it the first few times.',
        vid = 'FAF_TUT_EotS_BO_ACUAirFactory_2.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_ACUAirFactory_2', faction = 'UEF'
    },
}

TankScout1 = {
    {
        text = '<LOC FAF_TUT_EotS_BO_TankScout1>[{i TrainingOfficer}]: Send the first Tank and Land Scout to protect the engie going south because it\'s the only one going there. Better make sure it survives.',
        vid = 'FAF_TUT_EotS_BO_TankScout1.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_TankScout1', faction = 'UEF'
    },
}

TankScout2 = {
    {
        text = '<LOC FAF_TUT_EotS_BO_TankScout2>[{i TrainingOfficer}]: The second pair of tank+scout protects the engie going east. Since the ACU is going there as well, this engie has a lower priority than the one going south.',
        vid = 'FAF_TUT_EotS_BO_TankScout2.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_TankScout2', faction = 'UEF'
    },
}

SixthEngineer = {
    {
        text = '<LOC FAF_TUT_EotS_BO_SixthEngineer>[{i TrainingOfficer}]: The sixth engie builds a Land Factory followed by a Naval Factory.',
        vid = 'FAF_TUT_EotS_BO_SixthEngineer.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_SixthEngineer', faction = 'UEF'
    },
}

SecondFactory = {
    {
        text = '<LOC FAF_TUT_EotS_BO_SecondFactory_1>[{i TrainingOfficer}]: The second Land Factory will be your main Land factory. Queue up a mix of 5 Tanks, 1 Land Scout, 2 Artilleries and set the waypoint to the east expansion to assist your ACU to make sure you can secure it. But don\'t forget to set repeat build!',
        vid = 'FAF_TUT_EotS_BO_SecondFactory_1.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_SecondFactory_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_EotS_BO_SecondFactory_2>[{i TrainingOfficer}]: Depending on the pressure from the south you can send some units there if needed.',
        vid = 'FAF_TUT_EotS_BO_SecondFactory_2.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_SecondFactory_2', faction = 'UEF'
    },
}

SeventhEngineer = {
    {
        text = '<LOC FAF_TUT_EotS_BO_SeventhEngineer>[{i TrainingOfficer}]: The seventh engineer will start reclaiming in your base, use the attack move for it. ',
        vid = 'FAF_TUT_EotS_BO_SeventhEngineer.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_SeventhEngineer', faction = 'UEF'
    },
}

EighthEngineer = {
    {
        text = '<LOC FAF_TUT_EotS_BO_EighthEngineer>[{i TrainingOfficer}]: The eighth engie should assist the first one with building power.',
        vid = 'FAF_TUT_EotS_BO_EighthEngineer.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_EighthEngineer', faction = 'UEF'
    },
}

NinethEngineer = {
    {
        text = '<LOC FAF_TUT_EotS_BO_NinethEngineer>[{i TrainingOfficer}]: Nineth engi will do some more recliaming.',
        vid = 'FAF_TUT_EotS_BO_NinethEngineer.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_NinethEngineer', faction = 'UEF'
    },
}

TenthEngineer = {
    {
        text = '<LOC FAF_TUT_EotS_BO_TenthEngineer>[{i TrainingOfficer}]: The tenth engineer will build another Land Factory.',
        vid = 'FAF_TUT_EotS_BO_TenthEngineer.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_TenthEngineer', faction = 'UEF'
    },
}

AirScout1 = {
    {
        text = '<LOC FAF_TUT_EotS_BO_AirScout1>[{i TrainingOfficer}]: Send the first air scout through the middle to find out if there\'s an engineer from your opponent going there. After that fly over the main base.',
        vid = 'FAF_TUT_EotS_BO_AirScout1.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_AirScout1', faction = 'UEF'
    },
}

AirScout2 = {
    {
        text = '<LOC FAF_TUT_EotS_BO_AirScout2>[{i TrainingOfficer}]: Use your Air Scouts to spot engineers you could snipe with Bombers. It\'s also good to see where your opponent\'s ACU is going so you could divert more units to where they\'ll be needed.',
        vid = 'FAF_TUT_EotS_BO_AirScout2.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_AirScout2', faction = 'UEF'
    },
}

ThirdAirFactory = {
    {
        text = '<LOC FAF_TUT_EotS_BO_ThirdAirFactory>[{i TrainingOfficer}]: Your third Air Factory assists one of the others. In case you have air control, you can mix in more Bombers to get more damage done or upgrade the factory to T2 to access Gunships.',
        vid = 'FAF_TUT_EotS_BO_ThirdAirFactory.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_ThirdAirFactory', faction = 'UEF'
    },
}

NavalFactory = {
    {
        text = '<LOC FAF_TUT_EotS_BO_NavalFactory>[{i TrainingOfficer}]: The Naval Factories only produce Submarines (subs) for now. Build submarines instead of Frigates first because they counter Frigates and Frigates can\'t raid any mexes on EotS. If you manage to kill the naval production of your opponent, you can switch to Frigates for their radar and Anti Air capabilites.',
        vid = 'FAF_TUT_EotS_BO_NavalFactory.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_NavalFactory', faction = 'UEF'
    },
}

MoreLandfactories = {
    {
        text = '<LOC FAF_TUT_EotS_BO_MoreLandfactories>[{i TrainingOfficer}]: When you manage to get some mexes out on the map you can afford to build some more Land Factories. You can either build them in your main base to pressure the south, or in your eastern expansion to pressure your opponent\'s main base.',
        vid = 'FAF_TUT_EotS_BO_MoreLandfactories.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_MoreLandfactories', faction = 'UEF'
    },
}

FollowUp = {
    {
        text = '<LOC FAF_TUT_EotS_BO_FollowUp_1>[{i TrainingOfficer}]: After you have your start settled out, you have a lot of options to go for. T2 Air is a good option, because you should win air with your heavy air build. However you can also increase your land spam more or go for T2 Land.',
        vid = 'FAF_TUT_EotS_BO_FollowUp_1.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_FollowUp_1', faction = 'UEF'
    },
	{
        text = '<LOC FAF_TUT_EotS_BO_FollowUp_2>[{i TrainingOfficer}]: T2 Navy is also a very strong option, but it is more expensive and you have to make sure to not lose map control. Therefore it is an option for the later game. Good Luck Commander! ',
        vid = 'FAF_TUT_EotS_BO_FollowUp_2.sfd', bank = 'FAF_TUT_EotS_BO_VO', cue = 'FAF_TUT_EotS_BO_FollowUp_2', faction = 'UEF'
    },
}