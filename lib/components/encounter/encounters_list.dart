import 'package:shelter_adventure/components/encounter/encounter.dart';

final List<Encounter> encounters = [
  Encounter(
    text:
        'A customer brings in their sick gecko. He hasn\'t eaten a cricket in a week. He looks unhappy.',
    agreeText: 'Accept the gecko as a patient',
    disagreeText: 'Refer the gecko to counseling',
    agreeResultText:
        'you set up a small habitat on your desk and send your assistant to find crickets',
    disagreeResultText:
        'the gecko resumes eating, but does not forgive his parents',
    agreeEffect: [-10, -10, 20, 10],
    disagreeEffect: [10, 10, -10, 0],
  ),
  Encounter(
    text:
        'Two neighborhood cats ambush you in the alley behind the shelter and demand pets, or else',
    agreeText: 'Pet them until they are satisfied',
    disagreeText: 'Catch them and bring them inside to check for microchips',
    agreeResultText: 'They let you leave after a few minutes',
    disagreeResultText: 'You have two more stray cats to feed',
    agreeEffect: [-7, 0, 4, 7],
    disagreeEffect: [-5, 10, -5, 0],
  ),
  Encounter(
    text: 'There are ants in the break room',
    agreeText: 'Get the vacuum',
    disagreeText: 'Let them be - you have work to do',
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
      agreeResultText: 'It goes well.',
      disagreeResultText: 'He sends you a snarky email two weeks later'),
  Encounter(
      text:
          'Four friends approach you and gently remind you about that time you promised to throw a party for all of the neighborhood dogs',
      agreeText: 'Start planning',
      disagreeText: 'Deny that ever happened',
      agreeResultText: 'It takes longer to put together than you anticipated, and one of the dogs throws up on the cake',
      disagreeResultText: 'You feel slightly ashamed but justified in your decision',
      agreeEffect: [-6, 8, 8, -4],
      disagreeEffect: [5, 0, -10, 10]),
  Encounter(
      text:
          'You have a grant application to finish by tomorrow, but you have tickets to go see a big rock band. The concert starts in an hour.',
      agreeText: 'Leave the paperwork for tomorrow',
      disagreeText: 'Stay and finish the paperwork',
      agreeResultText: 'Tomorrow is really busy and it doesn\'t get done',
      disagreeResultText: 'Your friends have a great time at the concert',
      agreeEffect: [-13, 0, 0, 20],
      disagreeEffect: [12, 12, 0, -16]),
  Encounter(
    text:
        'Your phone rings. It is the mayor. He wants you to adopt a crocodile he says was found in a pool.',
    agreeText: 'Get the bathtub ready',
    disagreeText:
        'Tell the mayor politely that is ridiculous and that he\'ll have to come up with a better plan',
    agreeResultText:
        'The food bill goes up significantly, and the mayor boasts of brokering the deal at a campaign speech.',
    disagreeResultText: 'The crocodile is sent to florida at taxpayer expense',
    agreeEffect: [-25, 15, 25, -12],
    disagreeEffect: [6, -5, -10, 12],
  ),
  Encounter(
      text: 'The neighbors ask if you can look after their rabbits',
      agreeText: 'Tell them no problem',
      disagreeText: 'Freeze in place and don\'t respond to their questions',
      agreeResultText: 'The rabbits are irritable',
      disagreeResultText: 'They give you a strange look as they leave',
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
        'The fire chief calls and asks if you might have any Dalmatians they can rent for a fundraiser event. ',
    agreeText:
        'Get the sharpie and all your white short-haired dogs ready for showtime',
    disagreeText: 'Offer him all your mutts for free instead',
    agreeResultText: 'The fundraiser is a big success. Everyone was fooled. ',
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
        'You ask for no pickle, but you get pickle. You suspect it was intentional. ',
    disagreeResultText: 'You are unable to locate the sausage thief.',
    agreeEffect: [3, 5, 0, -2],
    disagreeEffect: [-4, 1, 0, 3],
  ),
  Encounter(
    text:
        'Your biscuit supplier has decided to quit the industry and go to college to pursue a career in international relations.',
    agreeText: 'Wish her luck in all future endevors',
    disagreeText: 'Try to talk her out of it',
    agreeResultText: 'Ten years later she becomes the ambassador to Finland. ',
    disagreeResultText: 'She is not convinced, but seems shaken by your words',
    agreeEffect: [0, -1, 7, 0],
    disagreeEffect: [0, 0, 0, 0],
  ),
  Encounter(
    text:
        'Wiley the weasel, a local radio personality and real-life weasel, is brought in by DJ Mike. In a hushed tone, he explains, well ... Wiley\'s poop has been smelling kind of funny recently',
    agreeText: 'Get Wiley on a diet of carrots and cabbage',
    disagreeText: 'Tell Mike you have real problems to solve',
    agreeResultText:
        'Wiley is back on air the next morning, squeaky as ever and apparently irritated by local drivers',
    disagreeResultText:
        'You work efficiently for the rest of the afternoon. On the radio the next morning, Wiley sounds bloated and un-energetic. ',
    agreeEffect: [-3, 3, 6, 0],
    disagreeEffect: [9, -2, -5, 3],
  ),
  Encounter(text: 'A crotchety dog comes into the shelter with a scrawled note tucked in his collar: "kurst prints - pleez kiss"',
    agreeText: 'Smooch that pooch!',
    disagreeText: 'Maybe just a little hug instead',
    agreeResultText: 'The dog\'s arthritis clears up in the blink of an eye. He thanks you with the keys to his father\'s castle... actually just spits out a milk bone for you.',
    disagreeResultText: 'The dog\'s eyes bulge, and he tries to squirm away.',
    agreeEffect: [0, 1, -4, 0],
    disagreeEffect: [0, -5, 0, 3],
  ),
  Encounter(text: 'STICK \'EM UP!',
    agreeText: 'Empty the register',
    disagreeText: 'Run out the back',
    agreeResultText: 'You dole out the cash and the robber swiftly departs.',
    disagreeResultText: 'The cash is relatively safe, but the steals all the decorations from your front office!',
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
  Encounter(text: 'An employee has been chronically late to work',
    agreeText: 'Ask them to come in much, much later.',
    disagreeText: 'Explain why it\'s important to be on time',
    agreeResultText: 'They are confused by your phrasing, and it takes several minutes of explanation before they understand that you are firing them.',
    disagreeResultText: 'They clean up their act over the next few weeks. ',
    agreeEffect: [1, 4, 0, -8],
    disagreeEffect: [1, 0, 0, 0],
  ),
  Encounter(text: 'Oh no! The computers are down, and you can\'t process adoptions or look up which dogs need medication!',
    agreeText: 'Use paper and copy everything back into the computer later',
    disagreeText: 'Hold off on adoptions for now',
    agreeResultText: 'You get more animals into their forever homes, but it a lot more work too.',
    agreeEffect: [-18, 3, 1, 0],
    disagreeEffect: [4, -3, -4, 1],
  ),
  Encounter(text: 'The power is out!',
    agreeText: 'Buy a generator',
    disagreeText: 'Evacuate',
    agreeResultText: 'That was a shockingly good idea.',
    disagreeResultText: 'You set up shop in an abandoned warehouse across town.',
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
  /*
  enrichment seminar, go or not (bring staff?)
an employee is stealing meds
a donation of 1001 x-large dog beds
running low on kibble, spend money or spend time asking the public
giardia
parvo
kennel cough
few animals, get a new van load or do extra throrough cleaning
it’s kitten season! spend extra on expensive vets or wait to find cheaper spay appointments?
volunteer orientation
need landscaping
need a new roof - money is tight
a member of the public hides in the shleter after hours!
one of the dogs is actually a dire wolf
the shelter cat has been picking people’s pockets
someone lost a love letter, only first names, do you advertise to get it back to them?
can you take in a “stray” mountain lion?
a dog brings in a “stray” cat, but you suspect the dog is just getting rid of the other pets in the house
You see an alum on the street. Say hello?
Animal rescued from dumpster. Do you name it, Oscar or Diver?
A former felon wants to adopt
Adopter wants to haggle over price - don’t get sucked in!
A meteor strikes nearby. investigate (alien tech food dispenser), or call for help (government cordons off area, mystery grant money…)
New dogs are so tiny, the slip out of kennels. buy aquariums?
The AI in your phone would like to adopt a cat
Newly arrived cat needs dental work. Fundraise via social media? Or fundraise via letters?
You get a haircut. Barber won’t stop talking, then follows you around town.
You go to buy kitty litter, but get lost in the back country for days. go north, go south, go bcak
Would you like to take a snake charming class?
Dog hypnosis? They are very well trained, but it wears off quickly after adoption :(
Driving to the vet’s office, you are lost. Stop to check map, or just try the next exit.
This is actually a tiger cub / lion / wolf
Do you go on an expidition to find the elephant graveyard?
The governor is looking for a new dog and stops in!
The axis of the earth’s gravity is off by 14 degrees inside the shelter. Tourism or perpetual motion?
Inside one of the kennels, you discover a portal to a dimension where everything is made of kibble
You find a cache of diamonds. One of the cats is a burglar!
Ants have infested the food. Do battle, or bargain with their queen?
You discover that one of the dog bowls turns dogs into puppies. Do you dare drink from it?
The security cameras have been failing at night 3:33am. Do you sleep over? It’s a ghost!!!!
Someone wants to buy a dog as a christmas present
Do you want enter a dog-o-thon race for charity?
A ghostly flying pirate ship descends onto the parking lot, and the captain demands cats. Call the cops, or buckle his swash?
Geologists have discovered a tiny active volcano next door. Move the shelter?
A geyser forms in the dog run. Tourism or thermal power?
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
  */
];
