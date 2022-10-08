sato_manhunter <- inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		m.Type			= Const.EntityType.SatoManhunter;
		m.BloodType		= Const.BloodType.Red;
		m.XP			= Const.Tactical.Actor.SatoManhunter.XP;

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
		b.setValues(Const.Tactical.Actor.SatoManhunter);

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
			getSprite("eye_rings").Visible = true;

		b.IsSpecializedInMaces		= true;
		b.IsSpecializedInCleavers	= true;
		b.IsSpecializedInSwords		= true;
		b.IsSpecializedInThrowing	= true;

		m.Skills.add(new("scripts/skills/perks/perk_crippling_strikes"));
		m.Skills.add(new("scripts/skills/perks/perk_anticipation"));
		m.Skills.add(new("scripts/skills/perks/perk_quick_hands"));
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
		local weapons = [
			"weapons/scimitar",
			"weapons/oriental/light_southern_mace"
		];

		if (Const.DLC.Wildmen)
		{
			weapons.extend([
				"weapons/scimitar",
				"weapons/scimitar",
				"weapons/oriental/light_southern_mace",
				"weapons/oriental/light_southern_mace",
				"weapons/battle_whip"
			]);
		}

		m.Items.equip(new("scripts/items/" + weapons[Math.rand(0, weapons.len() - 1)]));

		if (m.Items.hasEmptySlot(Const.ItemSlot.Offhand) && Math.rand(1, 100) <= 60)
			m.Items.equip(new("scripts/items/tools/throwing_net"));

		local armor = [
			"armor/leather_lamellar",
			"armor/oriental/plated_nomad_mail",
			"armor/oriental/southern_mail_shirt"
		];

		if (World.getTime().Days > 18)
		{
			armor.extend([
				"armor/mail_shirt"
			]);
		}
		m.Items.equip(new("scripts/items/" + armor[Math.rand(0, armor.len() - 1)]));
		local helmets = [
			"helmets/oriental/nomad_leather_cap",
			"helmets/oriental/leather_head_wrap",
			"helmets/oriental/wrapped_southern_helmet",
			"helmets/oriental/spiked_skull_cap_with_mail"
		];

		if (World.getTime().Days <= 18)
		{
			helmets.extend([
				"helmets/oriental/southern_head_wrap"
			]);
		} else if (::mods_getRegisteredMod("sato_additional_equipment") != null) {
			helmets.extend([
				"helmets/oriental/masked_nomad_light_helmet"
			]);
		}

		m.Items.equip(new("scripts/items/" + helmets[Math.rand(0, helmets.len() - 1)]));
	}
});
