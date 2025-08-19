

import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ColorBaseWebApp extends StatefulWidget {
  const ColorBaseWebApp({super.key});

  @override
  State<ColorBaseWebApp> createState() => _ColorBaseWebAppState();
}

class _ColorBaseWebAppState extends State<ColorBaseWebApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Color Based App/Web",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if(Get.width<700){
            return Container(
              color: Colors.amber,
              child: Center(
                child: Text("App",style: TextStyle(color: Colors.white,fontSize: 50),),

              ),
            );
          }
          else {
            return Container(
              color: Colors.blue,
              child: Center(
                child: Text("Web",style: TextStyle(color: Colors.white,fontSize: 50),),
              ),
            );
          }
        },
      ),
    );
  }
}
