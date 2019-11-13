class Challenge {
  final String id;
  final String name;
  final String description;
  final List<int> minScores;
  final int reward;
  final String category;

  Challenge(
    {this.id, this.name, this.description, this.minScores, this.reward, this.category}
  );
}

final List<Challenge> theChallenges = [
  Challenge(
    id: '0',
    name: 'You had one job!',
    description: 'Finish with 50 in all categories',
    minScores: [50, 50, 50, 50],
    reward: 1,
    category: 'none',
  ),
  Challenge(
    id: '1',
    name: 'Applying elbow grease makes it cleaner?',
    description: 'Finish with 80 Operations',
    minScores: [80, 0, 0, 0],
    reward: 5,
    category: 'Operations',
  ),
  Challenge(
    id: '2',
    name: 'This is what it\'s all about',
    description: 'Finish with 110 Animals',
    minScores: [0, 110, 0, 0],
    reward: 10,
    category: 'Animals',
  ),
  Challenge(
    id: '3',
    name: 'A shelter\'s best friend',
    description: 'Finish with 130 Community',
    minScores: [0, 0, 130, 0],
    reward: 10,
    category: 'Community',
  ),
  Challenge(
    id: '4',
    name: 'Treat yourself!',
    description: 'Finish with 150 Personal',
    minScores: [0, 0, 0, 150],
    reward: 15,
    category: 'Personal',
  ),
  Challenge(
    id: '5',
    name: 'Feeling well rounded?',
    description: 'Finish with 100 in all categories',
    minScores: [100, 100, 100, 100],
    reward: 50,
    category: 'All',
  ),
  Challenge(
    id: '6',
    name: '++Ops',
    description: 'Finish with 200 Operations',
    minScores: [200, 0, 0, 0],
    reward: 30,
    category: 'Operations',
  ),
  Challenge(
    id: '7',
    name: '++Animals',
    description: 'Finish with 200 Animals',
    minScores: [0, 200, 0, 0],
    reward: 30,
    category: 'Animals',
  ),
  Challenge(
    id: '8',
    name: '++Community',
    description: 'Finish with 200 Community',
    minScores: [0, 0, 200, 0],
    reward: 20,
    category: 'Community',
  ),
  Challenge(
    id: '9',
    name: '++Personal',
    description: 'Finish with 200 Personal',
    minScores: [0, 0, 0, 200],
    reward: 30,
    category: 'Personal',
  ),
  Challenge(
    id: '10',
    name: 'Remeber the sesquicentennial? I don\'t.',
    description: 'Finish with 150 in all categories',
    minScores: [150, 150, 150, 150],
    reward: 100,
    category: 'All',
  ),
];
