import 'package:flutter/material.dart';

class DevInfoPage extends StatelessWidget {
  final Colors? appbarBackgroundColor;
  final Colors? appBarTextColor;

  DevInfoPage({super.key, this.appbarBackgroundColor, this.appBarTextColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Devloper Information Page",
          style: TextStyle(
              color: appBarTextColor ?? Colors.white
          ),
    )
    ,

  }
}
