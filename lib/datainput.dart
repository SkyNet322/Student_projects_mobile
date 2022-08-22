import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';

import 'models/data_model.dart';
class dataInput extends StatefulWidget {
  const dataInput({Key? key}) : super(key: key);

  @override
  State<dataInput> createState() => _dataInputState();
}

class _dataInputState extends State<dataInput> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final guid = TextEditingController();
  final type = TextEditingController();
  var isWeb = kIsWeb;
  final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color(0xFF52647E),
    side: BorderSide(
      color: Color(0xFF52647E),
    ),
  );

  final myBox = Hive.box('token_box');
  var token;

  @override
  void initState() {
    //HeaderAuth(token);

    super.initState();
    token = myBox.get('token');
    type.text = "Существующая информационная система";
  }

  @override
  void dispose() {
    super.dispose();
  }


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
                      // TextFormField(
                      //   controller: name,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return '* Необходимо заполнить данное поле';
                      //     }
                      //     return null;
                      //   },
                      //   decoration: InputDecoration(
                      //     labelText: 'Введите название или GUID ИС',
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      DropdownSearch<DataModel>(

                        popupProps: PopupProps.menu(
                          showSearchBox: true,

                          menuProps: MenuProps(
                            backgroundColor: Color(0xFFD7D7D7),
                            borderRadius: BorderRadius.circular(10),
                            shadowColor: Colors.blueGrey,
                          ),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(dropdownSearchDecoration: InputDecoration(
                          labelText: 'Введите название или GUID ИС',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        ),
                        asyncItems: (String filter) async {
                          var response = await Dio().get(
                            "http://37.145.168.238/api/getguid",
                            //"http://localhost/api/getguid",
                            options: Options(
                              headers: {"Authorization": "Bearer $token"},
                            ),
                          );
                          var models = DataModel.fromJsonList(response.data);
                          return models;
                        },
                        validator:(item){
                          if(item == null){
                            return "* Необходимо заполнить данное поле";
                          }
                          return null;
                        } ,
                        onChanged: (DataModel? data) {
                         myBox.put('guid', data?.GUID);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: type,
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
                                print(myBox.get('token'));
                                print(myBox.get('guid'));
                                //Navigator.of(context).pushReplacementNamed('/infrastructure');
                               // print(name.value);
                               // print(guid.value);
                              }
                            },
                            child: Text("Расчет"),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
