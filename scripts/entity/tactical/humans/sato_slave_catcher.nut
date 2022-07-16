sato_slave_catcher <- inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		m.Type			= Const.EntityType.SatoSlaveCatcher;
		m.BloodType		= Const.BloodType.Red;
		m.XP			= Const.Tactical.Actor.SatoSlaveCatcher.XP;

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
		b.setValues(Const.Tactical.Actor.SatoSlaveCatcher);

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
		b.IsSpecializedInDaggers	= true;
		b.IsSpecializedInThrowing	= true;

		m.Skills.add(new("scripts/skills/perks/perk_coup_de_grace"));
		m.Skills.add(new("scripts/skills/perks/perk_quick_hands"));
		m.Skills.add(new("scripts/skills/perks/perk_head_hunter"));
		m.Skills.add(new("scripts/skills/perks/perk_nimble"));
		m.Skills.add(new("scripts/skills/perks/perk_fearsome"));
		m.Skills.add(new("scripts/skills/actives/footwork"));
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
			"weapons/oriental/qatal_dagger",
			"weapons/oriental/qatal_dagger",
			"weapons/oriental/two_handed_saif"
		];

		m.Items.equip(new("scripts/items/" + weapons[Math.rand(0, weapons.len() - 1)]));

		if (m.Items.hasEmptySlot(Const.ItemSlot.Offhand))
			m.Items.equip(new("scripts/items/tools/throwing_net"));

		local armor = [
			"armor/oriental/linothorax",
			"armor/oriental/stitched_nomad_armor",
			"armor/oriental/plated_nomad_mail",
			"armor/oriental/southern_mail_shirt",
			"armor/oriental/mail_and_lamellar_plating"
		];

		if (World.getTime().Days > 50) {
			if (Const.DLC.Unhold)
			{
				armor.extend([
					"armor/leather_scale_armor"
				]);
			}
		}

		m.Items.equip(new("scripts/items/" + armor[Math.rand(0, armor.len() - 1)]));
		local helmet = [
			"helmets/oriental/southern_head_wrap",
			"helmets/oriental/nomad_leather_cap",
			"helmets/oriental/nomad_light_helmet"
		];

		if (::mods_getRegisteredMod("sato_additional_equipment") != null) {
			helmets.extend([
				"helmets/oriental/masked_nomad_light_helmet"
			]);
		}

		m.Items.equip(new("scripts/items/" + helmet[Math.rand(0, helmet.len() - 1)]));
	}
});
