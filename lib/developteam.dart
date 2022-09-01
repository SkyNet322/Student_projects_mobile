import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class developPage extends StatefulWidget {
  const developPage({Key? key}) : super(key: key);

  @override
  State<developPage> createState() => _developPageState();
}

class _developPageState extends State<developPage> {
  final TextEditingController _firstLineJob = TextEditingController();
  final TextEditingController _firstLineBidAmount = TextEditingController();
  final TextEditingController _firstLineTax = TextEditingController();
  final TextEditingController _firstLineSalary = TextEditingController();
  final TextEditingController _firstLineMounthAmount = TextEditingController();
  final TextEditingController _secondLineJob = TextEditingController();
  final TextEditingController _secondLineBidAmount = TextEditingController();
  final TextEditingController _secondLineTax = TextEditingController();
  final TextEditingController _secondLineSalary = TextEditingController();
  final TextEditingController _secondLineMounthAmount = TextEditingController();
  final TextEditingController _thirdLineJob = TextEditingController();
  final TextEditingController _thirdLineBidAmount = TextEditingController();
  final TextEditingController _thirdLineTax = TextEditingController();
  final TextEditingController _thirdLineSalary = TextEditingController();
  final TextEditingController _thirdLineMounthAmount = TextEditingController();
  final TextEditingController _fourthLineJob = TextEditingController();
  final TextEditingController _fourthLineBidAmount = TextEditingController();
  final TextEditingController _fourthLineTax = TextEditingController();
  final TextEditingController _fourthLineSalary = TextEditingController();
  final TextEditingController _fourthLineMounthAmount = TextEditingController();
  final TextEditingController _fifthLineJob = TextEditingController();
  final TextEditingController _fifthLineBidAmount = TextEditingController();
  final TextEditingController _fifthLineTax = TextEditingController();
  final TextEditingController _fifthLineSalary = TextEditingController();
  final TextEditingController _fifthLineMounthAmount = TextEditingController();
  final TextEditingController _sixthLineJob = TextEditingController();
  final TextEditingController _sixthLineBidAmount = TextEditingController();
  final TextEditingController _sixthLineTax = TextEditingController();
  final TextEditingController _sixthLineSalary = TextEditingController();
  final TextEditingController _sixthLineMounthAmount = TextEditingController();

  bool visibilityTableRow = false;

  void _add() {
    setState(() => visibilityTableRow = true);
  }

  void _remove() {
    setState(() => visibilityTableRow = false);
  }

  final myBox = Hive.box('infra_box');
  bool allVal = false;
  bool CheckVal1 = false;
  bool CheckVal2 = false;
  bool CheckVal3 = false;
  bool CheckVal4 = false;
  bool CheckVal5 = false;
  bool CheckVal6 = false;

  Future _saveData() async {
    Map<dynamic, dynamic>? dev1;
    Map<dynamic, dynamic>? dev2;
    Map<dynamic, dynamic>? dev3;
    Map<dynamic, dynamic>? dev4;
    Map<dynamic, dynamic>? dev5;
    Map<dynamic, dynamic>? dev6;
    List<Map<dynamic, dynamic>> devlist = [];
    if (CheckVal1 != false) {
      dev1 = {
        "post": _firstLineJob.text,
        "quantity_of_the_rate": _firstLineBidAmount.text,
        "unified_social_tax": _firstLineTax.text,
        "wage": _firstLineSalary.text,
        "number_of_month_of_work": _firstLineMounthAmount.text
      };
      devlist.add(dev1);
    }if (CheckVal2 != false) {
      dev2 = {
        "post": _secondLineJob.text,
        "quantity_of_the_rate": _secondLineBidAmount.text,
        "unified_social_tax": _secondLineTax.text,
        "wage": _secondLineSalary.text,
        "number_of_month_of_work": _secondLineMounthAmount.text
      };
      devlist.add(dev2);
    }  if (CheckVal3 != false) {
      dev3 = {
        "post": _thirdLineJob.text,
        "quantity_of_the_rate": _thirdLineBidAmount.text,
        "unified_social_tax": _thirdLineTax.text,
        "wage": _thirdLineSalary.text,
        "number_of_month_of_work": _thirdLineMounthAmount.text
      };
      devlist.add(dev3);
    }  if (CheckVal4 != false) {
      dev4 = {
        "post": _fourthLineJob.text,
        "quantity_of_the_rate": _fourthLineBidAmount.text,
        "unified_social_tax": _fourthLineTax.text,
        "wage": _fourthLineSalary.text,
        "number_of_month_of_work": _fourthLineMounthAmount.text
      };
      devlist.add(dev4);
    }  if (CheckVal5 != false) {
      dev5 = {
        "post": _fifthLineJob.text,
        "quantity_of_the_rate": _fifthLineBidAmount.text,
        "unified_social_tax": _fifthLineTax.text,
        "wage": _fifthLineSalary.text,
        "number_of_month_of_work": _fifthLineMounthAmount.text
      };
      devlist.add(dev5);
    }  if (CheckVal6 != false) {
      dev6 = {
        "post": _sixthLineJob.text,
        "quantity_of_the_rate": _sixthLineBidAmount.text,
        "unified_social_tax": _sixthLineTax.text,
        "wage": _sixthLineSalary.text,
        "number_of_month_of_work": _sixthLineMounthAmount.text
      };
      devlist.add(dev6);
    }
    await myBox.put('devteam', devlist);
  }

  final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color(0xFF52647E),
    side: BorderSide(
      color: Color(0xFF52647E),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Padding(
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
                  "Команда развития",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF80B3C9),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Table(
                //border: TableBorder.all(width: 0.2),
                columnWidths: {
                  0: FlexColumnWidth(0.5),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(4),
                  3: FlexColumnWidth(4),
                  4: FlexColumnWidth(4),
                  5: FlexColumnWidth(4),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Checkbox(
                          value: allVal,
                          onChanged: (value) {
                            setState(
                              () {
                                allVal = !allVal;
                                if (!allVal) {
                                  CheckVal1 = false;
                                  CheckVal2 = false;
                                  CheckVal3 = false;
                                  CheckVal4 = false;
                                  CheckVal5 = false;
                                  CheckVal6 = false;
                                } else {
                                  CheckVal1 = true;
                                  CheckVal2 = true;
                                  CheckVal3 = true;
                                  CheckVal4 = true;
                                  CheckVal5 = true;
                                  CheckVal6 = true;
                                }
                              },
                            );
                          },
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Должности",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Количество ставок",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Единый социальный налог",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Заработная плата",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Количество месяцев работы сотрудника",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Checkbox(
                              value: CheckVal1,
                              onChanged: (value) {
                                setState(() => CheckVal1 = !CheckVal1);
                              }),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _firstLineJob,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _firstLineBidAmount,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _firstLineTax,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _firstLineSalary,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _firstLineMounthAmount,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Checkbox(
                              value: CheckVal2,
                              onChanged: (value) {
                                setState(() => CheckVal2 = !CheckVal2);
                              }),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _secondLineJob,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _secondLineBidAmount,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _secondLineTax,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _secondLineSalary,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _secondLineMounthAmount,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Checkbox(
                              value: CheckVal3,
                              onChanged: (value) {
                                setState(() => CheckVal3 = !CheckVal3);
                              }),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _thirdLineJob,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _thirdLineBidAmount,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _thirdLineTax,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _thirdLineSalary,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _thirdLineMounthAmount,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Checkbox(
                              value: CheckVal4,
                              onChanged: (value) {
                                setState(() => CheckVal4 = !CheckVal4);
                              }),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _fourthLineJob,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _fourthLineBidAmount,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _fourthLineTax,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _fourthLineSalary,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _fourthLineMounthAmount,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Checkbox(
                            value: CheckVal5,
                            onChanged: (value) {
                              setState(() => CheckVal5 = !CheckVal5);
                            }),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _fifthLineJob,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _fifthLineBidAmount,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _fifthLineTax,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _fifthLineSalary,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: 50,
                            width: 250,
                            child: TextFormField(
                                controller: _fifthLineMounthAmount,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder())),
                          ),
                        ),
                      ),
                    ],
                  ),
                  visibilityTableRow
                      ? TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Checkbox(
                                  value: CheckVal6,
                                  onChanged: (value) {
                                    setState(() => CheckVal6 = !CheckVal6);
                                  }),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  height: 50,
                                  width: 250,
                                  child: TextFormField(
                                      controller: _sixthLineJob,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder())),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  height: 50,
                                  width: 250,
                                  child: TextFormField(
                                      controller: _sixthLineBidAmount,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder())),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  height: 50,
                                  width: 250,
                                  child: TextFormField(
                                      controller: _sixthLineTax,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder())),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  height: 50,
                                  width: 250,
                                  child: TextFormField(
                                      controller: _sixthLineSalary,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder())),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  height: 50,
                                  width: 250,
                                  child: TextFormField(
                                      controller: _sixthLineMounthAmount,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder())),
                                ),
                              ),
                            ),
                          ],
                        )
                      : TableRow(children: [
                          Container(),
                          Container(),
                          Container(),
                          Container(),
                          Container(),
                          Container(),
                        ])
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: OutlinedButton(
                          onPressed: _add,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Добавить",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          style: buttonStyle,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: _remove,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Удалить",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        style: buttonStyle,
                      ),
                    ],
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _saveData();
                      Navigator.of(context).pushReplacementNamed('/support');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Рассчитать",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    style: buttonStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
