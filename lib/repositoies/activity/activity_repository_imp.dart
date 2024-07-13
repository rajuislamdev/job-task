import 'package:get/get.dart';
import 'package:job_task/models/activity_model.dart';
import 'package:job_task/repositoies/activity/activity_repository.dart';
import 'package:job_task/services/activity_service.dart';

class ActivityRepositoryImp implements ActivityRepository {
  final ActivityService _activityService = Get.find<ActivityService>();

  ActivityRepositoryImp();
  @override
  Future<List<ActivityModel>> fetchActivities() async {
    try {
      return await _activityService.fetchActivities();
    } catch (e) {
      rethrow;
    }
  }
}
