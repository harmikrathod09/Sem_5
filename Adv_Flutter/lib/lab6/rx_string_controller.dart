import 'package:get/get.dart';

class RxStringController extends GetxController {
  RxString text = ''.obs;

  void updateText(String newText) {
    text.value = newText;
  }
}
