sato_brothers_in_chains_effect <- inherit("scripts/skills/skill", {
	m = {
        AttackBonus = 0,
        DefenseBonus = 0,
        ResolveBonus = 0,
        AttackMagnitude = 1,
        DefenseMagnitude = 1,
        ResolveMagnitude = 1
    },
	function create()
	{
		m.ID = "effects.sato_brothers_in_chains";
		m.Name = "Brothers in Chains";
		m.Description = "Fighting with former slaves drives this character to succeed.";
		m.Icon = "ui/settlement_status/settlement_effect_40.png";
		m.Type = Const.SkillType.StatusEffect;
		m.IsActive = false;
		m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		return [
			{ id = 1, type = "title", text = getName() },
			{ id = 2, type = "description", text = getDescription() },
			{ id = 10, type = "text", icon = "ui/icons/bravery.png", text = "[color=" + Const.UI.Color.PositiveValue + "]+" + m.ResolveBonus + "[/color] Resolve" },
			{ id = 10, type = "text", icon = "ui/icons/melee_skill.png", text = "[color=" + Const.UI.Color.PositiveValue + "]+" + m.AttackBonus + "[/color] Melee Skill" },
			{ id = 10, type = "text", icon = "ui/icons/ranged_skill.png", text = "[color=" + Const.UI.Color.PositiveValue + "]+" + m.AttackBonus + "[/color] Ranged Skill" },
			{ id = 10, type = "text", icon = "ui/icons/melee_defense.png", text = "[color=" + Const.UI.Color.PositiveValue + "]+" + m.DefenseBonus + "[/color] Melee Defense" },
			{ id = 10, type = "text", icon = "ui/icons/ranged_defense.png", text = "[color=" + Const.UI.Color.PositiveValue + "]+" + m.DefenseBonus + "[/color] Ranged Defense" }
		];
	}

	function onUpdate( _properties )
	{
		local actor = getContainer().getActor();

		if (!actor.isPlacedOnMap() || actor.getFaction() != Const.Faction.Player)
		{
			m.IsHidden = true;
			return;
		}

		local myTile = actor.getTile();
		local allies = Tactical.Entities.getInstancesOfFaction(Const.Faction.Player);
        local numSlaves = 0;

		foreach( ally in allies )
		{
			if (ally.getID() == actor.getID() || !ally.isPlacedOnMap())
				continue;

            if (ally.getSkills() != null && ally.getSkills().hasSkill("trait.sato_brothers_in_chains"))
                numSlaves += 1;
        }

        if (numSlaves < 1)
            m.IsHidden = true;
        else
        {
            m.IsHidden = false;

            local numSlavesForBonus = numSlaves;
            m.AttackBonus = Math.min(numSlavesForBonus * m.AttackMagnitude, 10);
            m.DefenseBonus = Math.min(numSlavesForBonus * m.DefenseMagnitude, 10);
            m.ResolveBonus = Math.min(numSlavesForBonus * m.ResolveMagnitude, 10);

			_properties.MeleeSkill += m.AttackBonus;
			_properties.RangedSkill += m.AttackBonus;
			_properties.MeleeDefense += m.DefenseBonus;
			_properties.RangedDefense += m.DefenseBonus;
			_properties.Bravery += m.ResolveBonus;
        }
	}

});

