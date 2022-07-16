::mods_queue("sato_escaped_slaves_origin", "", function() {
	::mods_hookExactClass("skills/backgrounds/slave_background", function(sb) {
		local getGoodEnding = ::mods_getMember(sb, "getGoodEnding");
		local getBadEnding = ::mods_getMember(sb, "getBadEnding");

		::mods_override(sb, "getGoodEnding", function() {
			if (("State" in World) && World.State != null && World.Assets.getOrigin() != null && World.Assets.getOrigin().getID() == "scenario.sato_escaped_slaves") {
				if (getEthnicity() == 1)
					return "You freed the indebted %name% and helped him find a new life as a sellsword. He did make himself an effective fighter, no doubt believing it was better to fight and live free than to fight and die. After your departure, you heard that the %companyname% traveled south on a campaign and the indebted got a good chance to exact a fair bit of revenge on a number of enemies in his past. You count yourself lucky to have had him in the company.";
				else
					return "%name% the indebted has had a rough life and you've both contributed to that and helped alleviate it in some way. You found him as a slave, far from family and home, and put him to work as a sellsword. After you left the %companyname%, he stayed on and has been rising through its ranks ever since. You hear he was so ferocious in a battle with manhunters that the city-states have reconsidered sending men after the company at all, fearing what might happen if he took the fight to them more directly.";
			}
			else
				return getGoodEnding();
		})

		::mods_override(sb, "getBadEnding", function() {
			if (("State" in World) && World.State != null && World.Assets.getOrigin() != null && World.Assets.getOrigin().getID() == "scenario.sato_escaped_slaves") {
				if (getEthnicity() == 1)
					return "You found %name% as an indebted and after your retiring, he went on with the %companyname%. Word of the mercenary band's problems have trickled in, but nothing about the indebted's current situation. Knowing how this world works, he has either been put into the vanguard as fodder or forced out to distract manhunters on the company's trail. Either way, the world isn't easy on a sellsword, and it isn't easy on an indebted, and the man is unfortunately both.";
				else
					return "With your retiring from the unsuccessful %companyname%, %name% the indebted from the north carried on with the company for a time. You got wind that the mercenary band ran into troubles with manhunters and had to leave behind both 'man and material' to escape. %name%'s time with the company presumably ended sometime there. You hope his time as a slave never started again.";
			}
			else
				return getBadEnding();
		})
	});
});
