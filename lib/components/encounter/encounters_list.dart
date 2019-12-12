import 'package:shelter_adventure/components/encounter/encounter.dart';

final List<Encounter> encounters = [
  Encounter(
    text:
        'A customer brings in their sick gecko. He hasn\'t eaten a cricket in a week. He looks unhappy.',
    agreeText: 'Accept the gecko as a patient',
    disagreeText: 'Refer the gecko to counseling',
    agreeResultText:
        'You set up a small habitat on your desk and send your assistant to find crickets.',
    disagreeResultText:
        'The gecko resumes eating, but does not forgive his parents.',
    agreeEffect: [-10, -10, 20, 10],
    disagreeEffect: [10, 10, -10, 0],
  ),
  Encounter(
    text:
        'Two neighborhood cats ambush you in the alley behind the shelter and demand pets, or else!',
    agreeText: 'Pet them until they are satisfied',
    disagreeText: 'Catch them and bring them inside to check for microchips',
    agreeResultText: 'They let you leave after a few strained minutes.',
    disagreeResultText: 'You have two more stray cats to feed.',
    agreeEffect: [-7, 0, 4, 7],
    disagreeEffect: [-5, 10, -5, 0],
  ),
  Encounter(
    text: 'There are ants in the break room.',
    agreeText: 'Get the vacuum',
    disagreeText: 'Let them be - you have work to do',
    agreeResultText: 'Vrooooom!',
    disagreeResultText: 'The little one stops to tie its shoe.',
    agreeEffect: [4, 0, 0, 0],
    disagreeEffect: [12, 0, 0, -8],
  ),
  Encounter(
      text:
          'A local reporter wants to interview you about a rise in stray cats in the area.',
      agreeText: 'Give the interview',
      disagreeText: 'You don\'t have time for that!',
      agreeEffect: [-5, 12, 6, -5],
      disagreeEffect: [5, 0, -5, 3],
      agreeResultText: 'You were a bit nervous at first, but it goes well.',
      disagreeResultText: 'He sends you a snarky email two weeks later. Truly a consummate professional.'),
  Encounter(
      text:
          'Four friends approach you and gently remind you about that time you promised to throw a party for all of the neighborhood dogs.',
      agreeText: 'Start planning',
      disagreeText: 'Deny that ever happened',
      agreeResultText: 'It takes longer to put together than you anticipated, and one of the dogs throws up on the cake.',
      disagreeResultText: 'You feel slightly ashamed but justified in your decision. You\'re already too busy helping animals at work.',
      agreeEffect: [-6, 8, 8, -4],
      disagreeEffect: [5, 0, -10, 10]),
  Encounter(
      text:
          'You have a grant application to finish by tomorrow, but you have tickets to go see a big rock band. The concert starts in an hour.',
      agreeText: 'Leave the paperwork for tomorrow',
      disagreeText: 'Stay and finish the paperwork',
      agreeResultText: 'Tomorrow is really busy and it doesn\'t get done.',
      disagreeResultText: 'Your friends have a great time at the concert.',
      agreeEffect: [-13, 0, 0, 20],
      disagreeEffect: [12, 12, 0, -16]),
  Encounter(
    text:
        'Your phone rings. It is the mayor. He wants you to take in a crocodile that was found in a pool.',
    agreeText: 'Get the bathtub ready',
    disagreeText:
        'Tell the mayor politely that is ridiculous and that he\'ll have to come up with a better plan',
    agreeResultText:
        'The food bill goes up significantly, and the mayor boasts of brokering the deal at a campaign speech.',
    disagreeResultText: 'The crocodile is sent to florida at taxpayer expense.',
    agreeEffect: [-25, 15, 25, -12],
    disagreeEffect: [6, -5, -10, 12],
  ),
  Encounter(
      text: 'The neighbors ask if you can look after their rabbits.',
      agreeText: 'Tell them no problem',
      disagreeText: 'Freeze in place and don\'t respond to their questions',
      agreeResultText: 'The rabbits are irritable, but oh so cute!',
      disagreeResultText: 'They give you a strange look as they leave.',
      agreeEffect: [-6, 8, 11, -2],
      disagreeEffect: [7, -1, -12, 10]),
  Encounter(
    text:
        'A dirty, disoriented person walks into the shelter, and asks for help finding their way home.',
    agreeText: 'Try to figure out where they live',
    disagreeText: 'Give them bus fare',
    agreeResultText:
        'You spend several minutes teasing apart what they actually know about their life, until they finally explain they are a millionaire testing your compassion. Big donation incoming!',
    disagreeResultText: 'They mumble their thanks and wander out the door.',
    agreeEffect: [29, -3, -1, -5],
    disagreeEffect: [3, 2, -5, 1],
  ),
  Encounter(
    text: 'A dog was stolen!',
    agreeText: 'Check the security cameras and call the cops!',
    disagreeText: 'That\'s as good as adopting, right?',
    agreeResultText:
        'You recognize a former employee and quickly recover rover.',
    disagreeResultText: 'The kennels are a little bit quieter.',
    agreeEffect: [16, 0, -2, 0],
    disagreeEffect: [-4, 0, 4, 5],
  ),
  Encounter(
    text:
        'The fire chief calls and asks if you might have any Dalmatians they can rent for a fundraiser event.',
    agreeText:
        'Get the sharpie and all your white short-haired dogs ready for showtime',
    disagreeText: 'Offer him all your mutts for free instead',
    agreeResultText: 'The fundraiser is a big success. Everyone was fooled. Well, maybe not the dogs.',
    disagreeResultText:
        'Two dogs find forever homes. The dogs stole the show and the fire department didn\'t raise any money.',
    agreeEffect: [2, 4, 4, -2],
    disagreeEffect: [0, 13, -5, 0],
  ),
  Encounter(
    text: 'The sausages you were about to eat are missing from your desk.',
    agreeText: 'Order a sandwich from the deli instead',
    disagreeText: 'Line the dogs up and see who looks the most guilty',
    agreeResultText:
        'You ask for no pickle, but you get pickle. You suspect it was intentional.',
    disagreeResultText: 'You are unable to locate the sausage thief. Where\'s that dog-gone hot dog gone?',
    agreeEffect: [3, 5, 0, -2],
    disagreeEffect: [-4, 1, 0, 3],
  ),
  Encounter(
    text:
        'Your biscuit supplier has decided to quit the industry and go to college to pursue a career in international relations.',
    agreeText: 'Wish her luck in all future endevors',
    disagreeText: 'Try to talk her out of it',
    agreeResultText: 'Ten years later she becomes the ambassador to Finnland.',
    disagreeResultText: 'She is not convinced, but seems shaken by your words.',
    agreeEffect: [0, -1, 7, 0],
    disagreeEffect: [0, 0, 0, 0],
  ),
  Encounter(
    text:
        'Wiley the weasel, a local radio personality and real-life weasel, is brought in by DJ Mike. In a hushed tone, he explains, well ... Wiley\'s poop has been smelling kind of funny recently.',
    agreeText: 'Get Wiley on a diet of carrots and cabbage',
    disagreeText: 'Tell Mike you have real problems to solve',
    agreeResultText:
        'Wiley is back on air the next morning, squeaky as ever and apparently irritated by local drivers.',
    disagreeResultText:
        'You work efficiently for the rest of the afternoon. On the radio the next morning, Wiley sounds bloated and lethargic.',
    agreeEffect: [-3, 3, 6, 0],
    disagreeEffect: [9, -2, -5, 3],
  ),
  Encounter(text: 'A crotchety dog comes into the shelter with a scrawled note tucked in his collar: "kurst prints - pleez kiss"',
    agreeText: 'Smooch that pooch!',
    disagreeText: 'Maybe just a little hug instead',
    agreeResultText: 'The dog\'s arthritis clears up in the blink of an eye. He thanks you with the keys to his father\'s castle... actually he just spits out a milk bone for you.',
    disagreeResultText: 'The dog\'s eyes bulge, and he tries to squirm away.',
    agreeEffect: [0, 1, -4, 0],
    disagreeEffect: [0, -5, 0, 3],
  ),
  Encounter(text: 'STICK \'EM UP!',
    agreeText: 'Empty the register',
    disagreeText: 'Run out the back',
    agreeResultText: 'You dole out the cash and the robber swiftly departs.',
    disagreeResultText: 'The cash is relatively safe, but  robber steals all the decorations from your front office!',
    agreeEffect: [-5, 0, 0, -2],
    disagreeEffect: [0, 0, -1, -8],
  ),
  Encounter(text: 'There is broken glass and the front door is wide open this morning.',
    agreeText: 'Clean up from the robbery and get on with things.',
    disagreeText: 'Clean up, and try to solve the crime yourself!',
    agreeResultText: 'The morning is shot, but you get most of your work done for the day.',
    disagreeResultText: 'You clip on your sleuthing bonnet and spend the day follow the trail of kibble to the house of a former adopter! The news story goes viral!',
    agreeEffect: [-3, 0, 4, -5],
    disagreeEffect: [-7, 0, 16, -1],
  ),
  Encounter(text: 'A high-volume shelter can transfer 50 dogs to you, but it has to be all or none.',
    agreeText: 'The more, the hairier!',
    disagreeText: 'No room at the Rin Tint Inn',
    agreeResultText: 'It seems like every time you clean something up, there\'s suddenly two more to take its place.',
    disagreeResultText: 'It\'s actually kind of quite in here today.',
    agreeEffect: [-10, 15, 4, -4],
    disagreeEffect: [5, -1, 0, 3],
  ),
  Encounter(text: 'An employee has been chronically late to work.',
    agreeText: 'Ask them to come in much, much later',
    disagreeText: 'Explain why it\'s important to be on time',
    agreeResultText: 'They are confused by your phrasing, and it takes several minutes of explanation before they understand that you are firing them.',
    disagreeResultText: 'They clean up their act over the next few weeks.',
    agreeEffect: [1, 4, 0, -8],
    disagreeEffect: [1, 0, 0, 0],
  ),
  Encounter(text: 'Oh no! The computers are down, and you can\'t process adoptions!',
    agreeText: 'Use paper and copy everything back into the computer later',
    disagreeText: 'Hold off on adoptions for now',
    agreeResultText: 'You get more animals into their forever homes, but it\'s gonna be a lot of work later.',
    disagreeResultText: 'No cats and dogs go home today, but you use the time to clean and organize.',
    agreeEffect: [-18, 3, 1, 0],
    disagreeEffect: [4, -3, -4, 1],
  ),
  Encounter(text: 'The power is out!',
    agreeText: 'Buy a generator',
    disagreeText: 'Evacuate',
    agreeResultText: 'That was a shockingly good idea.',
    disagreeResultText: 'You set up shop in an abandoned warehouse across town. Somehow, it is draft and cozy at the same time.',
    agreeEffect: [-1, 10, 0, 0],
    disagreeEffect: [0, 10, 0, -3],
  ),
  Encounter(text: 'No customers come in today. How do you spend the extra time?',
    agreeText: 'Cleaning',
    disagreeText: 'Writing grants',
    agreeResultText: 'Spot never looked so spotless!',
    disagreeResultText: 'You get all the dough you knead.',
    agreeEffect: [0, 17, 0, 5],
    disagreeEffect: [6, 0, 1, 0],
  ),
  Encounter(text: 'You find a field of catnip in the forest. Do you keep it for the shelter cats or sell it, to buy less-recreational supplies.',
    agreeText: 'Every cat deservse a little break',
    disagreeText: 'Let\'s get kibble before we go crazy',
    agreeResultText: 'The resulting videos are what the internet is all about. It\'s social media gold!',
    disagreeResultText: 'With a level head and an even keel, you steer the ship toward gradual prosperity.',
    agreeEffect: [-3, 0, 26, 0],
    disagreeEffect: [13, 3, 0, 0],
  ),
  Encounter(text: 'Time for fundraising!',
    agreeText: 'Bake sale',
    disagreeText: 'Raffle',
    agreeResultText: 'The muffins sell like hot cakes!',
    disagreeResultText: 'You make a lot of business connections while soliciting donations.',
    agreeEffect: [5, 1, 0, 0],
    disagreeEffect: [0, 0, 6, 0],
  ),
  Encounter(text: 'You plan to attend an enrichment seminar. How many other staff members do you bring?',
    agreeText: 'Just me',
    disagreeText: 'Whoever wants to come!',
    agreeResultText: 'You learn plenty, and enjoy a working vacation.',
    disagreeResultText: 'You all split up, so you can attend more talks. Good idea, Scoob.',
    agreeEffect: [4, 0, 0, 9],
    disagreeEffect: [25, 0, 0, -4],
  ),
  Encounter(text: 'An employee has been stealing meds.',
    agreeText: 'Fire them',
    disagreeText: 'Fire them and involve the police',
    agreeResultText: 'They\'re out of your hair, at least.',
    disagreeResultText: 'Some tough love was necessary, and it turns out they had been stealing from all sorts of places around town. You stopped a crime wave!',
    agreeEffect: [2, 5, 0, -2],
    disagreeEffect: [-2, 3, 16, -1],
  ),
  Encounter(text: 'The Duranda dog bed company just donated 1,001 extra-large dog beds. What a windfall!',
    agreeText: 'Free bed with every adoption',
    disagreeText: 'Sell them',
    agreeResultText: 'You pay it forward. Everyone\'s a winner in this snooze fest!',
    disagreeResultText: 'You roll out of bed each day and wonder if you\'ll ever be able to roll all those beds out. Eventually, you do. Ka-ching!',
    agreeEffect: [0, 6, 18, 0],
    disagreeEffect: [28, 0, 0, 0],
  ),
  Encounter(text: 'You\'re running low on kibble.',
    agreeText: 'Purchase kibble',
    disagreeText: 'Solicit donations from the public',
    agreeResultText: 'You swap that cheddar for chow... der. Wait, that\'s not right. You trade that bread for biscuits... not quite. You spend that dough on doggy din din... close enough.',
    disagreeResultText: 'You spend time drawing on your greatest resource, the community. And they come through with all the cans and bags you need for quite a while.',
    agreeEffect: [-5, 4, 0, 0],
    disagreeEffect: [5, 0, -2, -1],
  ),
  Encounter(text: 'There are very few animals in the shelter right now.',
    agreeText: 'Arrange for a van load from another crowded shelters',
    disagreeText: 'Take a few extra days for some top-to-bottom cleaning',
    agreeResultText: 'Your contacts are relieved to get your help. And the new puppies and kitties are so dang CUTE!',
    disagreeResultText: 'It really gets everywhere, doesn\'t it?',
    agreeEffect: [-12, 7, 4, 0],
    disagreeEffect: [19, -16, 0, 5],
  ),
  Encounter(text: 'It’s kitten season! So it\'s a lot like that tribble episode of Star Trek.',
    agreeText: 'Get them spayed and neutered ASAP',
    disagreeText: 'Wait for cheaper appointments',
    agreeResultText: 'It costs plenty more, but you can also adopt them out sooner.',
    disagreeResultText: 'Their tenure drums up a lot of interest. Every one of them finds a purrfect-fit forever home!',
    agreeEffect: [2, 5, 0, 0],
    disagreeEffect: [-4, 16, 4, 0],
  ),
  Encounter(text: 'The motion detectors go off at night. You discover a member of the public was hiding in the shleter after hours!',
    agreeText: 'Ask why',
    disagreeText: 'Wait and watch on the security cameras',
    agreeResultText: '"If you must be nosy. The kennel looked cozy. And then I got doze-y! Does that answer your posey?"',
    disagreeResultText: 'They bump their way to the front office, directly to the donation box... into which they stuff a fat roll of bennies!',
    agreeEffect: [0, 0, 0, 20],
    disagreeEffect: [26, 0, 0, 0],
  ),
  Encounter(text: 'The most playful little tortoise shell kitty was rescued from a garbage bin. What name do you choose?',
    agreeText: 'Oscar',
    disagreeText: 'Diver',
    agreeResultText: 'This kitty is no grouch, but that\'s certainly a tale worth telling.',
    disagreeResultText: 'Diver goes on to have a fulfilling career in coral reef conservation.',
    agreeEffect: [0, 4, 0, 1],
    disagreeEffect: [0, 4, 0, 4],
  ),
  Encounter(text: 'You see an alum on the street. Do you say hello?',
    agreeText: 'Howdy paw-rdner!',
    disagreeText: 'Maybe just a nod in passing.',
    agreeResultText: 'You are mistaken, and the owner is a real jerk about it! They seem to think it\'s insulting that their "purebred" looks anything like a shelter dog.',
    disagreeResultText: 'You make eye-contact, and Sbarky remembers you! She pulls at the leash to get some pets. You learn that her new name is Elephant, or Ellie for short.',
    agreeEffect: [0, 0, -3, -3],
    disagreeEffect: [0, 0, 3, 1],
  ),
  Encounter(text: 'Someone wants to buy a puppy as a Christmas present for their kid.',
    agreeText: 'Srsly... no.',
    disagreeText: 'Ok, but you know you\'ll be doing all the work, right?',
    agreeResultText: 'You wisely decline to adopt to someone with unrealistic expectations.',
    disagreeResultText: 'They bring the puppy back in February when it starts teething. Jerk.',
    agreeEffect: [0, 4, 0, 3],
    disagreeEffect: [0, -3, 0, 0],
  ),
  Encounter(text: 'After a few weeks, it seems that one of the puppies is actually a dire wolf.',
    agreeText: 'Try to adopt it out real quick',
    disagreeText: 'Undertake an arduous trek to the frozen north and return it to its natural habitat',
    agreeResultText: 'Watching the channel 6 news a few months later, you are not proud of the mayhem you caused.',
    disagreeResultText: 'You find your old snow shoes and head out. Several weeks later, you return (buffer than ever) and hope little Thor-Garden is hunting well on the ice shelf.',
    agreeEffect: [5, 3, -4, -9],
    disagreeEffect: [-7, 0, 4, 1],
  ),
  Encounter(text: 'A former felon wants to adopt',
    agreeText: 'Yes... and?',
    disagreeText: 'Maybe take a closer look at the application',
    agreeResultText: 'A fluffy kitty finds a forever home, and the adopter starts to come by the shelter regularly to volunteer.',
    disagreeResultText: 'Everything is in order, but you know that they know that you took a closer look. Awkward!',
    agreeEffect: [1, 4, 0, 0],
    disagreeEffect: [0, 0, -1, -4],
  ),
  Encounter(text: 'An adopter wants to haggle over price.',
    agreeText: 'Explain what the costs are',
    disagreeText: 'Deny their adoption entirely!',
    agreeResultText: 'You tabulate the prices for spaying, vaccines, microchipping... but don\'t realize you have been suckered in by a master haggler! Somehow you end up OWNING \$27 for the adoption.',
    disagreeResultText: 'A clever tactic. You are truly the haggliest of hagglers.',
    agreeEffect: [-16, 1, 4, 1],
    disagreeEffect: [5, 4, 0, 0],
  ),
  Encounter(text: 'A dog brings in a “stray” cat, but you suspect that the dog is just getting rid of its household competition.',
    agreeText: 'Send Rover a-roving',
    disagreeText: 'Accept that cat',
    agreeResultText: 'The dog vows to avenge this insult to honor, no mater how many dog years it might take. Ominous!',
    disagreeResultText: 'The cat is quite relieved to get out from under the thumb of its former housemate, and thrives in the company of other kitties.',
    agreeEffect: [1, 0, -9, 0],
    disagreeEffect: [0, 7, 0, 0],
  ),
  Encounter(text: 'Several people claim to have lost their wallet in the shelter recently. You check the cattery, and sure enough, one of the cats has been pilfering purses and waylaying wallets. This also explains the mysterious pallet of catnip that "no one" ordered.',
    agreeText: 'Return the property',
    disagreeText: 'Dispose of the property',
    agreeResultText: 'The victims are grateful, but find your explanation very suspicious.',
    disagreeResultText: 'You try to forget all about it, as you lock the felonious feline\'s cat condo.',
    agreeEffect: [8, 0, -13, 0],
    disagreeEffect: [8, 0, -2, -3],
  ),
  Encounter(text: 'Can you take in a “stray” mountain lion?',
    agreeText: 'Heck no!',
    disagreeText: 'I\'ll try anything once!',
    agreeResultText: 'Seems reasonable, but where\'s the adventure?',
    disagreeResultText: 'You\'re a bit flummoxed when you realize you need to find a way to adopt out your new charge. But no matter! You get the Matterhorn on the horn, and find that it is a mountain in want of a lion. Rock on!',
    agreeEffect: [0, 0, 0, 0],
    disagreeEffect: [0, 4, 0, 4],
  ),
  Encounter(text: 'A newly arrived cat needs dental work.',
    agreeText: 'Fundraise via social media',
    disagreeText: 'Fundraise via snail mail',
    agreeResultText: 'The purpose of the internet? Pictures of cats. Your success is swift and the dentistry deft.',
    disagreeResultText: 'You attract enough attention after a few weeks, and pay for the operation. Meanwhile quite a few more retired folks come in to start volunteering.',
    agreeEffect: [0, 15, 0, 0],
    disagreeEffect: [1, 3, 3, 0],
  ),
  Encounter(text: 'You get a haircut, and the barber won’t stop talking the whole time. But then also starts to follow you around town, showing up day after day.',
    agreeText: 'Tell that barber to cut loose!',
    disagreeText: 'Wear a wig',
    agreeResultText: 'Your not-so-subtle point is finally accepted, but not before you are the recipient of a surprise buzz cut!',
    disagreeResultText: 'The barber eventually loses interest in looking for you, but laying low that long has taken its toll on your day-to-day.',
    agreeEffect: [0, 0, 3, -15],
    disagreeEffect: [-12, 0, 0, 1],
  ),
  Encounter(text: 'A geyser forms in the dog run.',
    agreeText: 'Charge admission',
    disagreeText: 'Harness its thermal energy',
    agreeResultText: '"Old Faithful" is taken, but would be apropos for a geyser in a dog run. You settle on the name "Up Dog" and make a mint as the cash starts to splash.',
    disagreeResultText: '"It\'s a different kind of harness than you are used to, but you now make so much electricity, the power company pays YOU!" --Yakov Smirnoff',
    agreeEffect: [13, -1, 4, 0],
    disagreeEffect: [19, -3, 0, 3],
  ),
  Encounter(text: 'The local college lists a snake charming class in their catalog. Are you the professor or a student?',
    agreeText: 'Professor',
    disagreeText: 'Student',
    agreeResultText: 'It\'s great to stand up straight and get a second job. It generates extra cash for the shelter! but working two jobs leaves you limp.',
    disagreeResultText: 'It\'s quite an enriching experience, and you find that the shelter cats\' tails are equally affected by your new skill!',
    agreeEffect: [8, 0, 0, -14],
    disagreeEffect: [0, 3, 4, 1],
  ),
  Encounter(text: 'One evening, a meteor strikes, making a crater in a clearing near the shelter.',
    agreeText: 'Get over there right away',
    disagreeText: 'Call the fire department',
    agreeResultText: 'You clamber down and see the smoldering, cracked shell of a small space craft. While a examening silver and blue box, something large moves behind you. Creepy! You run for it, and later discover that the box dispenses an edible paste that the animals love to eat!',
    disagreeResultText: 'The clearing is quickly locked down by military vehicles and people in hazmat suits. There are no answers. But soon a large anonymous donation comes to the shelter... and into you personal account too.',
    agreeEffect: [25, 0, 0, 0],
    disagreeEffect: [8, 0, 0, 5],
  ),
  Encounter(text: 'Let\'s try hypnosis!',
    agreeText: 'Yes, on the dogs',
    disagreeText: 'Yes, on the cats',
    agreeResultText: 'They are very well trained at the shelter, but it wears off quickly after adoption.',
    disagreeResultText: 'You find yourself opening yet another can of tuna, and wonder fleetingly where your great-grandfather\'s pocket watch is.',
    agreeEffect: [13, -3, -2, 0],
    disagreeEffect: [0, 19, 0, -5],
  ),
  Encounter(text: 'The governor stops in, looking for a new pet!',
    agreeText: 'Recommend a cat',
    disagreeText: 'Recommend a dog',
    agreeResultText: 'The governor is more of a cat person anyway. Lady Flypaper lives comfortably in the governor\'s luxurious mansion, and a grateful governor gives generously.',
    disagreeResultText: 'The governor\'s high profile brings a lot of attention to Harry Chomper, and the word gets out where to adopt a pet!',
    agreeEffect: [28, 0, 0, 0],
    disagreeEffect: [0, 0, 24, 0],
  ),
  Encounter(text: 'Ants have invaded the food shed!',
    agreeText: 'Do battle with their queen',
    disagreeText: 'Call for parlay and bargain',
    agreeResultText: 'None so brave before! She sounds the call for retreat, and the entire colony marches swiftly to parts unknown. They have left a well-kept warren of temperature controlled tunnels, perfect for storage!',
    disagreeResultText: 'You eventually figure out her accent, and learn she was unaware that anyone owned the kibble. She apologizes and vows to defend you northern border, as long as there is "sugar in her veins" -- whatever that means.',
    agreeEffect: [18, 0, 0, 0],
    disagreeEffect: [0, 0, 14, 0],
  ),
  Encounter(text: 'Inside one of the kennels, you discover a portal to a dimension where the world is a pristine landscape crafted entirely out of kibble, chow, and gravy.',
    agreeText: 'Let the dogs out!',
    disagreeText: 'Hire a warlock to seal that evil portal',
    agreeResultText: 'The puppers gnaw down a tree, like beavers. Others swim and gulp in the chicken broth pond. It\'s actually a little disturbing, but at least they are well fed.',
    disagreeResultText: 'Furious sausage links whip out from the flagging portal, flailing and grasping. They lash at you and hurl rawhide sticks, as the warlock chants solemnly. Finally the hole erupts in light, and disappears, leaving you with a renowned reputation for doing the right thing even when it\'s hard.',
    agreeEffect: [18, 19, 0, -5],
    disagreeEffect: [0, 0, 20, 0],
  ),
  Encounter(text: 'You go on an expedition to find...',
    agreeText: 'the elephant graveyard.',
    disagreeText: 'the eggplant graveyard.',
    agreeResultText: 'Machete. Vine. Sweat. Heat. Hill. Swamp. The trail is arduous, like saying "arduous arugula," but you persevere and press and push and persist, until you find the lost city of gold, El Dorado! Wait, why did you come out here? And what continent is this!?',
    disagreeResultText: 'You\'re pretty sure that\'s not a real thing, but just to be sure you check the garbage behind the grocery store... Purple Gold! You proved it\'s real! It was right here in your city all along. Your newfound fame goes a long way toward helping the shelter.',
    agreeEffect: [-9, 0, 0, 21],
    disagreeEffect: [1, 3, 5, 13],
  ),
  Encounter(text: 'Someone lost a love letter in the front office, only first names. Do you advertise to get it back to them?',
    agreeText: 'Put it on the marquee, baby!',
    disagreeText: 'Put it in the lost and found, quietly',
    agreeResultText: 'A veritable parade of the love-lorn claim ownership. You start to think you\'ll never find the true paramour. But you also solicit quite a few donations from these strange liars.',
    disagreeResultText: 'Someone claims the letter, wearing a ball cap and sunglasses. Checking the security cams later, you are certain it was a famous movie star... and the other first name in the letter was not their spouse!',
    agreeEffect: [5, 1, 0, 0],
    disagreeEffect: [0, 0, 0, 9],
  ),
  Encounter(text: 'You always though that rinsing the kennels was surprisingly difficult. Turns out, the axis of the earth’s gravity is off by 6 degrees inside the shelter.',
    agreeText: 'Start advertising your new Mystery "Spot"',
    disagreeText: 'Harnes the differential between in and out for a perpetual motion generator',
    agreeResultText: 'Folks flock from further and further to find fascination in your flashy physics-flouting phenomenon!',
    disagreeResultText: 'Big Oil offers to buy the technology for enough money to power five shelters for a hundred years. You sell since your little flywheel doesn\'t power much more than a couple light bulbs. But they just sit on the patent and keep selling oil! Who would have guessed?',
    agreeEffect: [2, -2, 9, 0],
    disagreeEffect: [18, 5, -5, 0],
  ),
  Encounter(text: 'You discover that one of the dog bowls turns any dog who drinks from it into a puppy. Do you dare drink from it?',
    agreeText: 'Sluuuurp!',
    disagreeText: 'Throw that acursed thing in the trash!',
    agreeResultText: 'It doesn\'t seem to have any effect on humans. But puppies are much easier to adopt out, so you start puppifying dogs that would otherwise take longer to get adopted.',
    disagreeResultText: 'It\'s much easier to keep track of the animals now that they aren\'t transmogrifying all the time. But you wonder if you should have disposed of it more carefully.',
    agreeEffect: [0, 6, 4, 0],
    disagreeEffect: [16, 0, -5, 0],
  ),
  Encounter(
    text: 'A Rottweiler puppy is up for adoption, and the rules dictate that you must have a yard in order to adopt her. A wealthy client explains that he lives on a yacht, and that any pup of his will live a life of luxury. He also offers to make a \'donation\' to your personal bank account for any inconvenience the unusual circumstances have caused. ',
    agreeText: 'Rules? Those are more like guidelines',
    disagreeText: 'Rules are rules, and yachts are not suitable environments to raise a rottweiler',
    agreeResultText: 'Your bank account swells, like the seas under First Mate Rottie\'s legs',
    disagreeResultText: 'The Rottweiler is adopted by a friendly farmer',
    agreeEffect: [-2, -2, -2, 18],
    disagreeEffect: [2, 8, 2, 4],
  ),
  Encounter(
    text: 'You get a coupon for a gym membership',
    agreeText: 'Go to the gym',
    disagreeText: 'Yuck',
    agreeResultText: 'You get in the habit of waking up early and feel better on days you get some exercise',
    disagreeResultText: 'Who has time to exercise?',
    agreeEffect: [-2, 0, 0, 12],
    disagreeEffect: [4, 2, 0, -2],
  ),
  Encounter(
    text: 'A new season of your favorite show was just released! And for some reason it was all released at once ...',
    agreeText: 'Watch it all tonight!',
    disagreeText: 'Better to just watch one episode at a time and savor the experience',
    agreeResultText: 'You don\'t get much sleep and are rather tired the next day',
    disagreeResultText: 'The suspense is agonizingly delightful, and you chat with your coworkers about it for weeks',
    agreeEffect: [-3, -4, 2, 6],
    disagreeEffect: [0, 0, 4, 11],
  ),
  Encounter(
    text: 'Your sister asks if you want to come on vacation to Peru?',
    agreeText: 'A vacation sounds wonderful',
    disagreeText: 'The shelter needs you!',
    agreeResultText: 'You hike to the top of Machu-Pichu. You are licked by a llama.',
    disagreeResultText: 'Your sister becomes a shaman and does not return for several years',
    agreeEffect: [-4, 0, 0, 10],
    disagreeEffect: [4, 0, 3, -3],
  ),



];
  /*

volunteer orientation
need landscaping
need a new roof - money is tight
New dogs are so tiny, the slip out of kennels. buy aquariums?
The AI in your phone would like to adopt a cat
You go to buy kitty litter, but get lost in the back country for days. go north, go south, go bcak
Driving to the vet’s office, you are lost. Stop to check map, or just try the next exit.
This is actually a tiger cub / lion / wolf
You find a cache of diamonds. One of the cats is a burglar!
The security cameras have been failing at night 3:33am. Do you sleep over? It’s a ghost!!!!
Do you want enter a dog-o-thon race for charity?
A ghostly flying pirate ship descends onto the parking lot, and the captain demands cats. Call the cops, or buckle his swash?
Geologists have discovered a tiny active volcano next door. Move the shelter?
The rats in the attic wear tiny robes and worship the statue of a cat god
You find a cell phone in a kennel. One of the dogs runs a side business as a bookie.
While petting a cat, a genie pours forth! Do you dare make some wishes?
Do you allow a field trip from the elementary school? (kid tries to steal a puppy)
A witch is looking for a new familiar. Tell her to leave (face discrimination laws). Help (the whole coven ends up adopting here!)
The annual gala fundraiser. How much effort to put in? balance personal life and shelter profit
Busy day 4:55pm. Time for one more adoption? balance personal life and animal wellbeing
Animals are goin buggy. Spend time calming them, or an earthquake hits?
A musketeer cat demands to know why you run a prison
An old tome with a dog obedience spell
Best trainer in the world retires, donate (magical?) clicker. Sell, use at shelter, get famous?
One of the cats claims to actually be a raccoon. Let them go?
Spay appointment. Wait for cheaper vet. Book expensive vet now.
after a walk in the rain, a dog is bone dry (pardon the pun), ask the volunteer or ask the dog
you have amnesia! Ask what this place is, or keep your cool and play along
A merchant from a distant land appears. Do you buy rune-encrusted buzz clippers, or a red silken collar
A rep from a veterinary medicine company offers lower prices with a year contract
Pet makeup? Yes, for the dogs. Yes, for the cats.
The local zoo needs help. Which can you look after for a cpu[le weeks: A family of golden eagles, or a waddle of penguins?
as you leave the shelter one evening, you heard faint music from the wooded area. Go now, or check it out in the morning.
You notice a series of chips and dents in the shelter's brick wall. Decipher the pattern, or fill in the gaps with mortar.


  */

