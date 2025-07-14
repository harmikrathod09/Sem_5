import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adv_flutter/utils/import_export.dart';


class ErrorSnackBar extends StatelessWidget {
  ErrorSnackBar({super.key});

  final ErrController controller = Get.put(ErrController());

  final TextEditingController no1Controller = TextEditingController();
  final TextEditingController no2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          APPBAR_ERROR_CHECKING,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: no1Controller,
              decoration: InputDecoration(
                hintText: ENTER_NO_1,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: no2Controller,
              decoration: InputDecoration(
                hintText: ENTER_NO_2,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controller.calculate(no1Controller.text, no2Controller.text);
              },
              child: Text(BTN_CALCULATE),
            ),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.division.value == 0) {
                return const SizedBox.shrink(); // hide initially or when result is zero
              } else {
                return Text(
                  'Calculation result: ${controller.division.value}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
