import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:tco_calculator/infrastructure.dart';

class dataInput extends StatefulWidget {
  const dataInput({Key? key}) : super(key: key);

  @override
  State<dataInput> createState() => _dataInputState();
}

class _dataInputState extends State<dataInput> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final guid = TextEditingController();
  var isWeb = kIsWeb;
  final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color(0xFF52647E),
    side: BorderSide(
      color: Color(0xFF52647E),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
              ? Container(
                  height: 300,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* Container(
                  padding: EdgeInsets.only(left: 100, right: 100,top: 10, bottom: 10),
                  color: Color(0xFF52647E),
                  child: Text("Введите данные", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                ),*/
                      TextFormField(
                        controller: name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '* Необходимо заполнить данное поле';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Введите название ИС',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: guid,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '* Необходимо заполнить данное поле';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Введите GUID ИС',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Тип расчета',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          OutlinedButton(
                            style: buttonStyle,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {

                                Navigator.of(context).pushNamed(
                                  '/infrastructure',
                                );

                                print(name.value);


                                print(guid.value);
                              }
                            },
                            child: Text("Расчет"),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* Container(
                  padding: EdgeInsets.only(left: 100, right: 100,top: 10, bottom: 10),
                  color: Color(0xFF52647E),
                  child: Text("Введите данные", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                ),*/
                      TextFormField(
                        controller: name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '* Необходимо заполнить данное поле';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Введите название ИС',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: guid,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '* Необходимо заполнить данное поле';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Введите GUID ИС',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Тип расчета',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          OutlinedButton(
                            style: buttonStyle,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {

                              }

                                print(name.value);
                                print(guid.value);
                            },
                            child: Text("Расчет"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
