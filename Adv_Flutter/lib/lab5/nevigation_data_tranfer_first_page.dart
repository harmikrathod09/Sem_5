import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class NevigationDataTranferFirstPage extends StatelessWidget {
  NevigationDataTranferFirstPage({super.key});

  final _controller = Get.find<NevigationDataTransferController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(NEVIGATION_DATA_TRANSFER_FIRST_GETX_APPBAR, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller.nameController,
              decoration: InputDecoration(
                hintText: ENTER_NAME,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _controller.emailController,
              decoration: InputDecoration(
                hintText: ENTER_EMAIL,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _controller.addValue();
                Get.to(() => NevigationDataTranferSecondPage());
              },
              child: Text(BTN_MOVE),
            ),
          ],
        ),
      ),
    );
  }
}
