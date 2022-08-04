import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({Key? key}) : super(key: key);

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {

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
                            "Расчет ТСО - 5 лет",
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
                          columnWidths: {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(0.5),
                            2: FlexColumnWidth(4),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                Center(child: Text("Cтатья затрат", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                                Center(child: Text("Вид затрат", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                                Column(
                                  children: [
                                    Container(child: Text("Затраты", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(child: Container(child: Center(child: Text("1-ый год", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                        Expanded(child: Container(child: Center(child: Text("2-ой год", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                        Expanded(child: Container(child: Center(child: Text("3-ий год", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                        Expanded(child: Container(child: Center(child: Text("4-ый год", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                        Expanded(child: Container(child: Center(child: Text("5-ый год", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                        Expanded(child: Container(child: Center(child: Text("Всего", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Инфраструктура")),
                                Center(child: Text("CAPEX")),
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                      Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                      Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                      Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                      Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                      Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    ],
                            ),
                          ],
                            ),
                            TableRow(
                              children: [
                                Center( child: Text("Инфраструктура (облачная)"),),
                                Center( child: Text("OPEX"),),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: Container(child: Center( child: Text("", style: TextStyle(fontSize: 18),),), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),),),
                                    Expanded(child: Container(child: Center( child: Text("", style: TextStyle(fontSize: 18),),), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),),),
                                    Expanded(child: Container(child: Center( child: Text("", style: TextStyle(fontSize: 18),),), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),),),
                                    Expanded(child: Container(child: Center( child: Text("", style: TextStyle(fontSize: 18),),), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),),),
                                    Expanded(child: Container(child: Center( child: Text("", style: TextStyle(fontSize: 18),),), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),),),
                                    Expanded(child: Container(child: Center( child: Text("", style: TextStyle(fontSize: 18),),), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),),),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Сопровождение инфраструктуры")),
                                Center(child: Text("CAPEX")),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Переферийное оборудование")),
                                Center(child: Text("CAPEX")),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Лицензии и программное обеспечение ИС")),
                                Center(child: Text("CAPEX")),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Стоимость технической поддержки информационной системы")),
                                Center(child: Text("OPEX")),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Аутсорс информационной системы")),
                                Center(child: Text("OPEX")),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Персонал")),
                                Center(child: Text("")),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Команда развития")),
                                Center(child: Text("")),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Команда сопровождения")),
                                Center(child: Text("")),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("ТСО / В год - CAPEX")),
                                Center(child: Text("")),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("ТСО / В год - OPEX")),
                                Center(child: Text("")),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                    Expanded(child: Container(child: Center(child: Text("", style: TextStyle(fontSize: 18))), decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey),),)),
                                  ],
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
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.download,size:15),
                                label: Text(
                                  "Скачать файл",
                                  style: TextStyle(fontSize: 15),
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
}
