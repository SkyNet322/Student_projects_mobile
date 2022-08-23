import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tco_calculator/authorization.dart';
import 'package:tco_calculator/datainput.dart';
import 'package:tco_calculator/infrastructure.dart';
import 'package:tco_calculator/licensesNsoftware.dart';
import 'package:tco_calculator/developteam.dart';
import 'package:tco_calculator/supportteam.dart';
import 'package:tco_calculator/calculation.dart';



Future<void> main() async {

  await Hive.initFlutter();
  await Hive.openBox('token_box');
  await Hive.openBox('infra_box');
  await Hive.openBox('temp_box');
  await Hive.openBox('guid_box');
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
        '/develop' : (context) => developPage(),
        '/support' : (context) => supportPage(),
        '/calculation':(context) => CalculationPage(),
      },
    );
  }
}

