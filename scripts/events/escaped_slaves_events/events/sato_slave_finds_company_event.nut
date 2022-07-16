sato_slave_finds_company_event <- inherit("scripts/events/event", {
	m = {
		Dude = null
	},
	function create()
	{
		m.ID = "event.sato_slave_finds_company";
		m.Title = "Along the road...";
		m.Cooldown = 15.0 * World.getTime().SecondsPerDay;
		m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_166.png[/img]{%joiner%, a wandering slave who escaped from manhunters on the road, seeks to join the company, apparently understanding it is made up of like-minded men. | A man by the name of %joiner% greets you, claiming to have heard tales of a mercenary company made of escaped slaves. Himself a man on the run from manhunters, he seeks to join you. | %joiner% trailed the company for days before finally working up the courage to approach you directly. Explaining that he himself escaped slavery in the south, he seeks to join the %companyname%. | You are approached by a escaped slave named %joiner%, who has been inspired by tales of a mercenary company of former slaves making a name for themselves in the world. He asks if he himself might join.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Yes, join us!",
					function getResult( _event )
					{
						World.getPlayerRoster().add(_event.m.Dude);
						World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						_event.m.Dude = null;
						return 0;
					}

				},
				{
					Text = "Your place is not with us, friend.",
					function getResult( _event )
					{
						World.getTemporaryRoster().clear();
						_event.m.Dude = null;
						return 0;
					}

				}
			],
			function start( _event )
			{
				local roster = World.getTemporaryRoster();
				_event.m.Dude = roster.create("scripts/entity/tactical/player");
				_event.m.Dude.setStartValuesEx([ "slave_background", "slave_southern_background", "slave_barbarian_background" ]);
				Characters.push(_event.m.Dude.getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		if (!Const.DLC.Desert)
			return;

        if (World.Assets.getOrigin().getID() != "scenario.sato_escaped_slaves")
            return;

		if (World.getPlayerRoster().getSize() >= World.Assets.getBrothersMax())
			return;

		local currentTile = World.State.getPlayer().getTile();

		if (!currentTile.HasRoad)
			return;

		m.Score = 15;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([ "joiner", m.Dude.getName() ]);
	}

	function onClear()
	{
		m.Dude = null;
	}

});

