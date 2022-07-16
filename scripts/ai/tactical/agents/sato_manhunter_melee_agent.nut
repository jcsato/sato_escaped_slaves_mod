sato_manhunter_melee_agent <- inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		agent.create();
		m.ID = "agent.sato_manhunter_melee";

		m.Properties.BehaviorMult[Const.AI.Behavior.ID.Defend] = 1.0;
		m.Properties.TargetPriorityHitchanceMult = 0.5;
		m.Properties.TargetPriorityHitpointsMult = 0.3;
		m.Properties.TargetPriorityRandomMult = 0.0;
		m.Properties.TargetPriorityDamageMult = 0.2;
		m.Properties.TargetPriorityFleeingMult = 0.5;
		m.Properties.TargetPriorityHittingAlliesMult = 0.1;
		m.Properties.TargetPriorityFinishOpponentMult = 3.0;
		m.Properties.TargetPriorityCounterSkillsMult = 0.5;
		m.Properties.TargetPriorityArmorMult = 0.75;
		m.Properties.OverallDefensivenessMult = 1.0;
		m.Properties.OverallFormationMult = 1.25;
		m.Properties.EngageFlankingMult = 1.25;
		m.Properties.EngageTargetMultipleOpponentsMult = 1.25;
		m.Properties.EngageTargetAlreadyBeingEngagedMult = 0.5;
	}

	function onAddBehaviors()
	{
		addBehavior(new("scripts/ai/tactical/behaviors/ai_flee"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_retreat"));

		addBehavior(new("scripts/ai/tactical/behaviors/ai_engage_melee"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_defend"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_defend_rotation"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_break_free"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_wake_up_ally"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_disengage"));

		addBehavior(new("scripts/ai/tactical/behaviors/ai_attack_default"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_attack_deathblow"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_attack_decapitate"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_attack_gash"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_attack_knock_out"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_attack_throw_net"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_attack_lash"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_switchto_melee"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_switchto_ranged"));
		addBehavior(new("scripts/ai/tactical/behaviors/ai_protect"));
	}

	function onUpdate()
	{
		setEngageRangeBasedOnWeapon();
		local item = m.Actor.getItems().getItemAtSlot(Const.ItemSlot.Mainhand);

		if (item != null && item.isItemType(Const.Items.ItemType.Weapon) && item.isAoE())
			m.Properties.EngageTargetMultipleOpponentsMult = 0.75;
		else
			m.Properties.EngageTargetMultipleOpponentsMult = 1.25;

		if (m.Properties.EngageRangeIdeal > 1)
			m.Properties.OverallFormationMult = 1.5;
		else
			m.Properties.OverallFormationMult = 1.0;

		if (item != null && item.isItemType(Const.Items.ItemType.Weapon) && item.getRangeIdeal() == 2)
			m.Properties.EngageTargetAlreadyBeingEngagedMult = 0.25;
		else
			m.Properties.EngageTargetAlreadyBeingEngagedMult = 0.5;

		m.Properties.BehaviorMult[Const.AI.Behavior.ID.Protect] = 0.0;
		m.Properties.BehaviorMult[Const.AI.Behavior.ID.SwitchToRanged] = 1.0;

		if (!getStrategy().isDefendingCamp() && m.KnownAllies.len() >= 8 && getActor().getCurrentProperties().TargetAttractionMult <= 1.0)
		{
			item = m.Actor.getItems().getItemAtSlot(Const.ItemSlot.Offhand);

			if (item != null && item.isItemType(Const.Items.ItemType.Shield))
			{
				local myTile = getActor().getTile();
				local priorityAlliesInRange = 0;
				local protectors = 0;

				foreach( a in m.KnownAllies )
				{
					if (a.getID() == getActor().getID())
						continue;

					if (a.getCurrentProperties().TargetAttractionMult <= 1.0 && a.getAIAgent().getProperties().BehaviorMult[Const.AI.Behavior.ID.Protect] >= 1.0)
						protectors = ++protectors;
					else if (a.getCurrentProperties().TargetAttractionMult > 1.0)
					{
						local d = a.getTile().getDistanceTo(myTile);

						if (d <= 2)
							priorityAlliesInRange = ++priorityAlliesInRange;
					}
				}

				if (priorityAlliesInRange > 0 && protectors <= m.KnownAllies.len() / 14)
				{
					m.Properties.BehaviorMult[Const.AI.Behavior.ID.Protect] = 1.0;
					m.Properties.BehaviorMult[Const.AI.Behavior.ID.SwitchToRanged] = 0.0;
				}
			}
		}
	}

});

