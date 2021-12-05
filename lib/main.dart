import 'package:bytebank2/pages/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.green[900],
          )),
      home: Dashboard(),
    );
  }
}
