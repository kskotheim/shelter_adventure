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
    name: 'First Challenge',
    description: 'Finish with 100 Operations',
    minScores: [100, 0, 0, 0],
    reward: 5,
  ),
  Challenge(
    id: '2',
    name: 'Second Challenge',
    description: 'Finish with 100 Animals',
    minScores: [0, 100, 0, 0],
    reward: 5,
  ),
  Challenge(
    id: '3',
    name: 'Third Challenge',
    description: 'Finish with 100 Community',
    minScores: [0, 0, 100, 0],
    reward: 5,
  ),
  Challenge(
    id: '4',
    name: 'Fourth Challenge',
    description: 'Finish with 100 Personal',
    minScores: [0, 0, 0, 100],
    reward: 5,
  ),
  Challenge(
    id: '5',
    name: 'Fifth Challenge',
    description: 'Finish with 100 in all categories',
    minScores: [100, 100, 100, 100],
    reward: 15,
  ),
];
