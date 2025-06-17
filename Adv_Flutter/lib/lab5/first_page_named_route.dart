import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class FirstPageNamedRoute extends StatelessWidget {
  const FirstPageNamedRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(NAMED_ROUTE_FIRST_PAGE_APPBAR, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black87,
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              FIRST_PAGE_TITLE,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(FIRST_PAGE_SUBTITLE, style: TextStyle(fontSize: 15,color: Colors.grey)),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(NAV_SECOND_PAGE);
              },
              child: Text(BTN_MOVE),
            ),
          ],
        ),
      ),
    );
  }
}
