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
    text: 'You have a grant application to finish, by tomorrow, but you have tickets to go see a big rock band. The concert starts in an hour.',
    agreeText: 'Leave the paperwork for tomorrow',
    disagreeText: 'Stay and finish the paperwork',
    agreeResultText: 'Tomorrow is really busy and it doesn\'t get done',
    disagreeResultText: 'Your friends have a great time at the concert',
    agreeEffect: [-13, 0, 0, 20],
    disagreeEffect: [12, 12, 0, -16]
  ),
  Encounter(
    text:
        'Your phone rings. It is the mayor. He wants you to adopt a crocodile he says was found in a pool.',
        agreeText: 'Get the bathtub ready',
        disagreeText: 'Tell the mayor politely that is ridiculous and that he\'ll have to come up with a better plan',
        agreeResultText: 'The food bill goes up significantly, and the mayor boasts of brokering the deal at a campaign speech.',
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
    disagreeEffect: [7, -1, -12, 10]
  ),
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
];
