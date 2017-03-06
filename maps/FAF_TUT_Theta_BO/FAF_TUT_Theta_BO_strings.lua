Intro_Choice = {
    {text = '[Training Officer]: Welcome commander, choose if you want to hear the basic information about the map, watch an example build order or try the build order yourself.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

---------------------
-- Cinematic map info
---------------------

MapInfo = {
    {text = '[Training Officer]: Welcome to this Supreme Commander Forged Alliance Forever map tutorial. This tutorial will teach you about the classic 1v1 map Theta passage. Let\'s get started.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: Theta is a 5x5 land map, the smallest basic size map in Forged Alliance. The most important strategy to learn for this map is T1 land spam which we will show you shortly. For now let\'s take a look at the key features of the map.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

StartPosition = {
    {text = '[Training Officer]: You start in one corner of the map with 4 Mass Extractors close and a Hydrocarbon Power Plant. It is important to integrate the Hydrocarbon Power Plant into your opening build order because it is more efficient than T1 Power Generators.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ReclaimNearBase = {
    {text = '[Training Officer]: These three reclaim fields are important to boost your early land production.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ReclaimMiddle = {
    {text = '[Training Officer]: The rocks around the arch in the middle are useful, it\'s even better if you can steal the rocks on your opponents side of the arch.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

MiddleWrecks = {
    {text = '[Training Officer]: The wrecks above the arch however have very little mass in them, don\'t waste time trying to reclaim them.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

InfoAboutMiddle = {
    {text = '[Training Officer]: Raids can often move through this passage, build a wall to block invaders or send your own units through to raid your opponent\'s Mass Extractors.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

BottomPassage = {
    {text = '[Training Officer]: There are also rocks to reclaim in this area. A wall or point defence will stop intruders. Early raiding through this passage can deny several Mass Extractors, take care not to get raided from this position.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

NorthPart = {
    {text = '[Training Officer]: The open area at the north is the most important area of the map, it will be where the largest fights will happen. Keep you commander in this area and support him with the majority of your army.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

NorthPlateau = {
    {text = '[Training Officer]: The plateau above contains 2 Mass Extractors which are the most contested Mass Extractors. They are also the easiest to secure if you can grab them thanks to the small choke point units will have to use to reach them.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

NorthPlateau2 = {
    {text = '[Training Officer]: If you can secure these two Mass Extractors for example with a Point Defense, you will have the map control advantage. Mantain this map control and you will be well on your way to winning the game.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

StartBuildOrder = {
    {text = '[Training Officer]: Let\'s watch some example build order now.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: Hold down your \'SHIFT\' key to see the command queue of the units. You can also select the ACU, Engineers or factories to see their build queue. In case you need a bit more time to follow the build order, you can adjust the speed with the \'+\' and \'-\' keys, or Pause the game with the \'II\'-Button on the top middle of the screen.', vid = '', bank = '', cue = '', faction = 'UEF'},
}



--------------
-- Build order
--------------



LandFirst = {
    {text = '[Training Officer]: A Land Factory is built first, followed by a single Power Generator. Then 4 Mass Extractors along the way to the Hydrocarbon.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: Be sure to place move orders closer to the Mass Extractors to utilize the full build range of your ACU. Build range is the small yellow circle on your HUD surrounding the ACU.', vid = '', bank = '', cue = '', faction = 'UEF', delay = 5},
    {text = '[Training Officer]: The first Land Factory will build 3 engineers. One for building your base and 2 for expanding. Then 2 tanks and 2 scouts to protect your expanding enginners and/or for raiding enemy engineers.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: After that you can build additional engineers and tanks. On a small map like Theta you should not build only engineers from your first factory since you will never need so many of them.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: Changing a factory\'s rally point will also affect which way the units will leave the factory, you can save some time by doing that.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FirstEngineer = {
    {text = '[Training Officer]: Your first engineer will go to build a Hydrocarbon and then several Land Factories around a Mass Extractor. The ACU will assist it until the Hydrocarbon and at least one more factory are done.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: Always try to place Land Factories around Mass Extractors and Air Factories around Power Generators to fully use the adjacency bonus (cost discount).', vid = '', bank = '', cue = '', faction = 'UEF'},
}

NorthEngineer = {
    {text = '[Training Officer]: Another engineer can expand to the top-left side. It will reclaim few rocks on it\'s way and build Mass Extractors. Try to secure the corner area by building a Point Defense and Walls there.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: Additional radar in that position will help you spot enemy army movement. You can also move the engineer to the corner of the map. If your opponents over runs that position, there\'s a small chance that the engineer will survive and you can start rebuilding right away.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SouthEngineer = {
    {text = '[Training Officer]: Your third engineer will expand to the bottom. Try to secure the area with a Point Defense to deal with enemy attacks more easily.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: This engineer also has an important task of building a T1 Radar next to the hill to give you intel on enemy unit movement.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Raids = {
    {text = '[Training Officer]: Your first two tanks will protect your expanding engineers. Sending a scout with them will help you spot the enemy units sooner and react in time.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: Order the scout to assist the tank instead of ordering a move command to both of them to keep the scout covered behind the tank.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondFactory = {
    {text = '[Training Officer]: Your second Land Factory will produce only attacking units. For the beginning you will need only tanks and scouts. A good ratio is 5 tanks to a single scout. Later you can add an artillery into the mix to deal with enemy Point Defenses.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: Once you build more factories, set them to assist this one. That way you need to set a build queue only on the one factory which will save you more time to micro your units.', vid = '', bank = '', cue = '', faction = 'UEF', delay = 5},
    {text = '[Training Officer]: This is also a time to move your ACU to the middle of the map to get the reclaim from there. Build a Mass Extractor that is on the way.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Training Officer]: Newly built engineers will replace your ACU with building the base.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

MoreTanks = {
    {text = '[Training Officer]: Distributing other tanks will depend on your opponent\'s movement. Reinforce the bottom or top positions as needed. The scout you sent with the first tanks should show you how many units your opponent has in that area.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ACUMiddle = {
    {text = '[Training Officer]: Try to reclaim as much rocks as you can with your ACU in the middle. It\'s very likely that you will encounter your opponent\'s ACU there. Ignore the incoming fire, reclaim what you can and retreat slightly to regroup with your army.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

MiddleRadar = {
    {text = '[Training Officer]: Make sure to build a radar in the middle of the map as well. Once the radar is up, you can use an engineer to reclaim anything that was left in that area.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

EndBuildOrder = {
    {text = '[Training Officer]: Now you should know the basics about this map. It\'s time for you to try the build order yourself.', vid = '', bank = '', cue = '', faction = 'UEF'},
}
