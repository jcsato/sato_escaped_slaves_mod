sato_manhunter_ranged_agent <- inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		agent.create();
		m.ID = "agent.sato_manhunter_ranged";

		m.Properties.BehaviorMult[Const.AI.Behavior.ID.Defend] = 1.0;
		m.Properties.BehaviorMult[Const.AI.Behavior.ID.EngageMelee] = 0.0;
		m.Properties.IsRangedUnit = true;
		m.Properties.TargetPriorityHitchanceMult = 0.6;
		m.Properties.TargetPriorityHitpointsMult = 0.2;
		m.Properties.TargetPriorityRandomMult = 0.0;
		m.Properties.TargetPriorityDamageMult = 0.2;
		m.Properties.TargetPriorityFleeingMult = 0.5;
		m.Properties.TargetPriorityHittingAlliesMult = 0.1;
		m.Properties.TargetPriorityFinishOpponentMult = 3.0;
		m.Properties.TargetPriorityCounterSkillsMult = 0.5;
		m.Properties.TargetPriorityArmorMult = 0.5;
		m.Properties.OverallDefensivenessMult = 1.1;
		m.Properties.OverallFormationMult = 1.0;
		m.Properties.OverallHideMult = 0.75;
		m.Properties.EngageTargetMultipleOpponentsMult = 1.35;
		m.Properties.EngageTargetArmedWithRangedWeaponMult = 1.5;
	}

	function onAddBehaviors()
	{
		addBehavior(new("scripts/ai/tactical/behaviors/ai_flee"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_retreat"));

		addBehavior(new("scripts/ai/tactical/behaviors/ai_defend"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_break_free"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_reload"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_wake_up_ally"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_engage_ranged"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_engage_melee"));

		addBehavior(new("scripts/ai/tactical/behaviors/ai_attack_bow"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_attack_handgonne"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_attack_default"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_attack_throw_net"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_attack_deathblow"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_switchto_melee"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_switchto_ranged"));
	}

	function onUpdate()
	{
		setRangedAtDayOnly();
		setEngageRangeBasedOnWeapon();

		local hasUsableRangedWeaponInBag = false;
		local itemsInBag = m.Actor.getItems().getAllItemsAtSlot(Const.ItemSlot.Bag);

		if (itemsInBag.len() > 0)
		{
			local rangedWeapons = [];

			foreach( item in itemsInBag )
			{
				if (item.isItemType(Const.Items.ItemType.RangedWeapon) && !(isThrowingWeapon(item)) && (item.getAmmoMax() == 0 || item.getAmmo() > 0))
					rangedWeapons.push(item);
			}

			if (rangedWeapons.len() > 0)
				hasUsableRangedWeaponInBag = true;
		}

		local item = m.Actor.getItems().getItemAtSlot(Const.ItemSlot.Mainhand);

		if (hasUsableRangedWeaponInBag)
			m.Properties.BehaviorMult[Const.AI.Behavior.ID.SwitchToRanged] = 1.0;

		if (isThrowingWeapon(item) || !hasUsableRangedWeaponInBag)
		{
			m.Properties.BehaviorMult[Const.AI.Behavior.ID.EngageMelee] = 1.0;
			m.Properties.BehaviorMult[Const.AI.Behavior.ID.SwitchToRanged] = 1.0;
		}
	}

	function isThrowingWeapon(item)
	{
		return (item != null && item.isItemType(Const.Items.ItemType.RangedWeapon) && item.getRangeMax() <= 4 && item.getID() != "weapon.handgonne" && item.getID() != "weapon.named_handgonne");
	}

});

