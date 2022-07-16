sato_escaped_slaves_intro_event <- inherit("scripts/events/event", {
	m = {},
	function create()
	{
		local introText1 = "Dawn approaches, and the first hints of sunlight warm the cold sand. Your body shivers, begging to rest and bask in the warmth, but you dare not stop. Not yet. You glance over your shoulders, half expecting manhunters to already be upon you, but you only see %bro% breathing heavily as he tries to keep pace."
		local introText2 = "\n\nIt\'s been half a year since Hoggart the Weasel ambushed you and the rest of the old company. Desperate for money, at first he tried to ransom you and the other survivors, but found no one who would pay and so turned to the slavers of the South. You were sold to %vizierfullname%, proclaimed \'Indebted\' to the Gilder, and worked to the bone. Unperson in the eyes of the vizier, you got to experience firsthand the many wonders of the South: backbreaking labor under the cruel desert sun, mortal combat in the arena, and forced hunts for the terrifying creatures of the sands."
		local introText3 = "\n\nIronically, it was those same creatures that brought you freedom. You and your fellow slaves were put into the service of a domineering southern officer tasked with clearing a nomad camp. He sent you indebted into the camp first to soften the raiders for his conscripts. Then, the Ifrit came, and chaos ensued. A pure madness of sand and rock, of men crushed into bloody pulp by boulders lofted through the air, screaming and yelling and sand-filled lungs and a desert come to horrific life. When the battle began to rage into the officer\'s ranks, you saw your chance. You and your companions pilfered what you could from the battlefield, then ran. You ran like you\'ve never run before, straight through the night."
		local introText4 = "\n\nYou know the vizier\'s hunters are coming, though. You\'ll be caught eventually, and if you don\'t turn this group of miserable, downtrodden slaves into warriors soon, all of you will surely perish - or worse. You won\'t let that happen. You\'ve suffered with these men, shed sweat, blood, and tears together, and formed a bond of brotherhood stronger than any blood tie. Whether through mercenary work or common brigandry, you\'ll see them shaped into soldiers the likes of which %viziershortname% has never seen, and damn anyone who gets in your way."
		local introText5 = "\n\nBut for now, you keep running."

		m.ID = "event.sato_escaped_slaves_scenario_intro";
		m.IsSpecial = true;
		m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_161.png[/img]" + introText1 + introText2 + introText3 + introText4 + introText5,
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Freedom shall be ours!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				Banner = "ui/banners/" + World.Assets.getBanner() + "s.png";
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		m.Title = "Escaped Slaves";
	}

	function onPrepareVariables( _vars )
	{
		local brothers = World.getPlayerRoster().getAll();
		local settlements = World.EntityManager.getSettlements();
		local closest;
		local distance = 9999;

		foreach( s in settlements )
		{
			local d = s.getTile().getDistanceTo(World.State.getPlayer().getTile());

			if (d < distance)
			{
				closest = s;
				distance = d;
			}
		}

		local f = closest.getFactionOfType(Const.FactionType.OrientalCityState);
		local vizier = f.getRandomCharacter();
		_vars.push([ "bro", brothers[0].getName() ]);
		_vars.push([ "vizierfullname", vizier.getName() ]);
		_vars.push([ "viziershortname", vizier.getNameOnly() ]);
	}

	function onClear()
	{
	}

});
