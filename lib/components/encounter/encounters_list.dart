import 'package:shelter_adventure/components/encounter/encounter.dart';

final List<Encounter> encounters = [
    Encounter(
      text:
          'You meet a portly gopher who offers his services in exchange for a steady supply of grass roots',
      agreeText: 'accept the gophers services',
      agreeResultText: 'you agreed',
      disagreeResultText: 'you disagreed',
      agreeEffect: [10, 10, -5, -5],
      disagreeEffect: [0, 0, 10, 0],
    ),
    Encounter(
      text:
          'Two neighborhood cats ambush you in the alley and demand pets, or else',
      agreeResultText: 'you agreed',
      disagreeResultText: 'you disagreed',
      agreeEffect: [0, 0, 5, 5],
      disagreeEffect: [20, 0, -10, 0],
    ),
    Encounter(
      text:
          'You are overcome with a sudden compulsion to dig a big hole in the back yard',
      agreeResultText: 'you agreed',
      disagreeResultText: 'you disagreed',
      agreeEffect: [10, 0, -5, 5],
      disagreeEffect: [20, -20, -10, 20],
    ),
    Encounter(text: 'Your cat reminds you that it is time for breakfast'),
    Encounter(
        text:
            'Four friends approach you and gently remind you about that time you promised to throw a party for all of the neighborhood dogs'),
    Encounter(text: 'It is late. You should be getting home.'),
    Encounter(
        text:
            'Your phone rings. It is your boss. He wants you to work this weekend.'),
    Encounter(text: 'The neighbors ask if you can look after their rabbits'),
    Encounter(text: 'A dirty, disoriented person walks into the shelter, and asks for help finding their way home.',
          agreeText: 'Try to figure out where they live',
          disagreeText: 'Give them bus fare',
          agreeResultText: 'You spend several minutes teasing apart what they actually know about their life, until they finally explain they are a millionaire testing your compassion. Big donation incoming!',
          disagreeResultText: 'They mumble their thanks and wander out the door.',
          agreeEffect: [29, -3, -1, -5],
          disagreeEffect: [3, 2, -5, 1],
        ),
    Encounter(text: 'A dog was stolen!',
          agreeText: 'Check the security cameras and call the cops!',
          disagreeText: 'That\'s as good as adopting, right?',
          agreeResultText: 'You recognize a former employee and quickly recover rover.',
          disagreeResultText: 'The kennels are a little bit quieter.',
          agreeEffect: [16, 0, -2, 0],
          disagreeEffect: [-4, 0, 4, 5],
        ),
  ];