import 'package:get/get.dart';
import 'package:adv_flutter/utils/import_export.dart';

class TextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextController>(() => TextController());
  }
}
