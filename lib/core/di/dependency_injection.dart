// lib/core/di/dependency_injection.dart

import 'package:get/get.dart';
import 'package:job_task/repositoies/activity/activity_repository.dart';
import 'package:job_task/repositoies/activity/activity_repository_imp.dart';
import 'package:job_task/services/activity_service.dart';
import 'package:job_task/services/api_client.dart';
import 'package:job_task/ui/views/activity/activity_view_model.dart';

Future<void> initDependencies() async {
  Get.lazyPut<ApiClient>(() => ApiClient());
  Get.lazyPut<ActivityRepository>(() => ActivityRepositoryImp());
  Get.lazyPut<ActivityService>(() => ActivityService());
  Get.lazyPut<ActivityViewModel>(() => ActivityViewModel());
}
