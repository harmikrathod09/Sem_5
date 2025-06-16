import 'package:lecture_adv_flutter/utils/import_file.dart';

class GetxDemoView extends StatelessWidget {
  GetxDemoView({super.key});

  final GetxDemoController _getxDemoController = Get.put(GetxDemoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_GETX_VIEW, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Obx(
          () => Text(
            _getxDemoController.a.value.toString(),
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.defaultDialog(
            title: DIALOGE_TITLE_TXT,
            textConfirm: DIALOGE_YES_BTN,
            textCancel: DIALOGE_NO_BTN,

            onConfirm: () {
              _getxDemoController.incrementCounter();
              // Get.to(GetxDemoView());
              print(':::BACK NOT DONE:::');
              Get.back(closeOverlays: true);
              Get.snackbar(
                SNAKEBAR_TITLE,
                SNAKEBAR_SUBTITLE,
                backgroundColor: Colors.white,
                colorText: Colors.black,
              );

              // Close the dialog after a short delay
            },

            onCancel: () {
              print("No");
              Get.back;
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
