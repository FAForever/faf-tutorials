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
    {text = '[{i TrainingOfficer}]: Welcome to this Supreme Commander Forged Alliance Forever map tutorial. This tutorial will teach you about Regor VI Highlands . Let\'s get started.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Regor VI Highlands is a 10x10km land map with unique terrain structure. For now let\'s take a look at the key features of the map.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

StartPosition = {
    {text = '[{i TrainingOfficer}]: The startposition has 4 Mass Extractors (mex) and a hydro.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

LakeToExpansions = {
    {text = '[{i TrainingOfficer}]:Now let\'s take a look at your expansions.', vid = '', bank = '', cue = '', faction = 'UEF'},
	{text = '[{i TrainingOfficer}]:The direct Path to your expanions is limited to hover and amphibious units by this small lake. However that is no problem for the ACU and engis.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ThreeMexExpansion = {
    {text = '[{i TrainingOfficer}]: Directly after the lake is your first expansion with 3 mexes.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

TransportReclaim = {
    {text = '[{i TrainingOfficer}]: On the way to the next expansion is a nice amount of reclaim.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FourMexExpansion = {
    {text = '[{i TrainingOfficer}]: On the far west is another expansion.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

BigPlateau = {
    {text = '[{i TrainingOfficer}]: In the south-west corner is a plateu with 3 mexes and some reclaim in form of civilians. However there are defences, which you have to kill first. When all your mex in your mainbase are on t2, you continue upgrading this ones, because they are very save against raiding.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: You can take this plateau with transports or edgebuilding. Edgebuilding is done by giving the engi a movecommand close to the cliff and then the command to build a factory up the cliff. This works because buildrange is not limited to certain heights.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ImportantStrategicAreas = {
    {text = '[{i TrainingOfficer}]: Now you will be introduced to some basic strategic knowledge of this map.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

MidChoke1 = {
    {text = '[{i TrainingOfficer}]: The mainpath to your oppoents base is quite narrow, but also has some reclaim there, which can give you a nice early boost.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

MidChoke2 = {
    {text = '[{i TrainingOfficer}]: The mid is also the only dry route to the expansions, if you control this position you cut the expansion off reinforcements. This will mostlikely lead to losing them and losing the game. However it is not easy to achieve, but it is more important for you not to lose this position on your side.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FourMexExpansion2 = {
    {text = '[{i TrainingOfficer}]: This expansion is very far away from your mainbase and your mainproduction but close to your opponents mainbase. Therefore you should build defences and at least one factory there.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SmallPlateau = {
    {text = '[{i TrainingOfficer}]: There are also two small Plateaus, which give you nice locations for radar.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Backdoor = {
    {text = '[{i TrainingOfficer}]: There is also a way to the back of your base, keep and eye on there.', vid = '', bank = '', cue = '', faction = 'UEF'},
}



--[[
camera info

MapInfo 
TargetPos: x=274.870483,y=128.478683,z=237.454285
Orientation: 3.141593, 1.540627, 0.0
Zoom: 1119.721558

StartPosition
TargetPos: x=304.101166,y=127.482384,z=443.584534
Orientation: 2.611451, 0.534006, 0.0
Zoom: 104.315979

LakeToExpansions
TargetPos: x=236.702530,y=126.412987,z=410.274109
Orientation: -2.280928, 0.314748, 0.0
Zoom: 125.210365

ThreeMexExpansion
TargetPos: x=139.291992,y=126.760719,z=389.316742
Orientation: -2.205660, 0.488190, 0.0
Zoom: 86.908440

TransportReclaim
TargetPos: x=89.231949,y=127.093925,z=322.520325
Orientation: -2.637630, 0.660758, 0.0
Zoom: 72.405701

FourMexExpansion
TargetPos: x=53.010902,y=127.298424,z=301.310913
Orientation: 2.922335, 0.402685, 0.0
Zoom: 79.684883

BigPlateau
TargetPos: x=45.935917,y=132.501755,z=469.945435
Orientation: -1.125738, 0.465471, 0.0
Zoom: 125.210411

ImportantStrategicAreas
TargetPos: x=260.522156,y=130.139450,z=256.291199
Orientation: 3.141593, 1.527117, 0.0
Zoom: 1026.654175

MidChoke1
TargetPos: x=254.157288,y=130.047913,z=289.102966
Orientation: 2.935425, 0.425714, 0.0
Zoom: 114.803276

MidChoke2
TargetPos: x=289.380585,y=129.767426,z=160.033890
Orientation: 2.896155, 0.422441, 0.0
Zoom: 198.528000

FourMexExpansion2
TargetPos: x=114.573723,y=129.583740,z=239.380447
Orientation: 3.128503, 0.636623, 0.0
Zoom: 286.022461

SmallPlateau
TargetPos: x=37.516712,y=140.879288,z=214.045227
Orientation: -2.742347, 0.660923, 0.0
Zoom: 137.798126

Backdoor
TargetPos: x=427.702606,y=127.967110,z=410.483521
Orientation: 1.819505, 0.766727, 0.0
Zoom: 374.433777

--]]

--------------
-- Build order
--------------
--Replay: http://content.faforever.com/faf/vault/replay_vault/replay.php?id=5906770
LandFirst = {
    {text = '[{i TrainingOfficer}]: Land Factory is built first, followed by 4 mexes and a move command slightly behind the factory, so we can use the full buildrange of the ACU, when it assists the first engi.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FactoryQueue = {
    {text = '[{i TrainingOfficer}]: First factory builds 5 engies, 1 tank + scout and more engies.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: Changing factory rally point will also affect which way the units will leave the factory, you can save some time by that.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FirstEngineer = {
    {text = '[{i TrainingOfficer}]: First engi builds the hydro, 2 pgens, 1 Land Factory (land fac), 1 pgen, 1 Air Factory, 1 pgen, 1 land fac, 1 pgen, 1 landfac, 2 pgens, 1 landfac  and 11 more pgens.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: The first engi gets a lot of orders to save you time later, however the orders of the second engi are very important too. I advise to practice this start a bit, because it is quite apm intensive.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondEngineer = {
    {text = '[{i TrainingOfficer}]: The second engi assists the building hydro, after that it moves around and grabs reclaim, which is very important for your build, so be on point with the commands. After that it takes the mex far east and secures the backdoor to your base.   ', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ThirdEngineer = {
    {text = '[{i TrainingOfficer}]: Third engi is going to take some reclaim and then expand west to build a factory and radar on your first expansion. The mex will be build by your ACU.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FourthEngineer = {
    {text = '[{i TrainingOfficer}]: Fourth engi assists the first engi building factories.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SecondFactory = {
    {text = '[{i TrainingOfficer}]: The second factory will be your main Land factory. Queue up a mix of 5 tanks, 1 landscout, 2 arties and set the waypoint to the mid of the map, there will be the main battleground. But don\'t forget repeat build!', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FithEngineer = {
    {text = '[{i TrainingOfficer}]: The fifth engi also expands west to grab the transport reclaim and build mexes, radar and pd for the second expansion. Again be sure to set a reclaim command on the transport, which gives the most mass.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

TwoTankScout = {
    {text = '[{i TrainingOfficer}]: By now you have 2 tanks and a scout in your base. Send them west to protect the expanding engies.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

AirFactory = {
    {text = '[{i TrainingOfficer}]: The airfactory builds a queue of 1 airscout and 3 intercepters, that way you always have airscouts available and their existence will remind you of scouting.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ACUmovement = {
    {text = '[{i TrainingOfficer}]: After completing the Air Factory the ACU moves west to build the mexes of the expansions. After building the first 3 mexes it can directly head towards the next expansion because we will secure this expansion with the engi we send earlier.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SixthEngineer = {
    {text = '[{i TrainingOfficer}]: Sixth engi tries to get some reclaim from mid. If it survives it builds a radar and some mexes.', vid = '', bank = '', cue = '', faction = 'UEF'},
    {text = '[{i TrainingOfficer}]: A radar in mid is overall pretty important. Rebuild it immedeatly if it was destroyed.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

SeventhEngineer = {
    {text = '[{i TrainingOfficer}]: Seventh engi reclaims the rocks around the small hills.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FactorySpam = {
    {text = '[{i TrainingOfficer}]: Remember to give every following landfactory an assist command on the second one, which builds your landcomposition.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

EighthEngineer = {
    {text = '[{i TrainingOfficer}]: Eighth engi assists the first one building factories.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

NinthEngineer = {
    {text = '[{i TrainingOfficer}]: Ninth engi also grabs reclaim.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

TenththEngineer = {
    {text = '[{i TrainingOfficer}]: Tenth engi takes the single mex oin the way to mid.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FollowingEngies = {
    {text = '[{i TrainingOfficer}]: Send following engies to reclaim around the hills.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FactoriesExpansions = {
    {text = '[{i TrainingOfficer}]: The facotries in your expansions also build the standard landmix. But you have to give them an extra order because you want that units to protect your expansion in the west.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

PreparingDrop = {
    {text = '[{i TrainingOfficer}]: Around the time your first engie finishes his queue, you have enough power to build the transport to drop the plateu. Remember to also drop arty to kill the pds.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

Powerspam = {
    {text = '[{i TrainingOfficer}]: Now it\'s also time to set 1 engi on power spam.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

ACUmovement2 = {
    {text = '[{i TrainingOfficer}]: When the ACU is done building the mexes on the second expansion and the opponent isn\'s pressuring there, the ACU moves to mid to assist the landspam.', vid = '', bank = '', cue = '', faction = 'UEF'},
}

FollowUp = {
    {text = '[{i TrainingOfficer}]: Now youre having a running base and a good amount of land spam going. Next you can either add more land facs or upgrade your mexes one by one with the help of engies. Good Luck commander!', vid = '', bank = '', cue = '', faction = 'UEF'},
}