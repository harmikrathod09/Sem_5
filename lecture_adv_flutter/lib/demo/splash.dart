import 'package:flutter/material.dart';
import 'package:aswdc_flutter_pub/aswdc_flutter_pub.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Utils().getMaterialColor(
          Color(0xFFAB8408),
        ),
      ),
      home: SplashScreen(
        appLogo: "APP_LOGO",
        appName: 'darashan',
        appVersion: '2.5',
        
      ),
    );
  }
}