import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class infrastructurePage extends StatefulWidget {
  const infrastructurePage({Key? key}) : super(key: key);

  @override
  State<infrastructurePage> createState() => _infrastructurePageState();
}

class _infrastructurePageState extends State<infrastructurePage> {
  final infrastructureTotalCostFirstYear = TextEditingController();
  final infrastructureTotalCostSecondYear = TextEditingController();
  final infrastructureTotalCostThirdYear = TextEditingController();
  final infrastructureTotalCostFourthYear = TextEditingController();
  final infrastructureTotalCostFifthYear = TextEditingController();
  final maintenanceTotalCostFirstYear = TextEditingController();
  final maintenanceTotalCostSecondYear = TextEditingController();
  final maintenanceTotalCostThirdYear = TextEditingController();
  final maintenanceTotalCostFourthYear = TextEditingController();
  final maintenanceTotalCostFifthYear = TextEditingController();
  final usingTotalCostFirstYear = TextEditingController();
  final usingTotalCostSecondYear = TextEditingController();
  final usingTotalCostThirdYear = TextEditingController();
  final usingTotalCostFourthYear = TextEditingController();
  final usingTotalCostFifthYear = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isWeb = kIsWeb;
  bool tmp = false;
  final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color(0xFF52647E),
    side: BorderSide(
      color: Color(0xFF52647E),
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    infrastructureTotalCostFirstYear.dispose();
    infrastructureTotalCostSecondYear.dispose();
    infrastructureTotalCostThirdYear.dispose();
    infrastructureTotalCostFourthYear.dispose();
    infrastructureTotalCostFifthYear.dispose();
    maintenanceTotalCostFirstYear.dispose();
    maintenanceTotalCostSecondYear.dispose();
    maintenanceTotalCostThirdYear.dispose();
    maintenanceTotalCostFourthYear.dispose();
    maintenanceTotalCostFifthYear.dispose();
    usingTotalCostFirstYear.dispose();
    usingTotalCostSecondYear.dispose();
    usingTotalCostThirdYear.dispose();
    usingTotalCostFourthYear.dispose();
    usingTotalCostFifthYear.dispose();
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
                            "Инфраструктура",
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
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(),
                                        IconButton(
                                          iconSize: 20,
                                          alignment: Alignment.topRight,
                                          splashRadius: 2,
                                          onPressed: () {
                                            setState(() => tmp = !tmp);
                                          },
                                          icon: Icon(
                                            tmp
                                                ? Icons.cloud_done
                                                : Icons.cloud_outlined,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: tmp
                                              ? Text(
                                                  textAlign: TextAlign.center,
                                                  "Стоимость инфраструктуры (облачная)",
                                                )
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  "Стоимость инфраструктуры",
                                                ),
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: 30,),
                                  ],
                                ),
                                Expanded(
                                  child: tmp
                                      ? Text(
                                          textAlign: TextAlign.center,
                                          "OPEX",
                                        )
                                      : Text(
                                          textAlign: TextAlign.center,
                                          "CAPEX",
                                        ),
                                ),
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Укажите общую стоимость инфраструктуры",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller:
                                        infrastructureTotalCostFirstYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller:
                                        infrastructureTotalCostSecondYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller:
                                        infrastructureTotalCostThirdYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller:
                                        infrastructureTotalCostFourthYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller:
                                        infrastructureTotalCostFifthYear,
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
                                      "Сопровождение инфраструктуры",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "CAPEX",
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
                                      "Укажите общую стоимость сопровождения инфраструктуры ( техническая поддержка инфраструктурного ПО и ФОТ обслуживающего персонала )",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: maintenanceTotalCostFirstYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: maintenanceTotalCostSecondYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: maintenanceTotalCostThirdYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: maintenanceTotalCostFourthYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: maintenanceTotalCostFifthYear,
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
                                    "Переферийное оборудование",
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
                                      "Укажите общую стоимость используемого переферийного оборудования в ИС.",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: usingTotalCostFirstYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: usingTotalCostSecondYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: usingTotalCostThirdYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: usingTotalCostFourthYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: usingTotalCostFifthYear,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                          border: TableBorder.all(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                            width: 2,
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
                                  Navigator.of(context).pushNamed('/licNsoft',);
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
    infrastructureTotalCostFirstYear.clear();
    infrastructureTotalCostSecondYear.clear();
    infrastructureTotalCostThirdYear.clear();
    infrastructureTotalCostFourthYear.clear();
    infrastructureTotalCostFifthYear.clear();
    maintenanceTotalCostFirstYear.clear();
    maintenanceTotalCostSecondYear.clear();
    maintenanceTotalCostThirdYear.clear();
    maintenanceTotalCostFourthYear.clear();
    maintenanceTotalCostFifthYear.clear();
    usingTotalCostFirstYear.clear();
    usingTotalCostSecondYear.clear();
    usingTotalCostThirdYear.clear();
    usingTotalCostFourthYear.clear();
    usingTotalCostFifthYear.clear();
  }
}
