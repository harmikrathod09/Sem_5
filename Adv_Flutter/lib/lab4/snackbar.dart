import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class SnackbarDemo extends StatelessWidget {
  const SnackbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          GET_SNACKBAR_DEMO_APPBAR,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  SNACKBAR_TITLE,
                  SNACKBAR_MSG,
                  backgroundColor: Colors.white,
                );
              },
              child: Text(OPEN_SNACKBAR_BUTTON),
            ),
          ],
        ),
      ),
    );
  }
}
