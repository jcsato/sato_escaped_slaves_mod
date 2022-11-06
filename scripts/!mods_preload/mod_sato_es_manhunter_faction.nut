local gt = getroottable();

local max = 0;
foreach(key, value in ::Const.EntityType) {
	if (typeof value == "integer" && value > max)
		max = value; 
}

gt.Const.EntityType.SatoManhunter <- ++max;
gt.Const.Strings.EntityName.push("Manhunter");
gt.Const.Strings.EntityNamePlural.push("Manhunters");
gt.Const.EntityIcon.push("manhunter_orientation"); // I believe this is the pre-battle image, needed for e.g. height level display. Will need to come up with an asset

gt.Const.EntityType.SatoManhunterVeteran <- ++max;
gt.Const.Strings.EntityName.push("Manhunter Veteran");
gt.Const.Strings.EntityNamePlural.push("Manhunter Veterans");
gt.Const.EntityIcon.push("manhunter_veteran_orientation");

gt.Const.EntityType.SatoSlaveCatcher <- ++max;
gt.Const.Strings.EntityName.push("Slave Catcher");
gt.Const.Strings.EntityNamePlural.push("Slave Catchers");
gt.Const.EntityIcon.push("slavecatcher_orientation");

gt.Const.Strings.SatoManhunterVeteranTitles <- [
	"the Blight",
	"the Iron Shackle",
	"the Steel Shackle",
	"the Reclaimer",
	"the Relentless",
	"the Hyena",
	"the Gilder\'s Watchdog",
	"the Tracker",
	"the Pursuer",
	"the Cruel",
	"the Gilder\'s Chain",
	"the Slave Catcher",
	"the Manhunter",
	"the Brute",
	"the Silver Manacle",
	"the Dog"
]

// faction_manhunter
gt.Const.Tactical.Actor.SatoManhunter <- {
	XP = 225,
	ActionPoints = 9,
	Hitpoints = 80,
	Bravery = 60,
	Stamina = 110,
	MeleeSkill = 75,
	RangedSkill = 55,
	MeleeDefense = 15,
	RangedDefense = 10,
	Initiative = 125,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 18
};

gt.Const.Tactical.Actor.SatoManhunterVeteran <- {
	XP = 350,
	ActionPoints = 9,
	Hitpoints = 105,
	Bravery = 70,
	Stamina = 115,
	MeleeSkill = 75,
	RangedSkill = 55,
	MeleeDefense = 20,
	RangedDefense = 10,
	Initiative = 150,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 18
};

gt.Const.Tactical.Actor.SatoManhunterRanged <- {
	XP = 200,
	ActionPoints = 9,
	Hitpoints = 60,
	Bravery = 65,
	Stamina = 105,
	MeleeSkill = 50,
	RangedSkill = 70,
	MeleeDefense = 10,
	RangedDefense = 15,
	Initiative = 90,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 18
};

gt.Const.Tactical.Actor.SatoManhunterVeteranRanged <- {
	XP = 350,
	ActionPoints = 9,
	Hitpoints = 75,
	Bravery = 75,
	Stamina = 125,
	MeleeSkill = 55,
	RangedSkill = 75,
	MeleeDefense = 10,
	RangedDefense = 15,
	Initiative = 105,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 18
};

gt.Const.Tactical.Actor.SatoSlaveCatcher <- {
	XP = 350,
	ActionPoints = 9,
	Hitpoints = 90,
	Bravery = 65,
	Stamina = 105,
	MeleeSkill = 70,
	RangedSkill = 50,
	MeleeDefense = 5,
	RangedDefense = 5,
	Initiative = 160,
	FatigueEffectMult = 1.0,
	MoraleEffectMult = 1.0,
	Armor = [
		0,
		0
	],
	FatigueRecoveryRate = 15
};

// spawnlist_master
gt.Const.World.Spawn.Troops.SatoManhunter				<- {	ID = gt.Const.EntityType.SatoManhunter,			Variant = 0,	Strength = 20,	Cost = 20,	Row = 0,	Script = "scripts/entity/tactical/humans/sato_manhunter" }
gt.Const.World.Spawn.Troops.SatoManhunterVeteran		<- {	ID = gt.Const.EntityType.SatoManhunterVeteran,	Variant = 1,	Strength = 25,	Cost = 30,	Row = 0,	Script = "scripts/entity/tactical/humans/sato_manhunter_veteran",	NameList = gt.Const.Strings.SouthernNames,	TitleList = gt.Const.Strings.SatoManhunterVeteranTitles }
gt.Const.World.Spawn.Troops.SatoSlaveCatcher			<- {	ID = gt.Const.EntityType.SatoSlaveCatcher,		Variant = 1,	Strength = 25,	Cost = 30,	Row = 0,	Script = "scripts/entity/tactical/humans/sato_slave_catcher",	NameList = gt.Const.Strings.SouthernNames }
gt.Const.World.Spawn.Troops.SatoManhunterRanged			<- {	ID = gt.Const.EntityType.SatoManhunter,			Variant = 0,	Strength = 20,	Cost = 20,	Row = 1,	Script = "scripts/entity/tactical/humans/sato_manhunter_ranged" }
gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged	<- {	ID = gt.Const.EntityType.SatoManhunterVeteran,	Variant = 1,	Strength = 25,	Cost = 25,	Row = 1,	Script = "scripts/entity/tactical/humans/sato_manhunter_veteran_ranged",	NameList = gt.Const.Strings.SouthernNames,	TitleList = gt.Const.Strings.SatoManhunterVeteranTitles }

// spawnlist_manhunters
gt.Const.World.Spawn.SatoManhunters <- [
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 1 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 1 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 1 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 7 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 1 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 9 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 8 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 1 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 1 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 1 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 8 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 8 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 2 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 8 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 9 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 10 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 10 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 9 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 7 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 3 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 8 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 8 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 8 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 10 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 10 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 1 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 8 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 13 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 10 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 12 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 9 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 5 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 12 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 9 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 9 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 9 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 9 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 10 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 9 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 5 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 9 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 9 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 10 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 10 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 10 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 10 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 10 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 10 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 15 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 6 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 13 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 14 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 15 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 4 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 9 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 10 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunter, Num = 2 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 10 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 10 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 9 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 8 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 3 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 8 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterRanged, Num = 2 },
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 11 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 10 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 7 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 7 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 8 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 8 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 9 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 9 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 10 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 10 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 10 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 11 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 8 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 11 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 9 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 11 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 10 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 11 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 8 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 13 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 4 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 6 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 11 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 11 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 11 }
		]
	},
	{
		Body = "figure_nomad_01",
		Troops = [
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteran, Num = 11 },
			{ Type = gt.Const.World.Spawn.Troops.SatoSlaveCatcher, Num = 11 },
			{ Type = gt.Const.World.Spawn.Troops.SatoManhunterVeteranRanged, Num = 11 }
		]
	}
];

function onCostCompare( _t1, _t2 )
{
	if (_t1.Cost < _t2.Cost)
	{
		return -1;
	}
	else if (_t1.Cost > _t2.Cost)
	{
		return 1;
	}

	return 0;
}

function calculateCosts( _p )
{
	foreach( p in _p )
	{
		p.Cost <- 0;

		foreach( t in p.Troops )
			p.Cost += t.Type.Cost * t.Num;

		if (!("MovementSpeedMult" in p))
			p.MovementSpeedMult <- 1.0;

		if (!("VisibilityMult" in p))
			p.VisibilityMult <- 1.0;

		if (!("VisionMult" in p))
			p.VisionMult <- 1.0;
	}

	_p.sort(onCostCompare);
}

calculateCosts(gt.Const.World.Spawn.SatoManhunters);
