import 'package:flutter/material.dart';
import 'package:tco_calculator/authorization.dart';
import 'package:tco_calculator/datainput.dart';
import 'package:tco_calculator/infrastructure.dart';
import 'package:tco_calculator/licensesNsoftware.dart';


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
      initialRoute: '/',
      routes: {
        '/' : (context) => AuthorizationPage(),
        '/datainput': (context) => dataInput(),
        '/infrastructure' : (context) => infrastructurePage(),
        '/licNsoft' : (context) => licensesNsoftwarePage(),
      },
    );
  }
}

