import 'package:adv_flutter/utils/import_export.dart';
import 'package:flutter/material.dart';

class MediaQueryPadding extends StatelessWidget {
  const MediaQueryPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Media Query Padding",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final padding = MediaQuery.of(context).size.width * 0.05;

          return Padding(
            padding: EdgeInsets.all(padding),
            child: Container(
              color: Colors.black,
              alignment: Alignment.center,
              child: Text(
                "Padding : ${padding.toString()}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
