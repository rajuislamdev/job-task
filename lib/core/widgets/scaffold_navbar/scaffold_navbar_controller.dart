import 'package:get/state_manager.dart';

class ScaffoldNavbarController extends GetxController {
  var currentIndex = 0.obs;

  void goOtherTab(int index, void Function(int) onTabChanged) {
    if (index == currentIndex.value) return;
    currentIndex.value = index;
    onTabChanged(index);
  }
}
