import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class AgeCheckerView extends StatelessWidget {
  AgeCheckerView({super.key});

  AgeController controller = Get.put(AgeController());
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_ASYNC_VIEW, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Obx(() => Text(controller.result.value, textAlign: TextAlign.center)),
          TextField(
            controller: inputController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: ENTER_AGE),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              controller.checkAge(inputController.text);
            },
            child: Text(CHECK_AGE),
          ),
        ],
      ),
    );
  }
}
