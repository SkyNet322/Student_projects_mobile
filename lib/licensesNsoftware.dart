import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class licensesNsoftwarePage extends StatefulWidget {
  const licensesNsoftwarePage({Key? key}) : super(key: key);

  @override
  State<licensesNsoftwarePage> createState() => _licensesNsoftwarePageState();
}

class _licensesNsoftwarePageState extends State<licensesNsoftwarePage> {
  final licNsoftTotalCostFirstYear = TextEditingController();
  final licNsoftTotalCostSecondYear = TextEditingController();
  final licNsoftTotalCostThirdYear = TextEditingController();
  final licNsoftTotalCostFourthYear = TextEditingController();
  final licNsoftTotalCostFifthYear = TextEditingController();
  final supportTotalCostFirstYear = TextEditingController();
  final supportTotalCostSecondYear = TextEditingController();
  final supportTotalCostThirdYear = TextEditingController();
  final supportTotalCostFourthYear = TextEditingController();
  final supportTotalCostFifthYear = TextEditingController();
  final outsourceTotalCostFirstYear = TextEditingController();
  final outsourceTotalCostSecondYear = TextEditingController();
  final outsourceTotalCostThirdYear = TextEditingController();
  final outsourceTotalCostFourthYear = TextEditingController();
  final outsourceTotalCostFifthYear = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isWeb = kIsWeb;
  final myBox = Hive.box('infra_box');
  bool tmp = false;
  final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color(0xFF52647E),
    side: BorderSide(
      color: Color(0xFF52647E),
    ),
  );

  Future _saveData() async{
    Map<dynamic, dynamic> licen = {
        "object1": {
          "1year": licNsoftTotalCostFirstYear.text,
          "2year": licNsoftTotalCostSecondYear.text,
          "3year": licNsoftTotalCostThirdYear.text,
          "4year": licNsoftTotalCostFourthYear.text,
          "5year": licNsoftTotalCostFifthYear.text
        },
        "object2": {
          "1year": supportTotalCostFirstYear.text,
          "2year": supportTotalCostSecondYear.text,
          "3year": supportTotalCostThirdYear.text,
          "4year": supportTotalCostFourthYear.text,
          "5year": supportTotalCostFifthYear.text
        },
        "object3": {
          "1year": outsourceTotalCostFirstYear.text,
          "2year": outsourceTotalCostSecondYear.text,
          "3year": outsourceTotalCostThirdYear.text,
          "4year": outsourceTotalCostFourthYear.text,
          "5year": outsourceTotalCostFifthYear.text
        }
      };
    await myBox.put('licen_form', licen);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    licNsoftTotalCostFirstYear.dispose();
    licNsoftTotalCostSecondYear.dispose();
    licNsoftTotalCostThirdYear.dispose();
    licNsoftTotalCostFourthYear.dispose();
    licNsoftTotalCostFifthYear.dispose();
    supportTotalCostFirstYear.dispose();
    supportTotalCostSecondYear.dispose();
    supportTotalCostThirdYear.dispose();
    supportTotalCostFourthYear.dispose();
    supportTotalCostFifthYear.dispose();
    outsourceTotalCostFirstYear.dispose();
    outsourceTotalCostSecondYear.dispose();
    outsourceTotalCostThirdYear.dispose();
    outsourceTotalCostFourthYear.dispose();
    outsourceTotalCostFifthYear.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: 1920,
        height: 1080,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF52647E),
            title: Text(
              "Total Cost of Ownership Calculator",
              style: TextStyle(color: Colors.white),
            ),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xFFD7D7D7),
          body: Align(
            alignment: Alignment.center,
            child: isWeb
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            textAlign: TextAlign.center,
                            "Лицензии и программное обеспечение",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF80B3C9),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      "Cтатья"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      "Cтатья"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      "Описание"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      "1 год ( \$ USD )"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      "2 год ( \$ USD )"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      "3 год ( \$ USD )"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      "4 год ( \$ USD )"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      "5 год ( \$ USD )"),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Стоимость лицензий/программного обеспечения",
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "CAPEX",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Укажите общую стоимость лицензий/программного обеспечения самой информационной системы. Затраты берутся из контракта на программное обеспечение.",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: licNsoftTotalCostFirstYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: licNsoftTotalCostSecondYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: licNsoftTotalCostThirdYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: licNsoftTotalCostFourthYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: licNsoftTotalCostFifthYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Стоимость технической поддержки информационной системы",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "OPEX",
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  child: Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Укажите стоимость технической поддержки информационной системы. Затраты берутся из контракта на программное обеспечение",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: supportTotalCostFirstYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: supportTotalCostSecondYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: supportTotalCostThirdYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: supportTotalCostFourthYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: supportTotalCostFifthYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Аутсорс информационной системы",
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "OPEX",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Укажите стоимость аутсорса информационной системы. Затраты берутся из контракта на аутсорс",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: outsourceTotalCostFirstYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: outsourceTotalCostSecondYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: outsourceTotalCostThirdYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: outsourceTotalCostFourthYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: outsourceTotalCostFifthYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                          border: TableBorder.all(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                            width: 1,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: OutlinedButton(
                                onPressed: _textFieldsClear,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Очистить",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                style: buttonStyle,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: OutlinedButton(
                                onPressed: () {
                                  _saveData();
                                  Navigator.of(context).pushReplacementNamed('/develop',);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Далее",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                style: buttonStyle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),
        ),
      ),
    );
  }

  void _textFieldsClear() {
    licNsoftTotalCostFirstYear.clear();
    licNsoftTotalCostSecondYear.clear();
    licNsoftTotalCostThirdYear.clear();
    licNsoftTotalCostFourthYear.clear();
    licNsoftTotalCostFifthYear.clear();
    supportTotalCostFirstYear.clear();
    supportTotalCostSecondYear.clear();
    supportTotalCostThirdYear.clear();
    supportTotalCostFourthYear.clear();
    supportTotalCostFifthYear.clear();
    outsourceTotalCostFirstYear.clear();
    outsourceTotalCostSecondYear.clear();
    outsourceTotalCostThirdYear.clear();
    outsourceTotalCostFourthYear.clear();
    outsourceTotalCostFifthYear.clear();
  }
}
