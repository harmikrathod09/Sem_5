import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class AsyncView extends StatelessWidget {
  AsyncView({super.key});
  AsyncController controller = Get.put(AsyncController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_ASYNC_VIEW, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(controller.result.value, textAlign: TextAlign.center)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => controller.fetchData(false),
                child: Text(FETCHING_SUCCESS),
              ),
              SizedBox(width: 10,),
              ElevatedButton(
                onPressed: () => controller.fetchData(true),
                child: Text(FETCHING_ERR),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
