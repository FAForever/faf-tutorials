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
        text = '<LOC FAF_TUT_FourLeaf_BO_MapInfo_1>[{i TrainingOfficer}]: Welcome to this Supreme Commander Forged Alliance Forever map tutorial. This tutorial will teach you about the map Four-Leaf Clover. Let\'s get started.',
        vid = 'FAF_TUT_FourLeaf_BO_MapInfo_1.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_MapInfo_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_MapInfo_2>[{i TrainingOfficer}]: Four-Leaf Clover is a 10x10km land map. This map is all about the reclaim, as you will see. Now let\'s take a look at the key features of the map.',
        vid = 'FAF_TUT_FourLeaf_BO_MapInfo_2.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_MapInfo_2', faction = 'UEF'
    },
}

StartPosition = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_StartPosition>[{i TrainingOfficer}]: You start in one of the corners with 4 Mass Extractors (mexes) and a close Hydrocarbon Power Plant (hydro). However they are further spread out than on other maps so make sure to use full build range of your ACU.',
        vid = 'FAF_TUT_FourLeaf_BO_StartPosition.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_StartPosition', faction = 'UEF'
    },
}

Backdoor = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_Backdoor>[{i TrainingOfficer}]: As you saw in the overview already, a big rock in the middle gives each \'leaf\' its circular structure. This offers a way around the mountain directly in the back of your base. It\'s very important to protect this entrance against raiding units.',
        vid = 'FAF_TUT_FourLeaf_BO_Backdoor.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_Backdoor', faction = 'UEF'
    },
}

EnemyStartPosition = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_EnemyStartPosition>[{i TrainingOfficer}]: Your opponent starts in the opposite corner of the map.',
        vid = 'FAF_TUT_FourLeaf_BO_EnemyStartPosition.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_EnemyStartPosition', faction = 'UEF'
    },
}

Expansions = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_Expansions_1>[{i TrainingOfficer}]: The empty starting positions function as expansions.',
        vid = 'FAF_TUT_FourLeaf_BO_Expansions_1.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_Expansions_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_Expansions_2>[{i TrainingOfficer}]: Since the access point to each \'leaf\' is connected only to the middle of the map, the player that manages to take control of the middle has higher chances of securing the expansions and winning the game.',
        vid = 'FAF_TUT_FourLeaf_BO_Expansions_2.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_Expansions_2', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_Expansions_3>[{i TrainingOfficer}]: Using transports to drop units to the expansions is one of the common strategies on this map.',
        vid = 'FAF_TUT_FourLeaf_BO_Expansions_3.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_Expansions_3', faction = 'UEF'
    },
}

MidReclaim = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_MidReclaim_1>[{i TrainingOfficer}]: Now, I told you earlier Four-Leaf Clover is all about the reclaim. There is a huge amount in the middle. Press "Ctrl+Shift" after the cinematics end to see the values.',
        vid = 'FAF_TUT_FourLeaf_BO_MidReclaim_1.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_MidReclaim_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_MidReclaim_2>[{i TrainingOfficer}]: The total value of the middle reclaim is 1600 mass which is enough for 2 T2 mex upgrades. So you should invest to get at least half of it.',
        vid = 'FAF_TUT_FourLeaf_BO_MidReclaim_2.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_MidReclaim_2', faction = 'UEF'
    },
}

ReclaimBehindBase = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_ReclaimBehindBase>[{i TrainingOfficer}]: But there\'s a lot more reclaim around the map than just in the middle, as you can see here.',
        vid = 'FAF_TUT_FourLeaf_BO_ReclaimBehindBase.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_ReclaimBehindBase', faction = 'UEF'
    },
}

OtherReclaimInBase1 = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_OtherReclaimInBase1>[{i TrainingOfficer}]: Groups of rocks can be found around the hills. You will have to spend some APM on that since the engies on attack move or patrol will reclaim trees as well.',
        vid = 'FAF_TUT_FourLeaf_BO_OtherReclaimInBase1.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_OtherReclaimInBase1', faction = 'UEF'
    },
}

OtherReclaimInBase2 = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_OtherReclaimInBase2>[{i TrainingOfficer}]: All 4 \'leaves\' are identical, it follows that the reclaim spots in each \'leaf\' are also identical.',
        vid = 'FAF_TUT_FourLeaf_BO_OtherReclaimInBase2.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_OtherReclaimInBase2', faction = 'UEF'
    },
}



--------------
-- Build order
--------------
LandFirst = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_LandFirst_1>[{i TrainingOfficer}]: This buildorder relies on getting some reclaim from the middle, if that doesn\'t work, you have to reduce the number of engies building factories, however this will be repeated later again.',
        vid = 'FAF_TUT_FourLeaf_BO_LandFirst_1.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_LandFirst_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_LandFirst_2>[{i TrainingOfficer}]: Land Factory is built first, followed by 2 Power Generators (pgen) and 3 mex. After that 1 more pgen and a Land Factory. Remember to use the full build range, by setting a move command in front of the building.',
        vid = 'FAF_TUT_FourLeaf_BO_LandFirst_2.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_LandFirst_2', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_LandFirst_3>[{i TrainingOfficer}]: Factory builds 4 engies, 1 tank+scout, 1 engie, 1 tank+scout, after that a mix of 2 engies and 2 tanks.',
        vid = 'FAF_TUT_FourLeaf_BO_LandFirst_3.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_LandFirst_3', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_LandFirst_4>[{i TrainingOfficer}]: After finishing all buildings the ACU will move towards the middle and build 2 mexes on the way. Then you want to deny your enemy´s access to one leaf by building a T1 Point Defence there (T1 PD).',
        vid = 'FAF_TUT_FourLeaf_BO_LandFirst_4.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_LandFirst_4', faction = 'UEF'
    },
}

FirstEngineer = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_FirstEngineer>[{i TrainingOfficer}]: The first engie builds the last of the core mexes followed by a hydro, an Air Factory, 4 pgens and 4 Land Factories.',
        vid = 'FAF_TUT_FourLeaf_BO_FirstEngineer.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_FirstEngineer', faction = 'UEF'
    },
}

SecondEngineer = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_SecondEngineer>[{i TrainingOfficer}]: The second engie goes to the big stockpile of stones and gathers some reclaim. This engie should constantly reclaim stones, they give more mass than trees. Once all of the stones have been reclaimed, move the engie to some other stones to reclaim them.',
        vid = 'FAF_TUT_FourLeaf_BO_SecondEngineer.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_SecondEngineer', faction = 'UEF'
    },
}

ThirdEngineer = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_ThirdEngineer>[{i TrainingOfficer}]: The third engie tries to get some of the middle mass and expand afterwards.',
        vid = 'FAF_TUT_FourLeaf_BO_ThirdEngineer.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_ThirdEngineer', faction = 'UEF'
    },
}

FourthEngineer = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_FourthEngineer>[{i TrainingOfficer}]: Fourth engie will assist the first one with building your main base.',
        vid = 'FAF_TUT_FourLeaf_BO_FourthEngineer.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_FourthEngineer', faction = 'UEF'
    },
}

TankScout1 = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_TankScout1>[{i TrainingOfficer}]: The first tank and scout will protect the engie going for the middle mass, send them there immediately.',
        vid = 'FAF_TUT_FourLeaf_BO_TankScout1.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_TankScout1', faction = 'UEF'
    },
}

SecondFactory = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_SecondFactory>[{i TrainingOfficer}]: The second Land Factory will be your main Land Factory. Queue up a mix of 5 tanks, 1 landscout, 2 arties and set the waypoint towards the middle. Also don\'t forget to set the factory on a repeat build!',
        vid = 'FAF_TUT_FourLeaf_BO_SecondFactory.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_SecondFactory', faction = 'UEF'
    },
}

FithEngineer = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_FithEngineer>[{i TrainingOfficer}]: The fifth engie expands towards the west and builds all mexes on the way. At the end it builds a radar and a T1 PD to protect the path to the back of your base. Afterwards you can try to expand further.',
        vid = 'FAF_TUT_FourLeaf_BO_FithEngineer.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_FithEngineer', faction = 'UEF'
    },
}

ACUMoveToMid = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_ACUMoveToMid>[{i TrainingOfficer}]: Now that your second Land Factory is finished, the ACU goes to the middle. Always use your ACU early on in the game for securing map control as it is your strongest unit at this stage of the game.',
        vid = 'FAF_TUT_FourLeaf_BO_ACUMoveToMid.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_ACUMoveToMid', faction = 'UEF'
    },
}

AirFactory = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_AirFactory>[{i TrainingOfficer}]: You can try to go for an early T1 bomber to kill engies in the enemy base. Queue up a mix of 1 bomber, 1 scout and 3 interceptors (inties). The scout will be used to identify targets for the bomber.',
        vid = 'FAF_TUT_FourLeaf_BO_AirFactory.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_AirFactory', faction = 'UEF'
    },
}

TankScout2 = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_TankScout2>[{i TrainingOfficer}]: The second tank and scout will protect the engie expanding west.',
        vid = 'FAF_TUT_FourLeaf_BO_TankScout2.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_TankScout2', faction = 'UEF'
    },
}

SixthEngineer = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_SixthEngineer>[{i TrainingOfficer}]: The sixth engie assists the second engie to reclaim some stones. This is in a case your engie at the middle gets killed or you can\'t get the middle mass for some other reason.',
        vid = 'FAF_TUT_FourLeaf_BO_SixthEngineer.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_SixthEngineer', faction = 'UEF'
    },
}

SeventhEngineer = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_SeventhEngineer>[{i TrainingOfficer}]: The seventh engie grabs more reclaim as well.',
        vid = 'FAF_TUT_FourLeaf_BO_SeventhEngineer.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_SeventhEngineer', faction = 'UEF'
    },
}

BomberScout = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_BomberScout>[{i TrainingOfficer}]: Now send your scout and bomber to the enemy base. The scout will arrive there before the bomber, use the vision it gives to manually target engies with your bomber.',
        vid = 'FAF_TUT_FourLeaf_BO_BomberScout.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_BomberScout', faction = 'UEF'
    },
}

FactorySpam = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_FactorySpam>[{i TrainingOfficer}]: Remember to give every other Land Factory an assist command on the second Land Factory you\'ve built.',
        vid = 'FAF_TUT_FourLeaf_BO_FactorySpam.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_FactorySpam', faction = 'UEF'
    },
}

EighthEngineer = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_EighthEngineer>[{i TrainingOfficer}]: Depending on your mass situation the eighth and ninth engies grab reclaim or expand towards the east where your ACU is.',
        vid = 'FAF_TUT_FourLeaf_BO_EighthEngineer.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_EighthEngineer', faction = 'UEF'
    },
}

Powerspam = {
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_Powerspam_1>[{i TrainingOfficer}]: After your Land Factories are up, give one engie the order to build more pgens. The others can be send to the front to reclaim wrecks after a fight, or build radars.',
        vid = 'FAF_TUT_FourLeaf_BO_Powerspam_1.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_Powerspam_1', faction = 'UEF'
    },
    {
        text = '<LOC FAF_TUT_FourLeaf_BO_Powerspam_2>[{i TrainingOfficer}]: Now you have to try to secure an expansion. One thing you can also go for is a gun upgrade on your ACU, if you have at least around 400-500 total power income. Good Luck commander!',
        vid = 'FAF_TUT_FourLeaf_BO_Powerspam_2.sfd', bank = 'FAF_TUT_FourLeaf_BO_VO', cue = 'FAF_TUT_FourLeaf_BO_Powerspam_2', faction = 'UEF', delay = 5
    },
    TutorialStrings.EndBuildOrder[1],
}
