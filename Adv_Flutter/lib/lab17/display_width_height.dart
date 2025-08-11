import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class DisplayWidthHeight extends StatelessWidget {
  const DisplayWidthHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Display Height and Width using Media Query",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Center(child: Text("${Get.size}")),
    );
  }
}
