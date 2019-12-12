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
    category: 'All',
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
    description: 'Finish with 80 Animals',
    minScores: [0, 80, 0, 0],
    reward: 5,
    category: 'Animals',
  ),
  Challenge(
    id: '3',
    name: 'A shelter\'s best friend',
    description: 'Finish with 80 Community',
    minScores: [0, 0, 80, 0],
    reward: 5,
    category: 'Community',
  ),
  Challenge(
    id: '4',
    name: 'Treat yourself!',
    description: 'Finish with 80 Personal',
    minScores: [0, 0, 0, 80],
    reward: 5,
    category: 'Personal',
  ),
  Challenge(
    id: '4.1',
    name: 'Healthy Business, Healthy Animals',
    description: 'Finish with 90 Operations and 90 Animals',
    minScores: [90, 90, 0, 0],
    reward: 10,
    category: 'Operations+Animals',
  ),
  Challenge(
    id: '4.2',
    name: 'People Person',
    description: 'Finish with 95 Community and 85 Personal',
    minScores: [0, 0, 95, 85],
    reward: 10,
    category: 'Community+Personal',
  ),
  
  Challenge(
    id: '5',
    name: 'Feeling well rounded?',
    description: 'Finish with 100 in all categories',
    minScores: [100, 100, 100, 100],
    reward: 25,
    category: 'All',
  ),
  Challenge(
    id: '5.1',
    name: 'Applying elbow grease makes it cleaner?',
    description: 'Finish with 120 Operations',
    minScores: [120, 0, 0, 0],
    reward: 15,
    category: 'Operations',
  ),
  Challenge(
    id: '5.2',
    name: 'This is what it\'s all about',
    description: 'Finish with 130 Animals',
    minScores: [0, 130, 0, 0],
    reward: 15,
    category: 'Animals',
  ),
  Challenge(
    id: '5.3',
    name: 'A shelter\'s best friend',
    description: 'Finish with 140 Community',
    minScores: [0, 0, 140, 0],
    reward: 20,
    category: 'Community',
  ),
  Challenge(
    id: '5.4',
    name: 'Treat yourself!',
    description: 'Finish with 150 Personal',
    minScores: [0, 0, 0, 150],
    reward: 20,
    category: 'Personal',
  ),
  Challenge(
    id: '6',
    name: 'Dominate the Industry',
    description: 'Finish with 200 Operations',
    minScores: [200, 0, 0, 0],
    reward: 35,
    category: 'Operations',
  ),
  Challenge(
    id: '7',
    name: 'Doggie Paradise',
    description: 'Finish with 200 Animals',
    minScores: [0, 200, 0, 0],
    reward: 35,
    category: 'Animals',
  ),
  Challenge(
    id: '8',
    name: 'The Friendliest Neighbor',
    description: 'Finish with 200 Community',
    minScores: [0, 0, 200, 0],
    reward: 35,
    category: 'Community',
  ),
  Challenge(
    id: '9',
    description: 'Finish with 200 Personal',
    name: 'Ruler of Your Domain',
    minScores: [0, 0, 0, 200],
    reward: 35,
    category: 'Personal',
  ),
  Challenge(
    id: '9.1',
    name: 'Thriving Business, Thriving Animals',
    description: 'Finish with 220 Operations and 220 Animals',
    minScores: [220, 220, 0, 0],
    reward: 45,
    category: 'Operations+Animals',
  ),
  Challenge(
    id: '9.2',
    name: 'Total People Person',
    description: 'Finish with 230 Community and 210 Personal',
    minScores: [0, 0, 230, 210],
    reward: 45,
    category: 'Community+Personal',
  ),

  Challenge(
    id: '10',
    name: 'Remember the sesquicentennial? I don\'t.',
    description: 'Finish with 150 in all categories',
    minScores: [150, 150, 150, 150],
    reward: 50,
    category: 'All',
  ),
];
