import "package:adv_flutter/utils/import_export.dart";
import 'package:get/get.dart';

class RxStringView extends StatelessWidget {
  RxStringController controller = Get.put(RxStringController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RX_STRING_APPBAR, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: controller.updateText,
              decoration: InputDecoration(labelText: TYPE_HERE),
            ),
            SizedBox(height: 20),
            Text(YOU_TYPED),
            SizedBox(height: 20),
            Obx(
              () => Text(controller.text.value, style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
