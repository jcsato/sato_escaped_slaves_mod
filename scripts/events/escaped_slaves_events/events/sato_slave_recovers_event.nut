sato_slave_recovers_event <- inherit("scripts/events/event", {
	m = {
		Recovered = null
	},
	function create()
	{
        local EventText1 = "{There is a particular way that former slaves carry themselves, like a weight that they can never shed hangs upon their shoulders. | Life as a slave leaves its mark upon men, inflicting scars both inside and out. | Many Indebted spend their lives forever debilitated, a despondent resignation of a life forever lost hovering over them like a cloud. | The frailty imparted to Indebted seems to never leave them, as though the scars refuse to fully heal. | Common amongst the slaves you\'ve known is a look of death, the vacant gaze of a quenched fire and a life lost.}";
        local EventText2 = " As you look at %recovered%, however, you see a man carrying no such signs. ";
        local EventText3 = "{His shoulders seem broader, his posture straighter, his head held higher than before. | His gaze has a renewed purpose and clarity, filled with a fire you\'ve not seen in the man before. | Where before his scars seemed to wrap around his body, now they seem stretched and faded, unable to contain the man underneath. | His stride is full of confidence and speed, the slump and weariness you used to see gone without a trace. | The man\'s actions seem full of a boundless energy, as though weariness is the station of lesser men and holds no grip over him.}";
        local EventText4 = "\n\nYou go over the the man, noting his newfound vigor, and ask him how he\'s doing. He looks to the horizon at something you can\'t quite make out.";
        local EventText5 = "{%SPEECH_ON%You know I used to have a family, cap\'n? With a kid and everything. That life always seemed so far away, but close at the same time, you know? Like I couldn\'t get away from it, like there weren\'t no point to going on cause I\'d already done what a man ought to get done in his life. I\'m sure they\'ve died or moved on, but I never could.%SPEECH_OFF%He pauses.%SPEECH_ON%I think I finally managed to, though. Something about being here, with the company, it\'s give me purpose again, made me feel like there\'s something still worth doing with my life.%SPEECH_OFF% | %SPEECH_ON%I still remember my first lashing. I\'d never known pain like that before. It never went away, really. I could always feel it, right there underneath the skin. It was... was like a chain I couldn\'t see or touch or break, telling me I\'d been marked, that I\'d always be a slave.%SPEECH_OFF%He rubs his wrists.%SPEECH_ON%Lately, though, the feelin\'s started to fade. Hell, maybe I\'m just getting old, but I think something about being in the company has helped. I\'ve started believing it don\'t matter so much who I used to be, that I should just focus on what comes next.%SPEECH_OFF% | %SPEECH_ON%I still remember what it was like, before, you know... I remember feeling like I never had any choice. My life was laid out in front of me, and if I didn\'t like it, too bad. I suppose it was a slavery of a kind too, being bound to a life dictated by who\'s son you were or where you were born, and not anything you chose for yourself.%SPEECH_OFF%He spits.%SPEECH_ON%Well, I\'ve decided I\'ve had my fill of both. I used to think about returning to that life, but after my time in the company, I\'ve come to realize this is the closest to freedom I\'ve ever been.%SPEECH_OFF%}";
        local EventText6 = "%recovered% turns to you.%SPEECH_ON%It feels good, cap\'n.%SPEECH_OFF%";

		m.ID = "event.sato_slave_recovers";
		m.Title = "During camp...";
		m.Cooldown = 7.0 * World.getTime().SecondsPerDay;
		m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_05.png[/img]" + EventText1 + EventText2 + EventText3 + EventText4 + EventText5 + EventText6,
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Glad you\'re feeling like yourself again.",
					function getResult( _event ) { return 0; }

				}
			],
			function start( _event )
			{
                local dude = _event.m.Recovered;
				Characters.push(dude.getImagePath());
				dude.getFlags().set("sato_recovered_slave", true);

                local healthRoll = 7 + Math.rand(2, 8);
                dude.getBaseProperties().Hitpoints += healthRoll;
                dude.setHitpoints(Math.min(dude.getHitpoints(), dude.getHitpointsMax()));

                local fatigueRoll = 2 + Math.rand(2, 5);
                dude.getBaseProperties().Stamina += fatigueRoll;

                local resolveRoll = 7 + Math.rand(1, 3);
                dude.getBaseProperties().Bravery += resolveRoll;

                local initiativeRoll = 4 + Math.rand(3, 6);
                dude.getBaseProperties().Initiative += initiativeRoll;

				dude.getSkills().update();
				List.push({ id = 16, icon = "ui/icons/health.png", text = dude.getName() + " gains [color=" + Const.UI.Color.PositiveEventValue + "]+" + healthRoll + "[/color] Max Health" });
				List.push({ id = 17, icon = "ui/icons/fatigue.png", text = dude.getName() + " gains [color=" + Const.UI.Color.PositiveEventValue + "]+" + fatigueRoll + "[/color] Max Fatigue" });
				List.push({ id = 18, icon = "ui/icons/bravery.png", text = dude.getName() + " gains [color=" + Const.UI.Color.PositiveEventValue + "]+" + resolveRoll + "[/color] Resolve" });
				List.push({ id = 19, icon = "ui/icons/initiative.png", text = dude.getName() + " gains [color=" + Const.UI.Color.PositiveEventValue + "]+" + initiativeRoll + "[/color] Initiative" });
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

		local recovered_candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 8 && bro.getBackground().getID() == "background.slave" && !bro.getFlags().has("sato_recovered_slave"))
				recovered_candidates.push(bro);
		}

		if (recovered_candidates.len() == 0)
			return;

		m.Recovered = recovered_candidates[Math.rand(0, recovered_candidates.len() - 1)];
		m.Score = recovered_candidates.len() * 9;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([ "recovered", m.Recovered.getNameOnly() ]);
	}

	function onClear()
	{
		m.Recovered = null;
	}

});

