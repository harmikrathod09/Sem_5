import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class RxVarDemoView extends StatelessWidget {
  RxVarDemoView({super.key});

  RxVarDemoController _rxVarDemoController = RxVarDemoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RX_VAR_DEMO_APPBAR, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              PRESS_FLOATING_BTN_TO_INCRESE_BY_ONE,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            Obx(()=>Text(_rxVarDemoController.count.toString(), style: TextStyle(fontSize: 25)),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _rxVarDemoController.increseVar();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
