sato_brothers_in_chains_trait <- inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		character_trait.create();

		m.ID			= "trait.sato_brothers_in_chains";
		m.Name			= "Brothers in Chains";
		m.Icon			= "ui/settlement_status/settlement_effect_40.png";
		m.Description	= "This character has formed strong bonds with other like minded men. For every ally with this trait on the field, this character gets [color=" + Const.UI.Color.PositiveValue + "]+1[/color] Melee Skill, Ranged Skill, Melee Defense, Ranged Defense, and Resolve, up to a maximum of 10.";

		m.Order			= Const.SkillOrder.Trait - 1;
	}

	function getTooltip()
	{
		return [
			{ id = 1, type = "title", text = getName() },
			{ id = 2, type = "description", text = getDescription() }
		];
	}

	function onCombatStarted()
	{
		getContainer().add(new("scripts/skills/effects/sato_brothers_in_chains_effect"));
        m.IsHidden = true;
	}

    function onCombatFinished()
    {
		getContainer().removeByID("effects.sato_brothers_in_chains_effect");
        m.IsHidden = false;
    }

});

