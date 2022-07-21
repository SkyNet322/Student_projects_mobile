import 'package:flutter/material.dart';
import 'package:tco_calculator/authorization.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.amber
      ),
      home: AuthorizationPage(),
    );
  }
}

