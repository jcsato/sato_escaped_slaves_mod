sato_manhunter_veteran_ranged <- inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		m.Type			= Const.EntityType.SatoManhunterVeteran;
		m.BloodType		= Const.BloodType.Red;
		m.XP			= Const.Tactical.Actor.SatoManhunterVeteranRanged.XP;

		human.create();

		m.Bodies		= Const.Bodies.SouthernMale;
		m.Faces			= Const.Faces.SouthernMale;
		m.Hairs			= Const.Hair.SouthernMale;
		m.HairColors	= Const.HairColors.Southern;
		m.Beards		= Const.Beards.SouthernUntidy;
		m.BeardChance	= 80;
		m.Ethnicity		= 1;

		m.AIAgent		= new("scripts/ai/tactical/agents/sato_manhunter_ranged_agent");
		m.AIAgent.setActor(this);
	}

	function onInit()
	{
		human.onInit();

		local b = m.BaseProperties;
		b.setValues(Const.Tactical.Actor.SatoManhunterVeteranRanged);
		b.TargetAttractionMult = 1.1;
		b.Vision = 8;
		m.ActionPoints = b.ActionPoints;
		m.Hitpoints = b.Hitpoints;
		m.CurrentProperties = clone b;
		setAppearance();
		getSprite("socket").setBrush("bust_base_nomads");

		if (Math.rand(1, 100) <= 15)
		{
			local pox = getSprite("tattoo_head");
			pox.Visible = true;
			pox.setBrush("bust_head_darkeyes_01");
		}
		else
		{
			local dirt = getSprite("dirt");
			dirt.Visible = true;
		}

		if (Math.rand(1, 100) <= 25)
		{
			getSprite("eye_rings").Visible = true;
		}

		b.IsSpecializedInThrowing	= true;
		b.IsSpecializedInBows		= true;
		b.IsSpecializedInCrossbows	= true;
		b.IsSpecializedInDaggers	= true;
		b.IsSpecializedInPolearms	= true;
		b.IsSpecializedInSpears		= true;

		m.Skills.add(new("scripts/skills/perks/perk_fast_adaption"));
		m.Skills.add(new("scripts/skills/perks/perk_coup_de_grace"));
		m.Skills.add(new("scripts/skills/perks/perk_quick_hands"));
		m.Skills.add(new("scripts/skills/perks/perk_head_hunter"));
		m.Skills.add(new("scripts/skills/perks/perk_battle_forged"));
		m.Skills.add(new("scripts/skills/perks/perk_fearsome"));
	}

	function onOtherActorDeath( _killer, _victim, _skill )
	{
		if (_victim.getType() == Const.EntityType.Slave && _victim.isAlliedWith(this))
			return;

		actor.onOtherActorDeath(_killer, _victim, _skill);
	}

	function onOtherActorFleeing( _actor )
	{
		if (_actor.getType() == Const.EntityType.Slave && _actor.isAlliedWith(this))
			return;

		actor.onOtherActorFleeing(_actor);
	}

	function assignRandomEquipment()
	{
		if (m.Items.hasEmptySlot(Const.ItemSlot.Mainhand))
		{
			local r = Math.rand(1, 3);

			if (r == 1)
			{
				m.Items.equip(new("scripts/items/weapons/oriental/handgonne"));
				m.Items.equip(new("scripts/items/ammo/powder_bag"));
			}
			else
			{
				local weapons = [
					"weapons/throwing_axe"
					"weapons/throwing_axe"
					"weapons/javelin"
				];

				if (World.getTime().Days < 80)
				{
					weapons.extend([
						"weapons/greenskins/goblin_spiked_balls"
					]);
				}

				weapons.extend([
					"weapons/greenskins/goblin_spiked_balls"
				]);

				m.Items.equip(new("scripts/items/" + weapons[Math.rand(0, weapons.len() - 1)]));
			}
		}

		local mainhandWeaponID = m.Items.getItemAtSlot(Const.ItemSlot.Mainhand).getID();
		if (mainhandWeaponID == "weapon.handgonne" || mainhandWeaponID == "weapon.named_handgonne")
		{
			m.Items.addToBag(new("scripts/items/weapons/oriental/qatal_dagger"));
		}
		else
		{
			local backupWeapons = [
				"weapons/hooked_blade",
				"weapons/warbrand",
				"weapons/oriental/two_handed_saif",
				"weapons/warfork"
			];
			m.Items.addToBag(new("scripts/items/" + backupWeapons[Math.rand(0, backupWeapons.len() - 1)]));
		}

		if (m.Items.hasEmptySlot(Const.ItemSlot.Body))
		{
			local armors = [
				"armor/oriental/mail_and_lamellar_plating",
				"armor/oriental/southern_long_mail_with_padding",
				"armor/mail_hauberk",
				"armor/reinforced_mail_hauberk",
				"armor/lamellar_harness"
			];

			if (Const.DLC.Unhold)
			{
				armors.extend([
					"armor/leather_scale_armor",
					"armor/footman_armor"
				]);
			}

			m.Items.equip(new("scripts/items/" + armors[Math.rand(0, armors.len() - 1)]));
		}

		if (m.Items.hasEmptySlot(Const.ItemSlot.Head))
		{
			local helmets = [
				"helmets/oriental/wrapped_southern_helmet",
				"helmets/oriental/spiked_skull_cap_with_mail",
				"helmets/oriental/southern_helmet_with_coif",
				"helmets/oriental/heavy_lamellar_helmet"
			];

			if (World.getTime().Days > 50) {
				helmets.extend([
					"helmets/oriental/heavy_lamellar_helmet"
				]);

				if (Const.DLC.Wildmen)
				{
					helmets.extend([
						"helmets/conic_helmet_with_closed_mail"
					]);
				}
			}

			if (::mods_getRegisteredMod("sato_additional_equipment") != null) {
				helmets.extend([
					"helmets/oriental/masked_nomad_light_helmet"
				]);
			}

			m.Items.equip(new("scripts/items/" + helmets[Math.rand(0, helmets.len() - 1)]));
		}
	}

	function makeMiniboss()
	{
		if (!actor.makeMiniboss())
			return false;

		getSprite("miniboss").setBrush("bust_miniboss");
		local weapons = [
			[
				"weapons/named/named_javelin"
			],
			[
				"weapons/named/named_throwing_axe"
			],
			[
				"weapons/named/named_handgonne",
				"ammo/powder_bag"
			]
		];
		local armors = Const.Items.NamedSouthernArmors;

		armors.push("armor/named/golden_scale_armor");
		if (Const.DLC.Wildmen)
			armors.push("armor/named/named_golden_lamellar_armor");

		local helmets = Const.Items.NamedSouthernHelmets;

		local r = Math.rand(1, 3);

		if (r == 1)
		{
			local r = Math.rand(0, weapons.len() - 1);

			foreach( w in weapons[r] )
			{
				m.Items.equip(new("scripts/items/" + w));
			}
		}
		else if (r == 2)
			m.Items.equip(new("scripts/items/" + armors[Math.rand(0, armors.len() - 1)]));
		else
			m.Items.equip(new("scripts/items/" + helmets[Math.rand(0, helmets.len() - 1)]));

		m.Skills.add(new("scripts/skills/perks/perk_duelist"));
		m.Skills.add(new("scripts/skills/perks/perk_killing_frenzy"));
		return true;
	}
});

