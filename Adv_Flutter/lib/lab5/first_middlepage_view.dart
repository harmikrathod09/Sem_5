import 'package:get/get.dart';
import 'package:adv_flutter/utils/import_export.dart';


class FirstMiddlepageView extends StatelessWidget {
  FirstMiddlepageView({super.key});

  final controller = Get.put(CheckboxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          FIRST_MIDDLEWARE_PAGE_VIEW_APPBAR,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: controller.isChecked.value,
              onChanged: (val) {
                controller.isChecked.value = val ?? false;
              },
            ),
            const Text("Check to continue"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(SECOND_MIDDLEWARE_PAGE); // Middleware applied
              },
              child: const Text(BTN_MOVE),
            ),
          ],
        )),
      ),
    );
  }
}
