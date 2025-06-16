import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';


class DialogeBox extends StatelessWidget {
  const DialogeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          DEFALUT_DIALOGE_BOX_DEMO_APPBAR,
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.defaultDialog(
            title: ALERT_TITLE,
            middleText: ALERT_MIDDLE_TEXT,
            textConfirm: ALERT_YES,
            textCancel: ALERT_NO,
            onConfirm: (){
              Get.back(closeOverlays: true);
            },
            onCancel: (){
              Get.back;
            }
          );
        },
        child: Icon(Icons.add_alert),
      ),
    );
  }
}
