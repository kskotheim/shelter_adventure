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
  ];