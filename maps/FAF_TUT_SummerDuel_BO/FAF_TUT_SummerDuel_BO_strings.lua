Intro_Choice = {
    {text = '[Mephi]: Welcome commander, choose if you want to hear the basic information about the map, watch an example build order or try the build order yourself.', vid = '', bank = '', cue = '', faction = 'UEF'},
}



---------------------
-- Cinematic map info
---------------------



MapInfo = {
    {text = '[Mephi]: Welcome to this Supreme Commander Forged Alliance Forever map tutorial. This tutorial will teach you about Summer Duel. Let\'s get started.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Mephi]: Summer Duel is a 5x5km map. As most 5x5km maps it\'s all about the t1 land spam. For now let\'s take a look at the key features of the map.', vid = '', bank = '', cue = '', faction = 'UEF'},
}


StartPosition = {
    {text = '[Mephi]: Your starting position has 4 Mass Extranctors (mex) and a close hydro.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Stones = {
    {text = '[Mephi]: These stones are very useful for boosting your buildorder.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

MainRoute = {
    {text = '[Mephi]: Summer duel is defined by 3 chokes. This one is the direct route to your opponent\'s base and therefore the main battleground.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

NorthernChoke = {
    {text = '[Mephi]: By using the other two chokes you can sneak some raiding parties around the mainforce of your opponent.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SouthernChoke = {
    {text = '[Mephi]: But be careful to not get raided on your own.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ACURush = {
    {text = '[Mephi]: A common strategy on this map is to rush the enemy base with the ACU before building a second factory. For countering that it is important to identify the rush in time.', vid = '', bank = '', cue = '', faction = 'UEF'},
	{text = '[Mephi]: Therefore you send an early t1 landscout to the choke, as you will see in the buildorder. If the scout sees the ACU or gets killed you immideatly build a t1 point defence in your base, before building further factories.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

StartBuildOrder = {
    {text = '[speed2]: Let\'s watch some example build order now.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[speed2]: Hold down \'SHIFT\' key to see command queue of the units. You can also select the ACU or engineers or factories to see their build queue. In case you need a bit more time to follow the buildorder, you can adjust the speed with \'+\' and \'-\', or Pause the game with the \'II\'-Button on the top middle of the screen.', vid = '', bank = '', cue = '', faction = 'UEF'},
}



--[[
camera info
MapInfo:
TargetPos: x=129.208374,y=64.020119,z=126.918762
Orientation: 3.141593, 1.521431, 0.0
Zoom: 526.437439


StartPosition:
TargetPos: x=33.071827,y=72.900887,z=138.774200
Orientation: -2.689986, 0.700656, 0.0
Zoom: 77.064140

Stones:
TargetPos: x=14.930401,y=73.019951,z=217.513977
Orientation: -1.030832, 0.510851, 0.0
Zoom: 111.027489

MainRoute:
TargetPos: x=124.103745,y=65.342995,z=132.878632
Orientation: 2.323478, 0.363590, 0.0
Zoom: 159.959061

NorthernChoke:
TargetPos: x=121.296486,y=74.650047,z=40.925110
Orientation: 2.523097, 0.379952, 0.0
Zoom: 191.998657

SouthernChoke:
TargetPos: x=126.359154,y=75.228111,z=230.317276
Orientation: 0.746132, 0.281778, 0.0
Zoom: 191.998520

ACURush
TargetPos: x=82.992111,y=69.881401,z=147.765182
Orientation: 1.776968, 0.293077, 0.0
Zoom: 133.266006

StartBuildOrder:
TargetPos: x=129.208374,y=64.020119,z=126.918762
Orientation: 3.141593, 1.521431, 0.0
Zoom: 526.437439

--]]

--------------
-- Build order
--------------

--[[
Replay: http://content.faforever.com/faf/vault/replay_vault/replay.php?id=5872485
--]]
LandFirst = {
    {text = '[Mephi]: Land Factory is built first, followed by 1 Power Generator and 4 mexes. Then set a movecommand for the ACU towards the hydro and let it assist the second engi. ', vid = '', bank = '', cue = '', faction = 'UEF'},
   
}

FactoryQueue = {
    {text = '[Mephi]:  The Land Factory builds 3 Enginners(engis), 1 tank, 2 Landscouts, 2 engis and then a mix of 2 tanks and 1 engi on repeat. ', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Mephi]: Changing factory rally point will also affect which way the units will leave the factory, you can save some time by that.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FirstEngineer = {
    {text = '[Mephi]: First engi builds the hydro, then 1 pgen, 1 Land factory, 1 pgen, 2 Land factory, 1 pgen, 1 Air factory, 1 landfactory, 1 pgen.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondEngineer = {
    {text = '[Mephi]: The second engi expands south towards the reclaim field and builds the mex on the way.  ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ThirdEngineer = {
    {text = '[Mephi]: Third engi builds 2 mexes by heading north and then comes back towards the middle and builds 1 more mex and a radar. ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

TankScout = {
    {text = '[Mephi]: The tank and 1 scout escort the engie heading south. ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondScout = {
    {text = '[Mephi]: The second scouts gets sent to the mid choke to spot an incoming ACU rush, as it was explained in the Map info. ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondFactory = {
    {text = '[Mephi]: The second factory will be your main Land factory. Queue up a mix of 5 tanks, 1 landscout, 2 arties and set the waypoint towards the mid Choke. But don\'t forget repeat build!', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FourthEngineer = {
    {text = '[Mephi]: Fourth engi assists the second engi building factories. ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FithEngineer = {
    {text = '[Mephi]: The fifth engi builds the untaken mex in the south. After that the southern mex in the mid choke. ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

DualTank = {
    {text = '[Mephi]: The 2 tanks which are built now will protect the nothern choke. ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ACUMove = {
    {text = '[Mephi]: After the third factory is finished the ACU goes straight through the mid choke towards the enemy base. Now you set the waypoint of your factories close to the enemy base.That way the tanks arrive fast at the front to assist your ACU. ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SixthEngineer = {
    {text = '[Mephi]: Sixth engi tries to take the northern mid choke mex. ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

AirFactory = {
    {text = '[Mephi]: The airfactory builds a queue of 1 airscout and 3 intercepters. The first airscout is done shortly before your ACU arrives at the enemy base, use it and scout what your opponent has before you attack.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FollowUp = {
    {text = '[Mephi]: You are putting great pressure on your opponent now, keep on spamming units and try to reclaim the wrecks with engis, that way you will take the victory. However don\'t be temped to upgrade a mex, it is a big investement, which could, done at the wrong time, delay your unit production and make you lose. Good Luck commander!', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[Mephi]: However don\'t be temped to upgrade a mex, it is a big investement, which could, done at the wrong time, delay your unit production and make you lose. Better invest spare mass into more Landfactories and tanks. Good Luck commander!', vid = '', bank = '', cue = '', faction = 'UEF'},
}