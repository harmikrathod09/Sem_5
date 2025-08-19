import 'package:adv_flutter/utils/import_export.dart';

class DisplayWidthHeight extends StatefulWidget {
  const DisplayWidthHeight({super.key});

  @override
  State<DisplayWidthHeight> createState() => _DisplayWidthHeightState();
}

class _DisplayWidthHeightState extends State<DisplayWidthHeight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Display Height and Width using Media Query",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
            child: Text(
              "Width: ${MediaQuery.of(context).size.width}, Height: ${MediaQuery.of(context).size.height}",
            ),
          ),
      ),
    );
  }
}
