::mods_queue("sato_escaped_slaves_origin", "", function() {
    ::mods_hookNewObject("ambitions/ambitions/visit_settlements_ambition", function(vsa) {
		local onUpdateScore = vsa.onUpdateScore;

		vsa.onUpdateScore = function() {
			if (World.Assets.getOrigin().getID() == "scenario.sato_escaped_slaves")
				return;

			onUpdateScore();
		}
	}, false);
});
