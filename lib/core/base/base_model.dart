import 'package:get/get.dart';

abstract class BaseModel extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void setLoading(bool value) {
    isLoading.value = value;
  }

  void setErrorMessage(String value) {
    errorMessage.value = value;
  }

  void clearErrorMessage() {
    errorMessage('');
  }
}
