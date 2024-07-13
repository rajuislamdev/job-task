import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:job_task/core/base/base_model.dart';
import 'package:job_task/models/activity_model.dart';
import 'package:job_task/repositoies/activity/activity_repository.dart';
import 'package:job_task/services/api_interceptors.dart';

class ActivityViewModel extends BaseModel {
  // Dependencies
  final ActivityRepository _activityRepository = Get.find<ActivityRepository>();

  // Reactive properties
  final RxList<DateTime> _days = <DateTime>[].obs;
  final RxString _selectedDay =
      DateFormat('MMMM d, yyyy').format(DateTime.now()).obs;
  final RxList<ActivityModel> _activities = <ActivityModel>[].obs;

  // Getters for reactive properties
  List<DateTime> get days => _days;
  String get selectedDay => _selectedDay.value;
  List<ActivityModel> get activities => _activities;

  // Initialization
  @override
  void onInit() {
    super.onInit();
    _initializeData();
  }

  // Methods
  void _initializeData() {
    _generateDays();
    fetchActivities();
  }

  String getCurrentDateMonth() {
    return 'আজ, ${DateFormat('d MMMM', 'bn_BD').format(DateTime.now())}';
  }

  void _generateDays() {
    DateTime now = DateTime.now();
    _days.clear();
    for (int i = -7; i <= 7; i++) {
      DateTime day = now.add(Duration(days: i));
      _days.add(day);
    }
  }

  void setSelectedDay(String day) {
    _selectedDay.value = day;
  }

  Future<void> fetchActivities() async {
    setLoading(true);
    _activities.clear();
    try {
      var result = await _activityRepository.fetchActivities();
      _activities.addAll(result);
    } catch (e) {
      if (e is DioException) {
        setErrorMessage(ApiInterceptors.handleError(e));
      } else {
        setErrorMessage(e.toString());
      }
    } finally {
      setLoading(false);
    }
  }
}
