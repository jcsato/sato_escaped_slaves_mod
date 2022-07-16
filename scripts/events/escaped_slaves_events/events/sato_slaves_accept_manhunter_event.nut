sato_slaves_accept_manhunter_event <- inherit("scripts/events/event", {
	m = {
		Manhunter = null
	},
	function create()
	{
		m.ID = "event.sato_slaves_accept_manhunter";
		m.Title = "During camp...";
		m.Cooldown = 80.0 * World.getTime().SecondsPerDay;
		m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_05.png[/img]" + "You find %manhunter% sitting alone at the edge of camp. The man was an unpopular addition to the company when you took him on, but you\'d thought the manhunter and the rest of the men had made their peace with each other. Worried that his seclusion is a sign of more conflict, you go over to him and ask how he\'s doing.%SPEECH_ON%I\'ve been thinking, captain. I used to think I was doing the Gilder\'s work, that catching those who owed him a debt was a divine cause. And it was, in part. Some of those I caught truly were scum. Rapists, murderers, men who would - and did - slit their own child\'s throat to save their hides.%SPEECH_OFF%He pauses, sighs, and spits.%SPEECH_ON%But I know too that there were just as many I captured that owed no debt at all. My time with the company has shown me that. Their enslavement had nothing to do with divine recompense, and served only the whims of worldly men. I see that now, and much more.%SPEECH_OFF%He shakes his head and gets up.%SPEECH_ON%I won\'t make apologies or excuses for what I\'ve done, captain. But whatever my past, I\'m a member of the company now. I know who my comrades and enemies are, and I know what my god demands of me. I\'m with you to the end. I wanted to make that clear.%SPEECH_OFF%With that, he strides back into camp. You keep an eye on him for a while. Far from what you feared, it seems the former Indebted in the company like him most of all. Perhaps his past simply lends that much more credence to his current change of heart? Either way, they accept him as one of their own.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Glad to have you with us, %manhunter%.",
					function getResult( _event ) { return 0; }

				}
			],
			function start( _event )
			{
                local dude = _event.m.Manhunter;
				Characters.push(dude.getImagePath());

                local trait = new("scripts/skills/traits/sato_brothers_in_chains_trait");
                dude.getSkills().add(trait);

                List.push({ id = 10, icon = trait.getIcon(), text = dude.getName() + " is now a brother in chains" })

				dude.improveMood(1.0, "Has found a sense of purpose in life");
				List.push({ id = 10, icon = Const.MoodStateIcon[dude.getMoodState()], text = dude.getName() + Const.MoodStateEvent[dude.getMoodState()] });
			}

		});
	}

	function onUpdateScore()
	{
        if (World.Assets.getOrigin().getID() != "scenario.sato_escaped_slaves")
            return;

		local brothers = World.getPlayerRoster().getAll();

		local manhunter_candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 4 && Time.getVirtualTimeF() - bro.getHireTime() > World.getTime().SecondsPerDay * 25.0 && bro.getBackground().getID() == "background.manhunter" && !bro.getSkills().hasSkill("trait.sato_brothers_in_chains"))
				manhunter_candidates.push(bro);
		}

		if (manhunter_candidates.len() == 0)
			return;

		m.Manhunter = manhunter_candidates[Math.rand(0, manhunter_candidates.len() - 1)];
		m.Score = manhunter_candidates.len() * 20;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([ "manhunter", m.Manhunter.getNameOnly() ]);
	}

	function onClear()
	{
		m.Manhunter = null;
	}

});

