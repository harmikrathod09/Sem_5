import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class NevigationSecondGetx extends StatelessWidget {
  const NevigationSecondGetx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          NEVIGATION_SECOND_GETX_APPBAR,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              SECOND_PAGE_TITLE,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              SECOND_PAGE_SUBTITLE,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.back(closeOverlays: true);
              },
              child: Text(BTN_BACK),
            ),
          ],
        ),
      ),
    );
  }
}
