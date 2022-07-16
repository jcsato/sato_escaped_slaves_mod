::mods_queue("sato_escaped_slaves_origin", "", function() {
    ::mods_hookClass("ui/screens/character/character_screen", function(cs) {
        local onDismissCharacter = cs.onDismissCharacter;

        cs.onDismissCharacter = function( _data )
        {
            local bro = Tactical.getEntityByID(_data[0]);

            if (bro != null)
            {
                if (bro.getSkills().hasSkillOfType(Const.SkillType.PermanentInjury) && bro.getBackground().getID() == "background.slave" && World.Assets.getOrigin().getID() == "scenario.sato_escaped_slaves")
                    World.Statistics.getFlags().increment("BrosWithPermanentInjuryDismissed");
            }

            onDismissCharacter(_data);
        }
    });
});