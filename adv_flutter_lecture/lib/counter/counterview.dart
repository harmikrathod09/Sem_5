import 'package:adv_flutter_lecture/utils/import_file.dart';

class Counterview extends StatefulWidget {
  @override
  State<Counterview> createState() => _CounterviewState();
}

class _CounterviewState extends State<Counterview> {
  CounterController _counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_CONTROLLER_VIEW)),
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Text(
              _counterController.counterValue.toString(),
              style: TextStyle(fontSize: 100),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _counterController.incrementCounter();
                    setState(() {});
                  },
                  child: Text(INCREMENT),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    _counterController.decrementCounter();
                    setState(() {});
                  },
                  child: Text(DECREMENT),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
