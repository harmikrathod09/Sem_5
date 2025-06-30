import 'package:adv_flutter/utils/import_export.dart';

class CustomDialoge extends StatelessWidget {
  const CustomDialoge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          CUSTOM_ALERT_BOX_DEMO_APPBAR,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(OPEN_CUSTOM_ALRET_BOX),
            ),
          ),
        ],
      ),
    );
  }
  //
  // void showCustomDialog(){
  //   Get.defaultDialog(title: ALERT_TITLE,middleText: ALERT_MIDDLE_TEXT,textConfirm: ALERT_YES,textCancel: ALERT_NO,onConfirm: );
  // }
}

