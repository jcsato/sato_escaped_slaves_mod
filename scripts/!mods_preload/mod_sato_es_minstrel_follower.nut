::mods_queue("sato_escaped_slaves_origin", "", function() {
    ::mods_hookNewObject("retinue/followers/minstrel_follower", function(mf) {
        local isVisible = mf.isVisible;

        mf.isVisible = function()
        {
            if (World.Assets.getOrigin().getID() == "scenario.sato_escaped_slaves")
                return false;
            else
                return isVisible();
        };
    });
});
