import 'package:get/get.dart';
import 'package:adv_flutter/utils/import_export.dart';

class TextBindingPage extends GetView<TextController> {
  const TextBindingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          RX_STRING_APPBAR,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (val) => controller.inputText.value = val,
              decoration: const InputDecoration(
                labelText: TYPE_HERE,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Text(YOU_TYPED),
            const SizedBox(height: 20),
            Obx(
              () => Text(
                controller.inputText.value,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
