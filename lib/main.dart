import 'package:flutter/material.dart';
import 'package:tco_calculator/authorization.dart';
import 'package:tco_calculator/datainput.dart';

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
      ),
      home: AuthorizationPage(),
    );
  }
}

