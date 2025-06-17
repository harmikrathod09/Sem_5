import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NevigationDataTransferController extends GetxController {
  RxMap user = {}.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void addValue() {
    user.assignAll({
      'name': nameController.text,
      'email': emailController.text,
    });
  }
}
