import 'package:get/get.dart';
import 'package:job_task/core/utils/constants.dart';
import 'package:job_task/models/activity_model.dart';
import 'package:job_task/services/api_client.dart';

class ActivityService {
  final ApiClient _apiClient = Get.find<ApiClient>();

  Future<List<ActivityModel>> fetchActivities() async {
    try {
      final response = await _apiClient.get(AppConstants.activity);
      return (response.data['data'] as List)
          .map((e) => ActivityModel.fromMap(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
