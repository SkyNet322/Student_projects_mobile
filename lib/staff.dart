import 'package:flutter/material.dart';

class staffPage extends StatefulWidget {
  const staffPage({Key? key}) : super(key: key);

  @override
  State<staffPage> createState() => _staffPageState();
}

class _staffPageState extends State<staffPage> {
  final TextEditingController firstLineJob = TextEditingController();
  final TextEditingController firstLineBidAmount = TextEditingController();
  final TextEditingController firstLineTax = TextEditingController();
  final TextEditingController firstLineSalary = TextEditingController();
  final TextEditingController firstLineMounthAmount = TextEditingController();
  final TextEditingController secondLineJob = TextEditingController();
  final TextEditingController secondLineBidAmount = TextEditingController();
  final TextEditingController secondLineTax = TextEditingController();
  final TextEditingController secondLineSalary = TextEditingController();
  final TextEditingController secondLineMounthAmount = TextEditingController();
  final TextEditingController thirdLineJob = TextEditingController();
  final TextEditingController thirdLineBidAmount = TextEditingController();
  final TextEditingController thirdLineTax = TextEditingController();
  final TextEditingController thirdLineSalary = TextEditingController();
  final TextEditingController thirdLineMounthAmount = TextEditingController();
  final TextEditingController fourthLineJob = TextEditingController();
  final TextEditingController fourthLineBidAmount = TextEditingController();
  final TextEditingController fourthLineTax = TextEditingController();
  final TextEditingController fourthLineSalary = TextEditingController();
  final TextEditingController fourthLineMounthAmount = TextEditingController();
  final TextEditingController fifthLineJob = TextEditingController();
  final TextEditingController fifthLineBidAmount = TextEditingController();
  final TextEditingController fifthLineTax = TextEditingController();
  final TextEditingController fifthLineSalary = TextEditingController();
  final TextEditingController fifthLineMounthAmount = TextEditingController();
  final TextEditingController sixthLineJob = TextEditingController();
  final TextEditingController sixthLineBidAmount = TextEditingController();
  final TextEditingController sixthLineTax = TextEditingController();
  final TextEditingController sixthLineSalary = TextEditingController();
  final TextEditingController sixthLineMounthAmount = TextEditingController();

  bool visibilityTableRow = false;

  void _add() {
    setState(() => visibilityTableRow = true);
  }

  void _remove() {
    setState(() => visibilityTableRow = false);
  }

  bool allVal = false;
  bool CheckVal1 = false;
  bool CheckVal2 = false;
  bool CheckVal3 = false;
  bool CheckVal4 = false;
  bool CheckVal5 = false;
  bool CheckVal6 = false;

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
                  "Персонал",
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
                              controller: firstLineJob,
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
                              controller: firstLineBidAmount,
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
                              controller: firstLineTax,
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
                              controller: firstLineSalary,
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
                              controller: firstLineMounthAmount,
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
                              controller: secondLineJob,
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
                              controller: secondLineBidAmount,
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
                              controller: secondLineTax,
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
                              controller: secondLineSalary,
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
                              controller: secondLineMounthAmount,
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
                              controller: thirdLineJob,
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
                              controller: thirdLineBidAmount,
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
                              controller: thirdLineTax,
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
                              controller: thirdLineSalary,
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
                              controller: thirdLineMounthAmount,
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
                              controller: fourthLineJob,
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
                              controller: fourthLineBidAmount,
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
                              controller: fourthLineTax,
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
                              controller: fourthLineSalary,
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
                              controller: fourthLineMounthAmount,
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
                              controller: fifthLineJob,
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
                              controller: fifthLineBidAmount,
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
                              controller: fifthLineTax,
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
                              controller: fifthLineSalary,
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
                              controller: fifthLineMounthAmount,
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
                                    controller: sixthLineJob,
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
                                    controller: sixthLineBidAmount,
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
                                    controller: sixthLineTax,
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
                                    controller: sixthLineSalary,
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
                                    controller: sixthLineMounthAmount,
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
                    onPressed: () {},
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
