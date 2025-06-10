import 'package:lecture_adv_flutter/utils/import_file.dart';

class GetxDemoController extends GetxController {
  RxInt a=0.obs;

  void incrementCounter(){
    ++a.value;
  }
}
