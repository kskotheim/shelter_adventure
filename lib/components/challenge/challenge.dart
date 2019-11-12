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
    id: '1',
    name: '+Operations',
    description: 'Finish with 100 Operations',
    minScores: [100, 0, 0, 0],
    reward: 10,
    category: 'Operations',
  ),
  Challenge(
    id: '2',
    name: '+Animals',
    description: 'Finish with 100 Animals',
    minScores: [0, 100, 0, 0],
    reward: 10,
    category: 'Animals',
  ),
  Challenge(
    id: '3',
    name: '+Community',
    description: 'Finish with 100 Community',
    minScores: [0, 0, 100, 0],
    reward: 10,
    category: 'Community',
  ),
  Challenge(
    id: '4',
    name: '+Personal',
    description: 'Finish with 100 Personal',
    minScores: [0, 0, 0, 100],
    reward: 10,
    category: 'Personal',
  ),
  Challenge(
    id: '5',
    name: '+All',
    description: 'Finish with 100 in all categories',
    minScores: [100, 100, 100, 100],
    reward: 50,
    category: 'All',
  ),
  Challenge(
    id: '6',
    name: '++Ops',
    description: 'Finish with 150 Operations',
    minScores: [150, 0, 0, 0],
    reward: 30,
    category: 'Operations',
  ),
  Challenge(
    id: '7',
    name: '++Animals',
    description: 'Finish with 150 Animals',
    minScores: [0, 150, 0, 0],
    reward: 30,
    category: 'Animals',
  ),
  Challenge(
    id: '8',
    name: '++Community',
    description: 'Finish with 150 Community',
    minScores: [0, 0, 150, 0],
    reward: 20,
    category: 'Community',
  ),
  Challenge(
    id: '9',
    name: '++Personal',
    description: 'Finish with 150 Personal',
    minScores: [0, 0, 0, 150],
    reward: 30,
    category: 'Personal',
  ),
  Challenge(
    id: '10',
    name: '++All',
    description: 'Finish with 150 in all categories',
    minScores: [150, 150, 150, 150],
    reward: 100,
    category: 'All',
  ),
];
