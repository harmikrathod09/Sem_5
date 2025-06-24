import 'package:get/get.dart';
import 'package:adv_flutter/utils/import_export.dart';

class SecondMiddlewareView extends StatelessWidget {
  const SecondMiddlewareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          SECOND_MIDDLEWARE_PAGE_VIEW_APPBAR,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text(BTN_BACK),
        ),
      ),
    );
  }
}
