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
EndBuildOrder = TutorialStrings.EndBuildOrder



---------------------
-- Cinematic map info
---------------------
MapInfo = {
    {text = '[{i TrainingOfficer}]: Welcome to this Supreme Commander Forged Alliance Forever map tutorial. This tutorial will teach you about the classic 1v1 map Theta passage. Let\'s get started.', vid = 'FAF_TUT_Theta_BO_MapInfo_1.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'MapInfo_1', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Theta is a 5x5 land map, the smallest basic size map in Forged Alliance. The most important strategy to learn for this map is T1 land spam which we will show you shortly. For now let\'s take a look at the key features of the map.', vid = 'FAF_TUT_Theta_BO_MapInfo_2.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'MapInfo_2', faction = 'UEF'},
}

StartPosition = {
    {text = '[{i TrainingOfficer}]: You start in one corner of the map with 4 Mass Extractors close and a Hydrocarbon Power Plant. It is important to integrate the Hydrocarbon Power Plant into your opening build order because it is more efficient than T1 Power Generators.', vid = 'FAF_TUT_Theta_BO_StartPosition.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'StartPosition', faction = 'UEF'},
}

ReclaimNearBase = {
    {text = '[{i TrainingOfficer}]: These three reclaim fields are important to boost your early land production.', vid = 'FAF_TUT_Theta_BO_ReclaimNearBase.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'ReclaimNearBase', faction = 'UEF'},
}

ReclaimMiddle = {
    {text = '[{i TrainingOfficer}]: The rocks around the arch in the middle are useful, it\'s even better if you can steal the rocks on your opponents side of the arch.', vid = 'FAF_TUT_Theta_BO_ReclaimMiddle.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'ReclaimMiddle', faction = 'UEF'},
}

MiddleWrecks = {
    {text = '[{i TrainingOfficer}]: The wrecks above the arch however have very little mass in them, don\'t waste time trying to reclaim them.', vid = 'FAF_TUT_Theta_BO_MiddleWrecks.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'MiddleWrecks', faction = 'UEF'},
}

InfoAboutMiddle = {
    {text = '[{i TrainingOfficer}]: Raids can often move through this passage, build a wall to block invaders or send your own units through to raid your opponent\'s Mass Extractors.', vid = 'FAF_TUT_Theta_BO_InfoAboutMiddle.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'InfoAboutMiddle', faction = 'UEF'},
}

BottomPassage = {
    {text = '[{i TrainingOfficer}]: There are also rocks to reclaim in this area. A wall or point defence will stop intruders. Early raiding through this passage can deny several Mass Extractors, take care not to get raided from this position.', vid = 'FAF_TUT_Theta_BO_BottomPassage.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'BottomPassage', faction = 'UEF'},
}

NorthPart = {
    {text = '[{i TrainingOfficer}]: The open area at the north is the most important area of the map, it will be where the largest fights will happen. Keep you commander in this area and support him with the majority of your army.', vid = 'FAF_TUT_Theta_BO_NorthPart.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'NorthPart', faction = 'UEF'},
}

NorthPlateau = {
    {text = '[{i TrainingOfficer}]: The plateau above contains 2 Mass Extractors which are the most contested Mass Extractors. They are also the easiest to secure if you can grab them thanks to the small choke point units will have to use to reach them.', vid = 'FAF_TUT_Theta_BO_NorthPlateau.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'NorthPlateau', faction = 'UEF'},
}

NorthPlateau2 = {
    {text = '[{i TrainingOfficer}]: If you can secure these two Mass Extractors for example with a Point Defense, you will have the map control advantage. Mantain this map control and you will be well on your way to winning the game.', vid = 'FAF_TUT_Theta_BO_NorthPlateau2.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'NorthPlateau2', faction = 'UEF'},
}



--------------
-- Build order
--------------
LandFirst = {
    {text = '[{i TrainingOfficer}]: A Land Factory is built first, followed by a single Power Generator. Then 4 Mass Extractors along the way to the Hydrocarbon.', vid = 'FAF_TUT_Theta_BO_LandFirst_1.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'LandFirst_1', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Be sure to place move orders closer to the Mass Extractors to utilize the full build range of your ACU. Build range is the small yellow circle on your HUD surrounding the ACU.', vid = 'FAF_TUT_Theta_BO_LandFirst_2.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'LandFirst_2', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: The first Land Factory will build 3 engineers. One for building your base and 2 for expanding. Then 2 tanks and 2 scouts to protect your expanding enginners and/or for raiding enemy engineers.', vid = 'FAF_TUT_Theta_BO_LandFirst_3.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'LandFirst_3', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: After that you can build additional engineers and tanks. On a small map like Theta you should not build only engineers from your first factory since you will never need so many of them.', vid = 'FAF_TUT_Theta_BO_LandFirst_4.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'LandFirst_4', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Changing a factory\'s rally point will also affect which way the units will leave the factory, you can save some time by doing that.', vid = 'FAF_TUT_Theta_BO_LandFirst_5.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'LandFirst_5', faction = 'UEF'},
}

FirstEngineer = {
    {text = '[{i TrainingOfficer}]: Your first engineer will go to build a Hydrocarbon and then several Land Factories around a Mass Extractor. The ACU will assist it until the Hydrocarbon and at least one more factory are done.', vid = 'FAF_TUT_Theta_BO_FirstEngineer_1.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'FirstEngineer_1', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Always try to place Land Factories around Mass Extractors and Air Factories around Power Generators to fully use the adjacency bonus (cost discount).', vid = 'FAF_TUT_Theta_BO_FirstEngineer_2.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'FirstEngineer_2', faction = 'UEF'},
}

NorthEngineer = {
    {text = '[{i TrainingOfficer}]: Another engineer can expand to the top-left side. It will reclaim few rocks on it\'s way and build Mass Extractors. Try to secure the corner area by building a Point Defense and Walls there.', vid = 'FAF_TUT_Theta_BO_NorthEngineer_1.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'NorthEngineer_1', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Additional radar in that position will help you spot enemy army movement. You can also move the engineer to the corner of the map. If your opponents over runs that position, there\'s a small chance that the engineer will survive and you can start rebuilding right away.', vid = 'FAF_TUT_Theta_BO_NorthEngineer_2.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'NorthEngineer_2', faction = 'UEF'},
}

SouthEngineer = {
    {text = '[{i TrainingOfficer}]: Your third engineer will expand to the bottom. Try to secure the area with a Point Defense to deal with enemy attacks more easily.', vid = 'FAF_TUT_Theta_BO_SouthEngineer_1.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'SouthEngineer_1', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: This engineer also has an important task of building a T1 Radar next to the hill to give you intel on enemy unit movement.', vid = 'FAF_TUT_Theta_BO_SouthEngineer_2.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'SouthEngineer_2', faction = 'UEF'},
}

Raids = {
    {text = '[{i TrainingOfficer}]: Your first two tanks will protect your expanding engineers. Sending a scout with them will help you spot the enemy units sooner and react in time.', vid = 'FAF_TUT_Theta_BO_Raids_1.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'Raids_1', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Order the scout to assist the tank instead of ordering a move command to both of them to keep the scout covered behind the tank.', vid = 'FAF_TUT_Theta_BO_Raids_2.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'Raids_2', faction = 'UEF'},
}

SecondFactory = {
    {text = '[{i TrainingOfficer}]: Your second Land Factory will produce only attacking units. For the beginning you will need only tanks and scouts. A good ratio is 5 tanks to a single scout. Later you can add an artillery into the mix to deal with enemy Point Defenses.', vid = 'FAF_TUT_Theta_BO_SecondFactory_1.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'SecondFactory_1', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Once you build more factories, set them to assist this one. That way you need to set a build queue only on the one factory which will save you more time to micro your units.', vid = 'FAF_TUT_Theta_BO_SecondFactory_2.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'SecondFactory_2', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: This is also a time to move your ACU to the middle of the map to get the reclaim from there. Build a Mass Extractor that is on the way.', vid = 'FAF_TUT_Theta_BO_SecondFactory_3.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'SecondFactory_3', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Newly built engineers will replace your ACU with building the base.', vid = 'FAF_TUT_Theta_BO_SecondFactory_4.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'SecondFactory_4', faction = 'UEF'},
}

MoreTanks = {
    {text = '[{i TrainingOfficer}]: Distributing other tanks will depend on your opponent\'s movement. Reinforce the bottom or top positions as needed. The scout you sent with the first tanks should show you how many units your opponent has in that area.', vid = 'FAF_TUT_Theta_BO_MoreTanks.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'MoreTanks', faction = 'UEF'},
}

ACUMiddle = {
    {text = '[{i TrainingOfficer}]: Try to reclaim as much rocks as you can with your ACU in the middle. It\'s very likely that you will encounter your opponent\'s ACU there. Ignore the incoming fire, reclaim what you can and retreat slightly to regroup with your army.', vid = 'FAF_TUT_Theta_BO_ACUMiddle.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'ACUMiddle', faction = 'UEF'},
}

MiddleRadar = {
    {text = '[{i TrainingOfficer}]: Make sure to build a radar in the middle of the map as well. Once the radar is up, you can use an engineer to reclaim anything that was left in that area.', vid = 'FAF_TUT_Theta_BO_MiddleRadar.sfd', bank = 'FAF_TUT_Theta_BO_VO', cue = 'MiddleRadar', faction = 'UEF'},
}