sato_escaped_slaves_scenario <- inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		m.ID = "scenario.sato_escaped_slaves";
		m.Name = "Escaped Slaves";
		m.Description = "[p=c][img]gfx/ui/events/event_166.png[/img][/p][p]You lead a group of slaves trying to escape their cruel fate, but you can't run forever. Can you keep your band intact and start a new life as mercenaries?\n\n[color=#bcad8c]Escapees:[/color] Start with five escaped Indebted, and find others held in captivity.\n[color=#bcad8c]Brothers in Chains:[/color] Your Indebted brothers are stronger together and gain skill based on how many you field.\n[color=#bcad8c]Downtrodden and Discarded:[/color] Good relations with any faction decay 15% faster, and bad relations recover 15% slower.[/p]";
		m.Difficulty = 2;
		m.Order = 87;
	}

	function isValid()
	{
		return Const.DLC.Desert;
	}

	function onSpawnAssets()
	{
		local roster = World.getPlayerRoster();

		for( local i = 0; i < 5; i = ++i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = Time.getVirtualTimeF();
		}

		local bros = roster.getAll();
		bros[0].setStartValuesEx([ "slave_background" ]);
		bros[0].getBackground().m.RawDescription = "%name% was a sellsword like yourself before he was enslaved and made a pit fighter. The arena was where you first met him, the two of you saving each other several times in a bout against an unhold. You\'ve been as close as brothers ever since. When you escaped, he was the first to pick up arms and follow. You know he\'ll be the last to put them down, too.";
		bros[0].getBackground().buildDescription(true);
		bros[0].setPlaceInFormation(1);
		bros[0].addLightInjury();
		bros[0].getSprite("miniboss").setBrush("bust_miniboss_indebted");

		local skills = bros[0].getSkills();
		skills.removeByID("trait.dastard");
		skills.removeByID("trait.craven");
		skills.removeByID("trait.fainthearted");
		skills.removeByID("trait.insecure");
		skills.removeByID("trait.fragile");

		if (bros[0].getBaseProperties().Bravery <= 30) {
			bros[0].getBaseProperties().Bravery += 5;
		}

		bros[0].getSkills().add(new("scripts/skills/traits/sato_brothers_in_chains_trait"));
		bros[0].getSkills().add(new("scripts/skills/traits/arena_fighter_trait"));
		bros[0].getFlags().set("ArenaFightsWon", 5);
		bros[0].getFlags().set("ArenaFights", 5);

		bros[0].m.Talents = [];
		local talents = bros[0].getTalents();
		talents.resize(Const.Attributes.COUNT, 0);
		talents[Const.Attributes.Bravery] = 3;
		talents[Const.Attributes.MeleeSkill] = 1;
		talents[Const.Attributes.RangedDefense] = 3;

		bros[0].improveMood(2.5, "Escaped a life of slavery");

		local items = bros[0].getItems();
		addRandomEquipment(items);

		bros[1].setStartValuesEx([ "slave_barbarian_background" ]);
		bros[1].getBackground().m.RawDescription = "A truly massive man, %name% hulks like a boulder and has a face about as pretty. The night you escaped, you personally witnessed the man rip a nomad\'s arm out of its socket and beat an ifrit to rubble with it. When you ask the barbarian what he plans to do with his freedom, he simply responds \'I must slay a god. Fight with you for now.\' You decide it prudent to not press for details.";

		if (Math.rand(1,100 <= 50)) {
			local potentialTitles = [ "the Quiet", "the Reticent", "the Silent", "the Cursed" ];
			bros[1].setTitle(potentialTitles[(Math.rand(0, potentialTitles.len() - 1))]);
		}
		bros[1].getBackground().buildDescription(true);
		bros[1].setPlaceInFormation(2);
		bros[1].getSprite("miniboss").setBrush("bust_miniboss_indebted");

		skills.removeByID("trait.fragile");
		bros[1].getSkills().removeByID("trait.tiny");
		bros[1].getSkills().add(new("scripts/skills/traits/huge_trait"));
		bros[1].getSkills().add(new("scripts/skills/traits/sato_brothers_in_chains_trait"));

		bros[1].m.Talents = [];
		talents = bros[1].getTalents();
		talents.resize(Const.Attributes.COUNT, 0);
		talents[Const.Attributes.Fatigue] = Math.rand(2, 3);
		talents[Const.Attributes.MeleeSkill] = Math.rand(2, 3);
		talents[Const.Attributes.MeleeDefense] = Math.rand(2, 3);

		bros[1].improveMood(2.5, "Escaped a life of slavery");

		items = bros[1].getItems();
		addRandomEquipment(items);

		bros[2].setStartValuesEx([ "slave_southern_background" ]);
		bros[2].getBackground().m.RawDescription = "Formerly a gunner in a city-state regiment, %name% has never quite fit in with the rest of the Indebted. Cast out of the army and branded a heretic for some religious slight he refuses to talk about, the man has never managed to truly lose his disdain for the social strata he now finds himself in. Regardless, he is one of you now, and the man shows enough talent that you\'re willing to overlook his personality.";
		bros[2].getBackground().buildDescription(true);
		bros[2].setPlaceInFormation(3);
		bros[2].addLightInjury();
		bros[2].getSprite("miniboss").setBrush("bust_miniboss_indebted");

		bros[2].getSkills().add(new("scripts/skills/traits/sato_brothers_in_chains_trait"));

		bros[2].m.Talents = [];
		talents = bros[2].getTalents();
		talents.resize(Const.Attributes.COUNT, 0);
		talents[Const.Attributes.Initiative] = 2;
		talents[Const.Attributes.Bravery] = 2;
		talents[Const.Attributes.RangedSkill] = 2;

		bros[2].worsenMood(0.5, "Misses his life in the army");
		bros[2].improveMood(2.5, "Escaped a life of slavery");

		items = bros[2].getItems();
		addRandomEquipment(items);
		items.unequip(items.getItemAtSlot(Const.ItemSlot.Head));
		items.equip(new("scripts/items/helmets/oriental/gunner_hat"));

		bros[3].setStartValuesEx([ "slave_southern_background" ]);
		bros[3].getBackground().m.RawDescription = "If you had to describe %name% in one word, it would be \'ornery.\' Bitter about his life before he was indebted, bitter about his life as a slave, and now bitter about his life on the run. Perhaps that bitterness is what compels him to cling to life so. %name% has taken enough lashings and beatings for three men, endured punishments meant to kill, and even gotten back up after catching an ifrit toss square in the chest. He\'s pretty bitter about that one, too.";
		bros[3].getBackground().buildDescription(true);
		bros[3].setPlaceInFormation(4);
		bros[3].addInjury(Const.Injury.Brawl);
		bros[3].getSprite("miniboss").setBrush("bust_miniboss_indebted");

		bros[3].getSkills().add(new("scripts/skills/traits/survivor_trait"));
		bros[3].getSkills().add(new("scripts/skills/traits/sato_brothers_in_chains_trait"));

		bros[3].worsenMood(1.5, "Feels he deserves better in life");
		bros[3].improveMood(2.5, "Escaped a life of slavery");

		items = bros[3].getItems();
		items.unequip(items.getItemAtSlot(Const.ItemSlot.Head));
		addRandomEquipment(items);

		bros[4].setStartValuesEx([ "slave_southern_background" ]);
		bros[4].getBackground().m.RawDescription = "A scholar in his previous life, %name% was cast into slavery for research that was deemed offensive to the Gilder. The man accepted his new life with a grace few can muster. When the opportunity came to escape with you, however, he took it without hesitation, simply stating that this was the next path he was meant to take. It doesn\'t really make sense to you, but you don\'t care to debate him after seeing how he killed the conscript whose equipment he now wears.";
		bros[4].setTitle("the Sage");
		bros[4].getBackground().buildDescription(true);
		bros[4].setPlaceInFormation(5);
		bros[4].getSprite("miniboss").setBrush("bust_miniboss_indebted");

		bros[4].m.Talents = [];
		talents = bros[4].getTalents();
		talents.resize(Const.Attributes.COUNT, 0);
		talents[Const.Attributes.Fatigue] = Math.rand(2, 3);
		talents[Const.Attributes.MeleeDefense] = Math.rand(2, 3);
		talents[Const.Attributes.RangedDefense] = Math.rand(2, 3);

		bros[4].improveMood(2.5, "Escaped a life of slavery");
		bros[4].getSkills().add(new("scripts/skills/traits/sato_brothers_in_chains_trait"));

		items = bros[4].getItems();
		addRandomEquipment(items, true);

		World.Assets.m.BusinessReputation = 0;
		World.Assets.getStash().add(new("scripts/items/supplies/rice_item"));
		World.Assets.getStash().add(new("scripts/items/supplies/rice_item"));
		World.Assets.m.Money = World.Assets.m.Money - 600;
	}

	function addRandomEquipment(items, shieldSpecific = false) {
		local equipmentRoll = Math.rand(1, 100);
		local getsArmor = equipmentRoll <= 50 ? true : false;
		local getsWeapon = equipmentRoll > 50 ? true : false;

		local equipLowHelmet = false;
		local equipLowArmor = false;
		local equipLowWeapon = false;
		local equipHighHelmet = false;
		local equipHighArmor = false;
		local equipHighWeapon = false;
		local equipAnyHelmet = false;
		local equipAnyArmor = false;
		local equipAnyWeapon = false;

		if (getsArmor) {
			local weaponRoll = Math.rand(1, 100);
			if (weaponRoll <= 33) {
				if (Math.rand(1,100) <= 50) {
					equipAnyArmor = true;
					equipLowWeapon = true;
				} else if (Math.rand(1,100) <= 33) {
					equipAnyHelmet = true;
					equipLowWeapon = true;
				} else {
					equipLowHelmet = true;
					equipLowArmor = true;
					equipLowWeapon = true;
				}
			} else {
				equipHighHelmet = true;
				equipHighArmor = true;
			}
		}
		else {
			local armorRoll = Math.rand(1, 100);
			if (armorRoll <= 33) {
				if (Math.rand(1,100) <= 50) {
					equipAnyWeapon = true;
					equipLowArmor = true;
				} else {
					equipAnyWeapon = true;
					equipLowHelmet = true;
				}
			} else {
				equipHighWeapon = true;
			}
		}

		local armors = [];
		if (equipHighArmor) {
			armors.extend([
				"armor/oriental/stitched_nomad_armor",
				"armor/oriental/plated_nomad_mail",
				"armor/oriental/linothorax",
				"armor/oriental/southern_mail_shirt"
			]);
		} else if (equipAnyArmor) {
			armors.extend([
				"armor/oriental/nomad_robe",
				"armor/oriental/thick_nomad_robe",
				"armor/oriental/padded_vest",
				"armor/oriental/stitched_nomad_armor",
				"armor/oriental/plated_nomad_mail",
				"armor/oriental/linothorax",
				"armor/oriental/southern_mail_shirt"
			]);
		} else if (equipLowArmor) {
			armors.extend([
				"armor/oriental/nomad_robe",
				"armor/oriental/thick_nomad_robe",
				"armor/oriental/padded_vest"
			]);
		}

		local helmets = [];
		if (equipHighHelmet) {
			helmets.extend([
				"helmets/oriental/nomad_reinforced_helmet",
				"helmets/oriental/wrapped_southern_helmet",
				"helmets/oriental/spiked_skull_cap_with_mail"
			]);
		} else if (equipAnyHelmet) {
			helmets.extend([
				"helmets/oriental/nomad_head_wrap",
				"helmets/oriental/nomad_leather_cap",
				"helmets/oriental/nomad_light_helmet",
				"helmets/oriental/nomad_reinforced_helmet",
				"helmets/oriental/wrapped_southern_helmet",
				"helmets/oriental/spiked_skull_cap_with_mail"
			]);
		} else if (equipLowHelmet) {
			helmets.extend([
				"helmets/oriental/leather_head_wrap",
				"helmets/oriental/nomad_leather_cap",
				"helmets/oriental/nomad_light_helmet"
			]);
		}

		local weapons = []
		if (equipHighWeapon) {
			weapons.extend([
				"shields/oriental/metal_round_shield",
				"weapons/scimitar",
				"weapons/boar_spear",
				"weapons/pitchfork",
				"weapons/oriental/light_southern_mace",
				"weapons/oriental/firelance"
			]);
		} else if (equipAnyWeapon) {
			weapons.extend([
				"shields/oriental/southern_light_shield",
				"shields/oriental/metal_round_shield",
				"weapons/oriental/saif",
				"weapons/scimitar",
				"weapons/militia_spear",
				"weapons/boar_spear",
				"weapons/pitchfork",
				"weapons/oriental/nomad_mace",
				"weapons/oriental/light_southern_mace",
				"weapons/oriental/firelance"
			]);
		} else if (equipLowWeapon) {
			weapons.extend([
				"shields/oriental/southern_light_shield",
				"weapons/oriental/saif",
				"weapons/militia_spear",
				"weapons/oriental/nomad_mace",
			]);
		}

		if (helmets.len() != 0) {
			local helmet = new("scripts/items/" + helmets[Math.rand(0, helmets.len() - 1)]);
			helmet.setCondition(Math.rand(helmet.getConditionMax() * 0.4, helmet.getConditionMax()) * 1.0);
			items.equip(helmet);
		}

		if (armors.len() != 0) {
			items.unequip(items.getItemAtSlot(Const.ItemSlot.Body));
			local armor = new("scripts/items/" + armors[Math.rand(0, armors.len() - 1)]);
			armor.setCondition(Math.rand(armor.getConditionMax() * 0.4, armor.getConditionMax()) * 1.0);
			items.equip(armor);
		}

		if (weapons.len() != 0) {
			items.unequip(items.getItemAtSlot(Const.ItemSlot.Mainhand));
			items.unequip(items.getItemAtSlot(Const.ItemSlot.Offhand));
			if (shieldSpecific) {
				items.equip(new("scripts/items/shields/oriental/metal_round_shield"));
			} else {
				local weapon = new("scripts/items/" + weapons[Math.rand(0, weapons.len() - 1)]);
				weapon.setCondition(Math.rand(weapon.getConditionMax() * 0.4, weapon.getConditionMax()) * 1.0);
				items.equip(weapon);
			}
		}
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != World.EntityManager.getSettlements().len(); i = ++i )
		{
			randomVillage = World.EntityManager.getSettlements()[i];

			if (!randomVillage.isIsolatedFromRoads() && randomVillage.isSouthern() && !randomVillage.hasBuilding("building.arena"))
				break;
		}

		local randomVillageTile = randomVillage.getTile();
		local navSettings = World.getNavigator().createSettings();
		navSettings.ActionPointCosts = Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = Math.rand(Math.max(2, randomVillageTile.SquareCoords.X - 4), Math.min(Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 4));
			local y = Math.rand(Math.max(2, randomVillageTile.SquareCoords.Y - 4), Math.min(Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 4));

			if (!World.isValidTileSquare(x, y))
				continue;
			else
			{
				local tile = World.getTileSquare(x, y);

				if (tile.Type == Const.World.TerrainType.Ocean || tile.Type == Const.World.TerrainType.Shore || tile.IsOccupied)
					continue;
				else if (tile.getDistanceTo(randomVillageTile) <= 2)
					continue;
				else
				{
					local path = World.getNavigator().findPath(tile, randomVillageTile, navSettings, 0);

					if (!path.isEmpty())
					{
						randomVillageTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		local cityStateFaction = randomVillage.getOwner();
		cityStateFaction.addPlayerRelation(-99.0, "You escaped before repaying your debts to the Gilder");
		World.Statistics.getFlags().set("NemesisCityStateID", cityStateFaction.getID());
		World.Statistics.getFlags().set("SatoLastAmbushType", "");
		World.Statistics.getFlags().set("SatoLastAmbushDay", 1);
		World.Statistics.getFlags().set("SatoLastAmbushCheckedDay", 1);
		World.Statistics.getFlags().set("SatoDaysUntilNextAmbush", 0);

		local cityStates = World.FactionManager.getFactionsOfType(Const.FactionType.OrientalCityState);

		foreach( c in cityStates )
		{
			if (c.getID() != cityStateFaction.getID())
				c.addPlayerRelation(-29.0, "You are rumored to be escaped Indebted");
		}

		World.State.m.Player = World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		World.Assets.updateLook(101);
		World.getCamera().setPos(World.State.m.Player.getPos());
		Time.scheduleEvent(TimeUnit.Real, 1000, function ( _tag )
		{
			Music.setTrackList([
				"music/worldmap_11.ogg"
			], Const.Music.CrossFadeTime);
			World.Events.fire("event.sato_escaped_slaves_scenario_intro");
		}, null);
	}

	function onInit()
	{
		World.Assets.m.RelationDecayGoodMult += 0.15;
		World.Assets.m.RelationDecayBadMult -= 0.15;

		if (!(World.Statistics.getFlags().get("SatoEscapedSlavesEventsAdded")))
		{
			local mundaneEvents = IO.enumerateFiles("scripts/events/escaped_slaves_events");
			foreach ( i, event in mundaneEvents ) {
				local instantiatedEvent = new(event);
				World.Events.m.Events.push(instantiatedEvent);
			};
		}
		World.Statistics.getFlags().set("SatoEscapedSlavesEventsAdded", true);

		local sergeant = World.Retinue.getFollower("follower.drill_sergeant");
		sergeant.m.Requirements = [
			{
				IsSatisfied = false,
				Text = "Retired a man with a permanent injury"
			}
		];

		World.Events.addSpecialEvent("event.sato_find_slave_after_battle");
		World.Events.addSpecialEvent("event.sato_pursuer_ambush");
	}

	function onHired(_bro) {
		if (_bro.getBackground().getID() == "background.slave") {
			_bro.getSkills().add(new("scripts/skills/traits/sato_brothers_in_chains_trait"));
			_bro.getSprite("miniboss").setBrush("bust_miniboss_indebted");
			_bro.improveMood(1.5, "Joined a mercenary company");
		} else if (_bro.getBackground().getID() == "background.manhunter") {
			local brothers = World.getPlayerRoster().getAll();
			foreach( _bro in brothers ) {
				if (_bro.getBackground().getID() == "background.slave")
					_bro.worsenMood(2.0, "You hired " + _bro.getNameOnly() + " the manhunter");
			}
		}
	}
});

