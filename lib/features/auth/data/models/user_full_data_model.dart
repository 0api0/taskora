import '../../domain/entities/user_full_data_entity.dart';
import '../core/methode_helper/parse_num.dart';

class UserFullDataModel extends UserFullDataEntity {
  const UserFullDataModel({
    required super.userName,
    required super.totalProfit,
    required super.totalHoursDone,
    required super.projectCount,
    required super.defaultWatchCost,
    required super.createdAt,
  });

  factory UserFullDataModel.fromResponse(Map<String, dynamic> json) {
    final Map<String, dynamic> data =
        json['data'] as Map<String, dynamic>? ?? <String, dynamic>{};

    return UserFullDataModel(
      userName: data['userName'] as String? ?? '',
      totalProfit: parseNum(data['totalProfit']),
      totalHoursDone: parseNum(data['totalHoursDone']),
      projectCount: parseNum(data['projectCount']),
      defaultWatchCost: parseNum(data['defaultWatchCost']),
      createdAt:
          DateTime.tryParse(data['createdAt'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userName': userName,
      'totalProfit': totalProfit,
      'totalHoursDone': totalHoursDone,
      'projectCount': projectCount,
      'defaultWatchCost': defaultWatchCost,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
