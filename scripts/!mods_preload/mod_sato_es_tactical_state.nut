::mods_queue("sato_escaped_slaves_origin", "", function() {
    ::mods_hookClass("states/tactical_state", function(ts) {
		local onBattleEnded = ts.onBattleEnded;

		ts.onBattleEnded = function() {
			local isVictory = Tactical.Entities.getCombatResult() == Const.Tactical.CombatResult.EnemyDestroyed || Tactical.Entities.getCombatResult() == Const.Tactical.CombatResult.EnemyRetreated;
			if (isVictory && !isScenarioMode()) {
				if (m.StrategicProperties != null && m.StrategicProperties.IsAttackingLocation) {
					if (World.Assets.getOrigin().getID() == "scenario.sato_escaped_slaves") {
						World.Statistics.getFlags().set("LastBattleWasLocation", true);
						local findCaptiveChance = 20;

						if (World.Statistics.getFlags().getAsInt("LastCombatFaction") == World.FactionManager.getFactionOfType(Const.FactionType.OrientalBandits).getID())
							findCaptiveChance += 10;
						else if (World.Statistics.getFlags().getAsInt("LastCombatFaction") == World.FactionManager.getFactionOfType(Const.FactionType.Zombies).getID())
							findCaptiveChance -= 10;

						if (Math.rand(1, 100) <= findCaptiveChance)
							World.Statistics.getFlags().set("FindCaptivePostBattle", true);
						else
							World.Statistics.getFlags().set("FindCaptivePostBattle", false);
					}
				} else {
					if (World.Assets.getOrigin().getID() == "scenario.sato_escaped_slaves") {
						World.Statistics.getFlags().set("LastBattleWasLocation", false);
						World.Statistics.getFlags().set("FindCaptivePostBattle", false);
					}
				}
			}

			onBattleEnded();
		}
	});
});
