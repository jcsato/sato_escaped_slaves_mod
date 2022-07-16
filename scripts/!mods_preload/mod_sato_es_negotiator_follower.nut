::mods_queue("sato_escaped_slaves_origin", "", function() {
    ::mods_hookNewObject("retinue/followers/negotiator_follower", function(af) {
        local onUpdate = af.onUpdate;

        af.onUpdate = function()
        {
            onUpdate();

            if (World.Assets.getOrigin().getID() == "scenario.sato_escaped_slaves")
            {
                World.Assets.m.RelationDecayGoodMult = 1.05;
                World.Assets.m.RelationDecayBadMult = 0.95;
            }
        };
    });
});
