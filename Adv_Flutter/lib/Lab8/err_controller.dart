import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class ErrController extends GetxController {
  RxDouble division = 0.0.obs;

  void calculate(String no1, String no2) {
    try {
      final intNum1 = int.parse(no1);
      final intNum2 = int.parse(no2);

      if (intNum2 == 0) {
        // divisor zero - throw exception or show snackbar
        throw IntegerDivisionByZeroException();
      }

      division.value = intNum1 / intNum2;
    } on IntegerDivisionByZeroException {
      Get.snackbar(
        ERR_TITLE,
        ERR_CAN_NOT_DIVIDE_ZERO,
      
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    } on FormatException {
      Get.snackbar(
        ERR_TITLE,
        ERR_ENTER_INTEGER_VALUE,
      
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    } catch (e) {
      Get.snackbar(
        ERR_TITLE,
        e.toString(),
      
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    }
  }
}
