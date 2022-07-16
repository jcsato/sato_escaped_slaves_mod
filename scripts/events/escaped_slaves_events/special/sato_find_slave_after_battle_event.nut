// Should trigger after...
// Raider camp - Southerner or Barbarian was held in captivity. Relatively rare.
// Barbarian camp - Barbarians were holding a northerner in cruel captivity. "Normal" commonality.
// Necromancer camp - Random background slave was bought by a necromancer for experiments. Always has fear or hate of undead. Quite rare.
// Nomad camp - Southerner or Northerner was being held as an indebted. Relatively common.
// 

sato_find_slave_after_battle_event <- inherit("scripts/events/event", {
	m = {
		LastCombatID = 0,
		Dude = null
	},
	function create()
	{
		m.ID = "event.sato_find_slave_after_battle";
		m.Title = "After the battle...";
		m.IsSpecial = true;

		local BanditBarbarian1 = "It is fairly uncommon to find prisoners in bandit camps, and rarer still for those prisoners to be barbarians from the north, yet here one such man stands before you. You doubt he was captured with little effort, given the strangled guard lying at his feet. Freeing him, you wonder if he might have a place in the %companyname%.";
		local BanditBarbarian2 = "A wide eyed and exceptionally disheveled man hides in the corner of the camp. Seeing you, he cowers and makes a series of whooping sounds and grunts. Clearly a prisoner, but judging by his physique, perhaps a warrior hides within. Should you take him into the company, or free him to make his way in the wilds?";
		local BanditBarbarian3 = "You\'re not sure what possessed the bandits to take a barbarian prisoner, nor how both parties survived long enough for you to encounter them, but here the man stands. His face is twisted in a crazed rage, but his shoulders are slumped and his eyes show the cold endured only by men in chains. Perhaps he would fit in with the company?";
		m.Screens.push({
			ID = "Bandits",
			Text = "[img]gfx/ui/events/event_53.png[/img]{" + BanditBarbarian1 + " | " + BanditBarbarian2 + " | " + BanditBarbarian3 + "}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Join us!",
					function getResult( _event )
					{
						World.getPlayerRoster().add(_event.m.Dude);
						World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						_event.m.Dude.m.MoodChanges = [];
						_event.m.Dude.improveMood(2.0, "Was rescued from captivity");
						_event.m.Dude = null;
						return 0;
					}

				},
				{
					Text = "Be free, friend.",
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
				_event.m.Dude.setStartValuesEx([ "slave_barbarian_background" ]);

				local text1 = "{%name% lived in the wilds for many years, eking out an existence in the harsh northern hinterlands. | Captured as a boy in a barbarian raid, %name% was raised by the northern savages as a thrall. He never forgot his home town, though, resolving to escape and return to his true home. One day, he did just that. | %name% was a skilled hunter for his tribe. One particularly harsh winter, the life in the hinterlands seemed to all but disappear, and the barbarian found himself venturing further and further in search of food.}";
				local text2 = "{Bandits found him on the road. | While cutting through a thicket, he stumbled into the middle of a brigand camp. | While hiding from wild animals in the forest, he encountered creatures far more dangerous: raiders.}";
				local text3 = "{Easily overwhelmed, he was captured, humiliated, and forced to do menial labor for the outlaws. | The outlaws tricked him into giving up his possessions as a toll, then subdued him when he caught on and tried to fight back. As punishment, and for their own amusement, they took him prisoner and forced him to maintain their camp. | The outlaws surrounded him and knocked him out. When he awoke, his hands and feet were already bound, and from then on he was forced to clean up after the highwaymen, pitch and teardown their tents, and handle any task they didn\'t feel like doing.}";
				local text4 = "{%name%\'s captivity came to an abrupt end, however, when you arrived at the camp and slew his captors. | Then one day the %companyname% attacked the camp, and %name% found himself without a gaoler. | Forced, that is, until a group of mercenaries showed up and slew the brigands to a man.}";
				local text5 = "{Now free, he fights for you. | In gratitude, he joined the company and now fights for you. | His former life thrown into disarray, he now fights for you, finding comfort in the company of men who\'ve endured trials like his own.}";

				local vars = [
					[ "companyname", World.Assets.getName() ],
					[ "name", _event.m.Dude.getNameOnly() ]
				];
				_event.m.Dude.getBackground().m.RawDescription = buildTextFromTemplate(text1 + " " + text2 + " " + text3 + " " + text4 + " " + text5, vars);
				_event.m.Dude.getBackground().buildDescription(true);
				Characters.push(_event.m.Dude.getImagePath());
			}

		});

		local BanditSoutherner1 = "As an institution, slavery holds little grip outside of the southern deserts, but as a practice it knows few borders. The southerner before you clearly learned that lesson the hard way. It seems the lure of free labor to handle camp duties was enough for the brigands to set aside more northern sensibilities. Now that his captors are dead, you wonder if the man would find life as a sellsword more suitable than menial labor.";
		local BanditSoutherner2 = "Of all the bonds that bring out the fear and ugliness and hatred in man, cultural disparity is perhaps the most powerful. Nothing elicits quite the same repulsion as that which is foreign. It is sadly little surprise, then, when you find a southerner chained and gagged in the corner of the raider\'s camp. The color of his skin, the timbre of his voice, his way of life, his religion, all of them combined must have made him appear so alien that even slavery seemed mundane and appropriate to the highwaymen.\n\nThe man\'s muffled cries cut your pontification short. Freeing him, you wonder if he might find a kinder fate in the %companyname%.";
		local BanditSoutherner3 = "A southerner comes running at you from out of nowhere and prostrates himself before you. Before you can say a word he begins thanking you profusely and proclaiming your arrival to be a work of the Gilder. You manage to glean from his babbling that he was held by the brigands as a prisoner and forced to do help them around camp against his will. As you calm him down, you wonder if he\'s thankful enough to fight for the %companyname%.";
		m.Screens.push({
			ID = "BanditsSoutherner",
			Text = "[img]gfx/ui/events/event_53.png[/img]{" + BanditSoutherner1 + " | " + BanditSoutherner2 + " | " + BanditSoutherner3 + "}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Join us!",
					function getResult( _event )
					{
						World.getPlayerRoster().add(_event.m.Dude);
						World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						_event.m.Dude.m.MoodChanges = [];
						_event.m.Dude.improveMood(2.0, "Was rescued from captivity");
						_event.m.Dude = null;
						return 0;
					}

				},
				{
					Text = "Be free, friend.",
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
				_event.m.Dude.setStartValuesEx([ "slave_southern_background" ]);

				local text1 = "{A merchant by trade, %name% was tasked with leading a caravan to the north to sell incense and silks. | %name% was a nomad of the south, living outside the influence of the viziers. After being exiled from his tribe for some unknown transgression, he traveled north. | A conscript in one of the many regiments of the south, %name% was tasked with guarding a caravan headed north.}";
				local text2 = "{Brigands found him on the road. The encounter saw him on the losing side and made captive in a land far from home. | The bandits caught him off guard. He struggled valiantly, but in the end he was bested and taken prisoner. | All was going smoothly until an impassable roadblock forced him to take a detour. On the way he was discovered by highwaymen, and one swift, brutal fight later, he found himself their prisoner.}";
				local text3 = "{The northerners ridiculed and mocked him incessantly, and when they got bored of that forced him to do work for them. | The outlaws hoped to ransom him, not realizing he lacked such importance. In the meantime, they put him to work hauling loot and supplies from their raids, overworking the southerner constantly. | In part to humiliate him, and in part because they needed the help, they quickly forced %name% to handle menial labor for their camp.}";
				local text4 = "{His captivity ended as suddenly as it started when the %companyname% raided the encampment and slew the raiders. | The brigands got their comeuppance, in the form of the %companyname% attacking the camp. The outlaws didn\'t last long. | You freed him when you assaulted the bandit\'s camp with the %companyname%.}";
				local text5 = "{Owing you a debt of gratitude, he now fights for you. | Not having any place to go back to, he decided to join the company. | Seeing his plight, you offered to let him join the company, an opportunity he gladly accepted.}";

				local vars = [
					[ "companyname", World.Assets.getName() ],
					[ "name", _event.m.Dude.getNameOnly() ]
				];
				_event.m.Dude.getBackground().m.RawDescription = buildTextFromTemplate(text1 + " " + text2 + " " + text3 + " " + text4 + " " + text5, vars);
				_event.m.Dude.getBackground().buildDescription(true);
				Characters.push(_event.m.Dude.getImagePath());
			}

		});

		local BarbBarbarianText1 = "One of the survivors stands grimly before you. He reminds you of a slave you once saw in a gladiator match. This barbarian has the expression, the look of a dead man kindled to life only by the knowledge that he can vent his rage on another in combat. You don\'t know the particulars of his situation, but it\'s clear he holds no allegiance to his dead fellows. Maybe he\'d be willing to join the %companyname%? He might meet a kinder fate with you than that gladiator did in the ring.";
		local BarbBarbarianText2 = "In one a corner of the camp, you find a barbarian with bound hands sitting cross-legged in a cage. You ask him how he ended up jailed. He jerks his head towards the corpses of the camp\'s former inhabitants.%SPEECH_ON%Not one of them.%SPEECH_OFF%He grunts. It seems there\'s little love lost between the him and the men you slew, at least. Perhaps you could convince him to join the %companyname%?";
		local BarbBarbarianText3 = "You don\'t know much about thralls or the inner workings of barbarian culture, but you do know those of the slave caste are usually the first thrust in combat. It is curious, then, to see one of the northerners alive in a cage before you, rather than dead on the battlefield. You don\'t know what circumstances led to him being left here while the rest fought, but maybe if the savages didn\'t want him fighting for them, that means you should seek out his allegiance for yourself?";
		m.Screens.push({
			ID = "Barbarians",
			Text = "[img]gfx/ui/events/event_53.png[/img]{" + BarbBarbarianText1 + " | " + BarbBarbarianText2 + " | " + BarbBarbarianText3 + "}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Join us!",
					function getResult( _event )
					{
						World.getPlayerRoster().add(_event.m.Dude);
						World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						_event.m.Dude.m.MoodChanges = [];
						_event.m.Dude.improveMood(2.0, "Was rescued from captivity");
						_event.m.Dude = null;
						return 0;
					}

				},
				{
					Text = "Be free, friend.",
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
				_event.m.Dude.setStartValuesEx([ "slave_barbarian_background" ]);

				local text1 = "{%name% was once chief of his own tribe, until an ambitious rival usurped him. To complete the humiliation, he was forced into thralldom. | Chosen by the Old Gods, %name% was sent out from his village to prove himself in combat. He found his match in another tribe, however, and was defeated, broken, and made a thrall. | %name% was born a thrall, forced to fight for his freedom for as long as he can remember.}";
				local text2 = "{He struggled against his captors constantly, unwilling to accept his fate, but his efforts brought him only to death\'s door, not freedom. His tenacity may well be what kept him alive, as the tribe felt his tenacity would be wasted on a death outside of battle. | As a member of the slave caste he was thrust into combat after combat, but no matter what he accomplished he was never accepted by the rest of the barbarians. He could never come to accept them, either. | Years of brutal combat and abuse eventually left him but a shadow of a man, downtrodden and hopeless, but unable to truly accept death. He knew his ancestor\'s would not take him as he was, but saw no hope of proving himself as a thrall, either.}";
				local text3 = "One particularly egregious transgression, however, left the tribe unable to bear his presence further. %name% was thrown in a cage and left there to be sacrificed next day, in the hopes that his death would appease the Old Gods. In a twist of fate, this separation from the rest of the tribe saved his life, as the %companyname% descended upon the camp and slew the savages wholesale.";
				local text4 = "{Freed by your intervention, the man now seeks to prove himself in battle under the company banner. | Seeing your arrival as a sign from the gods, %name% agreed to fight for you as a sellsword. | With his captors slain and his live as a thrall over, %name% now fights for you to seek redemption in the eyes of his ancestors.}";

				local vars = [
					[ "companyname", World.Assets.getName() ],
					[ "name", _event.m.Dude.getNameOnly() ]
				];
				_event.m.Dude.getBackground().m.RawDescription = buildTextFromTemplate(text1 + " " + text2 + " " + text3 + " " + text4, vars);
				_event.m.Dude.getBackground().buildDescription(true);
				Characters.push(_event.m.Dude.getImagePath());
			}

		});

		local BarbNorthernerText1 = "Towards the rear of the camp you find a bloody altar strewn with body parts and gore. Nearby you see a pen filled with the sad remains of captives who were spared the savage\'s rituals only to die from starvation, cold, or other tortures. Through some miraculous - or cruel - twist of fate, one among the prisoners still lives. He barely acknowledges your presence, darkly muttering and staring at the ground in front of him.\n\nYou tell the man you might be able to take him on in the %companyname%, although he might find himself fighting barbarians like these ones if he joins. He doesn\'t say anything, but gives you a strange look and stands up. It seems he\'s willing, at least.";
		local BarbNorthernerText2 = "Scouring the savage\'s camp, you find and free a man held captive, or what\'s left of him. The barbarians are evidently not kind to their prisoners. The man is unable to form words to describe his experience, but thanks you for freeing and offers to fight for you in return. Maybe with some time to recover, you\'ll find that the man\'s appearance belies his skill as a fighter?";
		local BarbNorthernerText3 = "The din of battle fading, you hear a truly impressive tirade of profanity coming from further in the camp. The sound leads you to a man thrashing and struggling against the ropes binding his hands and feet, all the while howling and wailing and cursing with language that would make hardened killers blush. Noticing you, the man frantically inchworms closer.\n\nOi! You there! Thank the Old Gods, an educated man at last! Quick, get me out of these ropes so I can go throttle those savages, those filthy beasts, those, those, those farkin whoresons! Quickly now, they'll get away!%SPEECH_OFF%You inform him the barbarians have already been slain and he breaks into an unintelligible stream of muttered insults and invectives. While you wouldn\'t want him with you in a contract negotiation, you can\'t deny the man has spirit to fight. Maybe he could put it to use in the %companyname%?";
		m.Screens.push({
			ID = "BarbariansNortherner",
			Text = "[img]gfx/ui/events/event_53.png[/img]{" + BarbNorthernerText1 + " | " + BarbNorthernerText2 + " | " + BarbNorthernerText3 + "}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Join us!",
					function getResult( _event )
					{
						World.getPlayerRoster().add(_event.m.Dude);
						World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						_event.m.Dude.m.MoodChanges = [];
						_event.m.Dude.improveMood(2.0, "Was rescued from captivity");
						_event.m.Dude = null;
						return 0;
					}

				},
				{
					Text = "Be free, friend.",
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
				_event.m.Dude.setStartValuesEx([ "slave_background" ]);

				local text1 = "{%name% was once a scribe in an isolated northern abbey who spent his days leisurely poring over tomes and sorting collections. | %name% grew up in one of the many small hamlets that dot the northern hinterlands. | Originally a lumberjack, %name% was content to spend the rest of his life in the beautiful forests of the north.}";
				local text2 = "{But his idyllic life was shattered when barbarians raided his home, stole all the valuables, and kidnapped as many as they could carry back with them. | Life in those lands is a harsh one, however, and while he was prepared for many of the dangers, he was not prepared enough for the barbarian raiders that sacked his home and took him captive. | Thinking them a misunderstood and largely inconsequential people, he rarely paid heed to the fearmongering about the barbarians of the north. While traveling to a nearby town, however, he came face-to-face with the savages, and found them just as dangerous as the rumors held. He was beaten senseless, tossed in a sack, and taken back to their village.}";
				local text3 = "{%name% was deemed too weak to be put into combat like the other thralls. Instead, he was put to work with more menial labor. On a good day, that meant tending to sacrificial livestock or cleaning gore out of the savage\'s ritual altars. On a bad day, he was used as a plaything by the men - or worse, by the women - for whatever cruelty or humiliation they felt like passing the time with. | %name% was made a thrall, and was told that this was a great honor for one not born in the barbarian tribes. In practice, however, this meant being forced into blood-curdling combat against other tribes, insane hunts to capture unholds for the beastmasters, and a life of misery, imprisonment, and ridicule at the hands of the freemen. | One of the tribe elders took an interest in %name% and took him in as an interpreter. Whenever the tribe had fresh captives from the surrounding area, %name% was made to explain their fate to them. It was cruel, heart-wrenching work, but disobedience had brutal consequences. %name% just counted his lucky stars that he wasn\'t made a thrall. He still refuses to talk about what was done to them when they failed to comply.}";
				local text4 = "{The man had given up hope of ever escaping his new life when a mercenary band - yours, specifically - stormed the tribe\'s camp and slew the barbarians. | The man lost track of time in captivity. All he knows is that one day the %companyname% raided the tribe, and his fate took another twist. | It was ultimately you who freed him when you ordered the company to wage war against the northmen. One brutal fight later, and he was a captive no longer.}";
				local text5 = "{Now he fights for you and the company, glad to see his days as a slave behind him. | Unable to return to his old life after what he endured, he now seeks solace fighting with the company. | The man decided to join you and seek a new life as a sellsword, and has been with the company since.}";

				local vars = [
					[ "companyname", World.Assets.getName() ],
					[ "name", _event.m.Dude.getNameOnly() ]
				];
				_event.m.Dude.getBackground().m.RawDescription = buildTextFromTemplate(text1 + " " + text2 + " " + text3 + " " + text4 + " " + text5, vars);
				_event.m.Dude.getBackground().buildDescription(true);
				Characters.push(_event.m.Dude.getImagePath());
			}

		});

		local NomadSouthernerText1 = "Inside one of the nomad\'s tents, you find a miserable looking man tidying the place up. Taking him to be their slave, you inform him that the nomads are dead and he is free to go, but he only looks at the floor glumly in response.%SPEECH_ON%My debt to the Gilder has not yet been paid. Where am I to go?%SPEECH_OFF%Angrily, you pull the man to his feet and tell him that he can pay his debt anywhere, and he can do it without chains. After a moment your words seem to sink in and you see tears of joy form in the man\'s eyes as the weight of his freedom sinks in, but you know he did have a point. There\'s not many opportunities out there for a former slave. Perhaps he might have a place in the %companyname%?"
		local NomadSouthernerText2 = "A man, naked save for a few rags, walks up to you.%SPEECH_ON%You slew these men, yes? You have my thanks. I was unjustly captured by them and forced into slavery, but with their deaths I am finally free. I admit I am not sure where to go now, but the fact that I may walk there on unfettered feet is joyous enough.%SPEECH_OFF%As the man turns to leave, you wonder if he might prefer life in the %companyname% to braving the deserts alone."
		local NomadSouthernerText3 = "You enter one of the nomads\' tents and are greeted with a most curious sight. A half naked man, wide-eyed in surprise, stands frozen over the body of a dead nomad. A leg of lamb hangs from his mouth by a sinewy thread, the meat dangerously close to falling. The man glances down his nose at it, then at you, then at the nomad corpse, then at his precarious meal again. You tell him he\'d better grab his food before he wastes it, and he practically melts in relief as he complies.\n\nYou gather that the nomads captured the man and made him their slave, and he attempted to use the confusion of the battle to escape - he had just killed his guard and was grabbing provisions when you walked in. You think so, anyhow - mouthfuls of lamb did his abilities as a storyteller no favors.\n\nRegardless of his table manners, it remains clear that the man is if nothing else able to kill for survival. Might his skills be put to better use in the %companyname%?"
		m.Screens.push({
			ID = "Nomads",
			Text = "[img]gfx/ui/events/event_53.png[/img]{" + NomadSouthernerText1 + " | " + NomadSouthernerText2 + " | " + NomadSouthernerText3 + "}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Join us!",
					function getResult( _event )
					{
						World.getPlayerRoster().add(_event.m.Dude);
						World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						_event.m.Dude.m.MoodChanges = [];
						_event.m.Dude.improveMood(2.0, "Was rescued from captivity");
						_event.m.Dude = null;
						return 0;
					}

				},
				{
					Text = "Be free, friend.",
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
				_event.m.Dude.setStartValuesEx([ "slave_southern_background" ]);
				local text1 = "{A conscript in one of the many regiments of the south, %name% was always proud of his work. His devotion went unnoticed by his officers, however, who sent the man on a doomed scouting mission to ferret out nomads hiding in the ocean of sand outside the city. | %name% used to be a treasure hunter, plumbing the depths of the myriad ruins and detritus of the old empire buried in the sands. One day, while searching for a famed library in the desert, he ventured into a sandstorm and was blown off-course. | %name% was a manhunter in a past life, ironically enough. He made a comfortable living hunting down deserters, convicts, and escaped slaves, until one day he strayed too deep into the desert while hunting a quarry.}";
				local text2 = "{It was the nomads who proved the more able hunters, however, catching the man by surprise and knocking him out in one fell swoop. | Isolated and unprepared to go so far afield, however, the man collapsed under the burning sun. When he awoke, he was already the nomad\'s captive. | If the man thought himself a hunter, the nomads that suddenly ambushed him and bound his hands cured him of the notion.}";
				local text3 = "{The outlaws declared %name% Indebted and forced him to serve them. A deep ire, fueled by his former station, led him to try to escape and fight back against his captors. As the beatings grew more brutal and the work more cruel, however, the ire turned to resignation. | They made him their slave. At first the ignobility gnawed at him, but malnourishment, abuse, and the bite of the lash eventually ground %name% down until he was nothing but a cold, empty husk of himself. | Enslaved by the outlaws, %name% was outraged by his fate and tried to escape. They stuffed him in a box for a week as punishment. Gradually, his rage cooled and an empty despair settled in.}";
				local text4 = "Seeing a new captive suffer the same fate as his own, however, rekindled his rage. He vowed then and there that he would free himself to fight against any who would enable such slavery.";
				local text5 = "{When the %companyname% raided the nomad camp and freed him, %name% knew it was his chance to help make things right. | A group of escaped slaves - your group of escaped slaves, specifically - felled the nomads in battle, and %name% knew then that his place was with them. | %name% saw the opportunity to make good on his newfound resolve when the %companyname% attacked and defeated his captors.}";
				local text6 = "He\'s been a part of the company since."

				local vars = [
					[ "companyname", World.Assets.getName() ],
					[ "name", _event.m.Dude.getNameOnly() ]
				];
				_event.m.Dude.getBackground().m.RawDescription = buildTextFromTemplate(text1 + " " + text2 + " " + text3 + " " + text4 + " " + text5 + " " + text6, vars);
				_event.m.Dude.getBackground().buildDescription(true);
				Characters.push(_event.m.Dude.getImagePath());
			}

		});

		local NomadNorthernerText1 = "A crazed looking man, his feet bound in chains, comes galloping out of the camp yelling something about divine retribution, and how he always knew the old gods were looking out for him. He starts kicking at a nomad\'s corpse and you quickly move to calm him down before things get out of hand. After you explain the situation, he delivers a final kick to the nearest body and explains that he was taken prisoner by the nomads and forced into slavery. Perhaps with his captors gone, he might find a place in the %companyname%?";
		local NomadNorthernerText2 = "A pitiful looking northerner hobbles out of one of the nomad\'s tents.%SPEECH_ON%Did you kill them? The desert people, I mean. If so, you have my thanks. Those bastards killed my comrades and took me prisoner. Said I owed some kind of debt to that devil they worship, the \'guilter\' or whatever stupid name they gave it. Farkin\' southerners...%SPEECH_OFF%He trails off, his cold eyes taking in the carnage of the battle with an unusual calm. If he can keep that cool in front of living enemies as well as dead ones, he might just have a successful career as a sellsword. Perhaps you should take him into the %companyname%?";
		local NomadNorthernerText3 = "Surveying the battlefield, you see one of the surviving nomads limp into a tent. Giving chase, you enter the tent and find the outlaw about to kill a northerner chained to a post inside. Drawing your sword, you swiftly cut down the would-be executioner. Through all of this, the captive remains calmly seated, taking in his gaoler\'s death and your own entrance like a fine wine. You tell the man his composure is impressive, given the situation.%SPEECH_ON%I have not wasted the solitude of captivity. Just as I know I am part of The Great Plan, I knew I would not die here.%SPEECH_OFF%You don\'t much care for religious fanatics, but the man\'s cool in the face of death is impressive. You wonder if he might do well applying that iron will to mercenary work.";
		local NomadNorthernerText4 = "Surveying the battlefield, you see one of the surviving nomads limp into a tent. Giving chase, you enter the tent and find the outlaw about to kill a northerner chained to a post inside. Drawing your sword, you swiftly cut down the would-be executioner. Through all of this, the captive remains calmly seated, taking in his gaoler\'s death and your own entrance like a fine wine. You tell the man his composure is impressive, given the situation.%SPEECH_ON%I have not spent my captivity in solitude. I knew Davkul did not yet wish for my death.%SPEECH_OFF%You don\'t much care for religious fanatics, but the man\'s cool in the face of death is impressive. You wonder if he might do well applying that iron will to mercenary work.";
		m.Screens.push({
			ID = "NomadsNortherner",
			Text = "[img]gfx/ui/events/event_53.png[/img]{" + NomadNorthernerText1 + " | " + NomadNorthernerText2 + " | " + NomadNorthernerText3 + " | " + NomadNorthernerText4 + "}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Join us!",
					function getResult( _event )
					{
						World.getPlayerRoster().add(_event.m.Dude);
						World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						_event.m.Dude.m.MoodChanges = [];
						_event.m.Dude.improveMood(2.0, "Was rescued from captivity");
						_event.m.Dude = null;
						return 0;
					}

				},
				{
					Text = "Be free, friend.",
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
				_event.m.Dude.setStartValuesEx([ "slave_background" ]);

				local text1 = "{%name% was a hunter in a past life, tracking down dangerous beasts that threatened his village. | Once a monk, %name% was always struck by wanderlust and always volunteered for any tasks that took him outside his abbey. | A courier by trade, %name% always enjoyed seeing the world and tried to take the scenic route whenever possible.}";
				local text2 = "{One day he ventured too far, however, and found himself confronted with a danger he hadn\'t prepared for: nomads from the southern deserts. Some terse words and a short scuffle saw him taken prisoner by the outlaws. | His travels took him to the south, where he encountered a group of nomads who decided his true purpose in life was to be their slave. He was swiftly knocked out, captured, and taken back to their camp. | Wandering into the southern steppe turned out to be a little too far afield, however. Nomads captured him in a raid and took him with them, forcing him into slavery.}";
				local text3 = "{%name%\'s captors explained his fate to him politely and with patience, but their kindness ended there. The man won\'t speak of the hardships he was subject to, but his scars do the talking for him. | Subject to the full measure of ignobility and hardship of being treated as a thing, %name% turned to meditation for solace. It seems he found inner peace, which is good considering the physical hardships evidenced by his outer appearance. | %name% was given a crash course in southern religion and made to understood that he owed a debt to the Gilder, which he would pay off by serving his new captors. And serve he did, enduring the sun\'s cruel gaze and the lash\'s cruel bite in equal measure.}";
				local text4 = "{Things stayed that way for longer than the man cares to remember, until one day the %companyname% arrived and defeated the nomads in combat. | It was the %companyname% that freed him, slaying his masters and ending the man\'s captivity. | He says he spent months planning an escape, and was about to spring his plan when guards caught him stealing supplies. That explains the bruises he had when you attacked the nomads and freed him.}";
				local text5 = "{In gratitude, he now fights with you. | Unsure how to return to his past life, if he can at all, for now he\'s trying his hand at the mercenary life. | With nowhere else to go, he joined the company.}";

				local vars = [
					[ "companyname", World.Assets.getName() ],
					[ "name", _event.m.Dude.getNameOnly() ]
				];
				_event.m.Dude.getBackground().m.RawDescription = buildTextFromTemplate(text1 + " " + text2 + " " + text3 + " " + text4 + " " + text5, vars);
				_event.m.Dude.getBackground().buildDescription(true);
				Characters.push(_event.m.Dude.getImagePath());
			}

		});

		local UndeadSlaveText1 = "A man steps into open practically wearing the surrounding graveyard. All of manner of dirt, grime, and gore cling to him - a forearm grips his ankle, a nachzehrer horn held loosely in his hand drips blackened blood, and you swear he has a faint blue shimmer about him. He slowly approaches and politely greets you, calmly explaining that he was held captive for some time. Hours ago, his captors decided he has outlived his usefulness and left him here to die. He held out against the graveyard\'s inhabitants as best he could, then you showed up.\n\nYou\'re not sure you buy that story, but the viscera clinging to him does give a hint of credibility, and if nothing else points to remarkable resilience. Maybe he would be a useful addition to the %companyname%?";
		local UndeadSlaveText2 = "Seemingly from nowhere, a man with bound hands approaches you. He makes a pathetic whimpering sound and holds his hands out towards you begging you to cut him free. You do so. The man must surely have quite the story to tell, but it\'s evident from the scars that dot his naked body and the lack of fat on his bones that he\'s been captive for quite some time. Perhaps in exchange for his freedom and a reliable meal, he\'d be willing to join the %companyname%?";
		local UndeadSlaveText3 = "A man runs out from behind a gravestone yelling and raving madly. You almost cut him down in surprise, but as he gets near he throws himself at your feet and starts sobbing out thanks. It takes several minutes for him to calm down enough to form coherent sentences. He speaks of dark things, of profane experiments performed on both the living and the dead by a man in black. The man before you is the sole survivor, claiming he escaped the fate of the others by hiding under a pile of corpses deemed too rotten to be of use. That part of his tale, at least, is lent credence by his appearance.\n\nWhile the man is thoroughly wretched and obviously abused, he clearly has resourcefulness and tenacity that would serve him well in a mercenary outfit. Perhaps he has a place in the %companyname%?";
		m.Screens.push({
			ID = "Undead",
			Text = "[img]gfx/ui/events/event_53.png[/img]{" + UndeadSlaveText1 + " | " + UndeadSlaveText2 + " | " + UndeadSlaveText3 + "}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Join us!",
					function getResult( _event )
					{
						World.getPlayerRoster().add(_event.m.Dude);
						World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						_event.m.Dude.m.MoodChanges = [];
						_event.m.Dude.improveMood(2.0, "Was rescued from captivity");
						_event.m.Dude = null;
						return 0;
					}

				},
				{
					Text = "Be free, friend.",
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

				local cultureResult = Math.rand(1, 4);
				local vars = [
					[ "companyname", World.Assets.getName() ],
					[ "name", _event.m.Dude.getNameOnly() ]
				];
				local backgroundText1 = "";
				local backgroundText2 = "";
				local backgroundText3 = "{%name% was made to assist in the madman\'s depraved experiments. Sometimes this simply meant hauling corpses, but often meant far worse. You recall the terrified glances %name% sometimes gives village girls and decide not to pry further. | A curiosity for his physique, %name% was studied, prodded, poked, sometimes even cut open. | %name% was forced to compete with the madman\'s undead minions in strange, esoteric feats of physical prowess or martial prowess.}";
				local backgroundText4 = "{One day, however, the opportunity to escape arose, and the man took it without hesitation. The %companyname% wiped the camp clean, and with nowhere else to go he now fights for you. | It was you who gave him the chance for freedom, when you stormed the lair and slew its inhabitants. Seeing it the obvious choice, the man decided to fight for you.}";

				if (cultureResult == 4) {
					_event.m.Dude.setStartValuesEx([ "slave_southern_background" ]);

					backgroundText1 = "{%name% claims to have once been an assassin of one of the southern guilds. He was tasked with killing a man accused of using foul magic to bring the dead to unnatural life. He tracked the target to his lair and was poised to strike. | A nomad whose tribe was massacred by a necromancer, %name% traveled far and wide in search of revenge. Eventually finding the lair of the man he believed responsible, all that remained was to storm the redoubt and kill its inhabitant. | %name% was originally a manhunter. One day he was tasked with hunting down a particularly dangerous escapee: a necromancer responsible for the destruction - and subsequent resurrection - of an entire regiment. Undeterred, %name% accepted and tracked the sorcerer to his lair in the wilds.}";
					backgroundText2 = "{It was a trap. Before he could react, the man found himself surrounded by once-dead men. He fought them bravely, but was eventually overwhelmed by their numbers. When he awoke, he was the necromancer\'s prisoner. | For all his preparedness, however, the man failed to notice the hands clawing out of the ground underneath him until it was too late. The fleshy automatons that arose bound him, and he found himself the necromancer\'s captive. | As he charged in, however, he was surprised to find not just the necromancer, but a host of rotting corpses surrounding him as well. He fought, but their numbers were too great. To his horror, he was not killed, but instead captured.}";
				} else if (cultureResult == 3) {
					_event.m.Dude.setStartValuesEx([ "slave_barbarian_background" ]);

					backgroundText1 = "{A wildman who abandoned society long ago, %name% was content to live out the rest of his life in the forests of the wild. But one day alien creatures began to roam the woods, things that should be dead, things that should not be at all. The man searched for the source and found a sorcerer\'s lair on the periphery of the wilds. | Tasked by the elder\'s to purge the Untoward, %name% travelled the lands putting the undead back in the ground. Always hunting for the Source, one day his search yielded fruit - a profane lair where a man in black robbed men of their deaths. | Originally a barbarian from the north, %name%\'s returned from a hunting trip to find his village utterly devastated, the victim of an undead incursion. Swearing vengeance, he tracked the cursed creatures down and slew them one by one, until only the mastermind behind them remained.}";
					backgroundText2 = "{The necromancer acted first - hired ruffians kidnapped him in the night, and in the morning he awoke a prisoner. | But the man\'s nemesis took the initiative, and as he approached grasping hands sprung from the ground and restrained him. A cloaked figure, glowing red eyes, and then nothingness. When he came to, he was already in chains. | But the necromancer was not caught unaware. As the man charged in bravely to slay his foe, dead men in armor appeared from all around and held him down. He was chained, his rage unspent and his mission unfulfilled.}";
				} else {
					_event.m.Dude.setStartValuesEx([ "slave_background" ]);

					backgroundText1 = "{%name% was a witchhunter, known for the singlemindedness of his crusade against the hexen and their dark crafts. Rumors of strange magic and terrorized townspeople saw his hunts lead him further and further into the wilderness. | While priests are not usually known for their investigative tendencies, %name% nonetheless found himself thrust into the inquisitor\'s role when when the village dead began rising from their graves. | A simple farmer, %name%\'s life was an inauspicious one, until one day people from his village started disappearing and he took it upon himself to find them.}";
					backgroundText2 = "But his search turned up something more sinister than the man had expected - a necromancer performing profane experiments on both living and dead. He tried to run, but grasping hands and rotting bodies blocked his path, and before he could react he was knocked out and taken prisoner.";
				}

				_event.m.Dude.getBackground().m.RawDescription = buildTextFromTemplate(backgroundText1 + " " + backgroundText2 + " " + backgroundText3 + " " + backgroundText4, vars);
				_event.m.Dude.getBackground().buildDescription(true);
				Characters.push(_event.m.Dude.getImagePath());
			}

		});
	}

	function isValid()
	{
		if (!Const.DLC.Desert)
			return false;

		if (World.Assets.getOrigin().getID() != "scenario.sato_escaped_slaves")
			return;

        if (!World.Statistics.getFlags().get("FindCaptivePostBattle"))
            return;

		if (World.Statistics.getFlags().getAsInt("LastCombatID") <= m.LastCombatID)
			return;

		if (Time.getVirtualTimeF() - World.Events.getLastBattleTime() > 5.0 || World.Statistics.getFlags().getAsInt("LastCombatResult") != 1)
			return false;

		if (World.getPlayerRoster().getSize() >= World.Assets.getBrothersMax())
			return false;

		local f = World.FactionManager.getFaction(World.Statistics.getFlags().getAsInt("LastCombatFaction"));

		if (f == null)
			return false;

		if (f.getType() != Const.FactionType.Zombies && f.getType() != Const.FactionType.Bandits && f.getType() != Const.FactionType.Barbarians && f.getType() != Const.FactionType.OrientalCityState && f.getType() != Const.FactionType.OrientalBandits)
			return false;

		m.LastCombatID = World.Statistics.getFlags().get("LastCombatID");
		return true;
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onDetermineStartScreen()
	{
		local f = World.FactionManager.getFaction(this.World.Statistics.getFlags().getAsInt("LastCombatFaction"));

		if (f.getType() == this.Const.FactionType.Bandits)
		{
			if (this.Math.rand(1, 100) <= 40)
				return "Bandits";
			else
				return "BanditsSoutherner";
		}
		else if (f.getType() == this.Const.FactionType.Barbarians)
		{
			if (this.Math.rand(1, 100) <= 50)
				return "Barbarians";
			else
				return "BarbariansNortherner";
		}
		else if (f.getType() == this.Const.FactionType.OrientalBandits)
		{
			if (this.Math.rand(1, 100) <= 60)
				return "Nomads";
			else
				return "NomadsNortherner";
		}
		else if (f.getType() == this.Const.FactionType.Zombies)
			return "Undead";
	}

	function onClear()
	{
		this.m.Dude = null;
	}

	function onSerialize( _out )
	{
		this.event.onSerialize(_out);
		_out.writeU32(this.m.LastCombatID);
	}

	function onDeserialize( _in )
	{
		this.event.onDeserialize(_in);

		if (_in.getMetaData().getVersion() >= 54)
		{
			this.m.LastCombatID = _in.readU32();
		}
	}

});

