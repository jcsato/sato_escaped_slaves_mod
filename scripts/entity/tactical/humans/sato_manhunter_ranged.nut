sato_manhunter_ranged <- inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		m.Type			= Const.EntityType.SatoManhunter;
		m.BloodType		= Const.BloodType.Red;
		m.XP			= Const.Tactical.Actor.SatoManhunterRanged.XP;

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
		b.setValues(Const.Tactical.Actor.SatoManhunterRanged);
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
			getSprite("eye_rings").Visible = true;

		b.IsSpecializedInThrowing	= true;
		b.IsSpecializedInBows		= true;
		b.IsSpecializedInCrossbows	= true;

		m.Skills.add(new("scripts/skills/perks/perk_coup_de_grace"));
		m.Skills.add(new("scripts/skills/perks/perk_quick_hands"));
		m.Skills.add(new("scripts/skills/perks/perk_head_hunter"));
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
		local r = Math.rand(1, 2);

		if (r == 1)
		{
			m.Items.equip(new("scripts/items/weapons/oriental/nomad_sling"));
			m.Items.addToBag(new("scripts/items/weapons/knife"));
		}
		else if (r == 2)
		{
			m.Items.equip(new("scripts/items/weapons/greenskins/goblin_spiked_balls"));
			m.Items.addToBag(new("scripts/items/weapons/militia_spear"));
		}

		if (m.Items.hasEmptySlot(Const.ItemSlot.Offhand))
			m.Items.equip(new("scripts/items/tools/throwing_net"));

		local armor = [
			"armor/oriental/linothorax",
			"armor/oriental/stitched_nomad_armor",
			"armor/leather_lamellar"
		];
		m.Items.equip(new("scripts/items/" + armor[Math.rand(0, armor.len() - 1)]));

		local helmets = [
			"helmets/oriental/southern_head_wrap",
			"helmets/oriental/nomad_leather_cap",
			"helmets/oriental/nomad_light_helmet"
		];
		m.Items.equip(new("scripts/items/" + helmets[Math.rand(0, helmets.len() - 1)]));
	}

});

