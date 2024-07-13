import 'package:job_task/models/activity_model.dart';

abstract class ActivityRepository {
  Future<List<ActivityModel>> fetchActivities();
}
