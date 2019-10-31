class Challenge {
  final String id;
  final String name;
  final String description;
  final List<int> minScores;
  final int reward;

  Challenge(
      {this.id, this.name, this.description, this.minScores, this.reward});
}

final List<Challenge> theChallenges = [
  Challenge(
    id: '1',
    name: '+Operations',
    description: 'Finish with 100 Operations',
    minScores: [100, 0, 0, 0],
    reward: 5,
  ),
  Challenge(
    id: '2',
    name: '+Animals',
    description: 'Finish with 100 Animals',
    minScores: [0, 100, 0, 0],
    reward: 5,
  ),
  Challenge(
    id: '3',
    name: '+Community',
    description: 'Finish with 100 Community',
    minScores: [0, 0, 100, 0],
    reward: 5,
  ),
  Challenge(
    id: '4',
    name: '+Personal',
    description: 'Finish with 100 Personal',
    minScores: [0, 0, 0, 100],
    reward: 5,
  ),
  Challenge(
    id: '5',
    name: '+All',
    description: 'Finish with 100 in all categories',
    minScores: [100, 100, 100, 100],
    reward: 15,
  ),
  Challenge(
    id: '6',
    name: '++Ops',
    description: 'Finish with 150 Operations',
    minScores: [150, 0, 0, 0],
    reward: 15,
  ),
  Challenge(
    id: '7',
    name: '++Animals',
    description: 'Finish with 150 Animals',
    minScores: [0, 150, 0, 0],
    reward: 15,
  ),
  Challenge(
    id: '8',
    name: '++Community',
    description: 'Finish with 150 Community',
    minScores: [0, 0, 150, 0],
    reward: 15,
  ),
  Challenge(
    id: '9',
    name: '++Personal',
    description: 'Finish with 150 Personal',
    minScores: [0, 0, 0, 150],
    reward: 15,
  ),
  Challenge(
    id: '10',
    name: '++All',
    description: 'Finish with 150 in all categories',
    minScores: [150, 150, 150, 150],
    reward: 25,
  ),
];
