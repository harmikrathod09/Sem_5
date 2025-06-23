import 'package:adv_flutter/utils/import_export.dart';

class NonReactiveVarView extends StatefulWidget {
  NonReactiveVarView({super.key});

  @override
  State<NonReactiveVarView> createState() => _NonReactiveVarViewState();
}

class _NonReactiveVarViewState extends State<NonReactiveVarView> {
  NonReactiveVarController _nonReactiveVarController =
      NonReactiveVarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          NON_REACTIVE_VAR_DEMO_APPBAR,
          style: TextStyle(color: Colors.white),
        ),
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
            Text(_nonReactiveVarController.count.toString(), style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _nonReactiveVarController.increaseVar();
          setState(() {
            
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
