import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class NevigationDataTranferSecondPage extends StatelessWidget {
  final _controller = Get.find<NevigationDataTransferController>();

  NevigationDataTranferSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(NEVIGATION_DATA_TRANSFER_SECOND_GETX_APPBAR, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Obx(() => Column(
        children: [
          ListTile(
            title: Text('Name'),
            subtitle: Text(_controller.user['name'] ?? ''),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text(_controller.user['email'] ?? ''),
          ),
          ElevatedButton(
            onPressed: () => Get.back(),
            child: Text(BTN_BACK),
          ),
        ],
      )),
    );
  }
}
