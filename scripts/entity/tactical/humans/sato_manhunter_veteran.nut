sato_manhunter_veteran <- inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		m.Type			= Const.EntityType.SatoManhunterVeteran;
		m.BloodType		= Const.BloodType.Red;
		m.XP			= Const.Tactical.Actor.SatoManhunterVeteran.XP;

		human.create();

		m.Bodies		= Const.Bodies.SouthernMale;
		m.Faces			= Const.Faces.SouthernMale;
		m.Hairs			= Const.Hair.SouthernMale;
		m.HairColors	= Const.HairColors.Southern;
		m.Beards		= Const.Beards.SouthernUntidy;
		m.BeardChance	= 90;
		m.Ethnicity		= 1;

		m.AIAgent		= new("scripts/ai/tactical/agents/sato_manhunter_melee_agent");
		m.AIAgent.setActor(this);
	}

	function onInit()
	{
		human.onInit();

		local b = m.BaseProperties;
		b.setValues(Const.Tactical.Actor.SatoManhunterVeteran);

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

		b.IsSpecializedInMaces		= true;
		b.IsSpecializedInCleavers	= true;
		b.IsSpecializedInSwords		= true;
		b.IsSpecializedInDaggers	= true;
		b.IsSpecializedInThrowing	= true;

		m.Skills.add(new("scripts/skills/perks/perk_crippling_strikes"));
		m.Skills.add(new("scripts/skills/perks/perk_anticipation"));
		m.Skills.add(new("scripts/skills/perks/perk_quick_hands"));
		m.Skills.add(new("scripts/skills/perks/perk_brawny"));
		m.Skills.add(new("scripts/skills/perks/perk_relentless"));
		m.Skills.add(new("scripts/skills/perks/perk_overwhelm"));
		m.Skills.add(new("scripts/skills/perks/perk_battle_forged"));
		// m.Skills.add(new("scripts/skills/perks/perk_fearsome"));
		m.Skills.add(new("scripts/skills/actives/rotation"));
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
			local weapons = [
				"weapons/shamshir",
				"weapons/oriental/heavy_southern_mace",
				"weapons/oriental/light_southern_mace",
				"weapons/oriental/polemace"
			];

			if (Const.DLC.Wildmen)
			{
				weapons.extend([
					"weapons/shamshir",
					"weapons/shamshir",
					"weapons/oriental/heavy_southern_mace",
					"weapons/oriental/heavy_southern_mace",
					"weapons/oriental/light_southern_mace",
					"weapons/oriental/light_southern_mace",
					"weapons/oriental/polemace",
					"weapons/oriental/polemace",
					"weapons/battle_whip"
				]);
			}

			m.Items.equip(new("scripts/items/" + weapons[Math.rand(0, weapons.len() - 1)]));
		}

		if (m.Items.hasEmptySlot(Const.ItemSlot.Offhand) && Math.rand(1, 100) <= 30)
			m.Items.equip(new("scripts/items/tools/throwing_net"));

		if (m.Items.getItemAtSlot(Const.ItemSlot.Mainhand).getID() == "weapon.battle_whip")
			m.Items.addToBag(new("scripts/items/weapons/oriental/light_southern_mace"));

		if (m.Items.hasEmptySlot(Const.ItemSlot.Body))
		{
			local armors = [
				"armor/oriental/southern_long_mail_with_padding",
				"armor/reinforced_mail_hauberk",
				"armor/lamellar_harness"
			];

			if (Const.DLC.Unhold)
			{
				armors.extend([
					"armor/footman_armor"
				]);
			}

			if (World.getTime().Days <= 65) {
				armors.extend([
					"armor/mail_hauberk",
					"armor/mail_hauberk",
					"armor/oriental/southern_long_mail_with_padding"
				]);
			} else {
				armors.extend([
					"armor/heavy_lamellar_armor",
					"armor/oriental/padded_mail_and_lamellar_hauberk"
				]);
			}

			m.Items.equip(new("scripts/items/" + armors[Math.rand(0, armors.len() - 1)]));
		}

		if (m.Items.hasEmptySlot(Const.ItemSlot.Head))
		{
			local helmets = [
				"helmets/oriental/spiked_skull_cap_with_mail",
				"helmets/oriental/spiked_skull_cap_with_mail",
				"helmets/oriental/southern_helmet_with_coif",
				"helmets/oriental/southern_helmet_with_coif"
			];

			if (World.getTime().Days > 50) {
				helmets.extend([
					"helmets/oriental/heavy_lamellar_helmet",
					"helmets/oriental/turban_helmet"
				]);

				if (Const.DLC.Wildmen)
				{
					helmets.extend([
						"helmets/conic_helmet_with_closed_mail",
						"helmets/conic_helmet_with_faceguard"
					]);
				}
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
			"weapons/named/named_shamshir",
			"weapons/named/named_mace",
			"weapons/named/named_polemace"
		];
		local armors = Const.Items.NamedSouthernArmors;

		armors.push("armor/named/golden_scale_armor");
		armors.push("armor/named/leopard_armor");
		if (Const.DLC.Wildmen)
			armors.push("armor/named/named_golden_lamellar_armor");

		local helmets = Const.Items.NamedSouthernHelmets;

		local r = Math.rand(1, 3);
		if (r == 1)
			m.Items.equip(new("scripts/items/" + weapons[Math.rand(0, weapons.len() - 1)]));
		else if (r == 2)
			m.Items.equip(new("scripts/items/" + armors[Math.rand(0, armors.len() - 1)]));
		else
			m.Items.equip(new("scripts/items/" + helmets[Math.rand(0, helmets.len() - 1)]));

		m.Skills.add(new("scripts/skills/perks/perk_underdog"));
		m.Skills.add(new("scripts/skills/perks/perk_duelist"));
		return true;
	}
});
