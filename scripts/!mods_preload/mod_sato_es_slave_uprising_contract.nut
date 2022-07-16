::mods_queue("sato_escaped_slaves_origin", "", function() {
    ::mods_hookClass("contracts/contract_manager", function(cm) {
        local setActiveContract = cm.setActiveContract;

        cm.setActiveContract = function( _contract, _alreadyStarted = false )
        {
            setActiveContract(_contract, _alreadyStarted);

            if (World.Assets.getOrigin().getID() == "scenario.sato_escaped_slaves")
            {
                if (!_alreadyStarted && m.Active.getType() == "contract.slave_uprising")
                {
                    local brothers = World.getPlayerRoster().getAll();
                    foreach( bro in brothers )
                    {
                        if (bro.getBackground().getID() == "background.slave")
                            bro.worsenMood(3.0, "You took a contract to put down a slave uprising");
                    }
                }
            }
        }
    });
});
