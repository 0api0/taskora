class UserFullDataEntity {
  const UserFullDataEntity({
    required this.userName,
    required this.totalProfit,
    required this.totalHoursDone,
    required this.projectCount,
    required this.defaultWatchCost,
    required this.createdAt,
  });

  final String userName;
  final num totalProfit;
  final num totalHoursDone;
  final int projectCount;
  final num defaultWatchCost;
  final DateTime createdAt;
}
