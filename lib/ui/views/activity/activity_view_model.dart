import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActivityViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getDays();
  }

  final RxList<DateTime> _days = <DateTime>[].obs;
  List<DateTime> get days => _days;

  final RxString _selectedDay =
      DateFormat('MMMM d, yyyy').format(DateTime.now()).obs;
  String get selectedDay => _selectedDay.value;

  String getCurrentDateMonth() {
    return 'আজ, ${DateFormat('d MMMM', 'bn_BD').format(DateTime.now())}';
  }

  void getDays() {
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
}
