import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tco_calculator/models/calculate_model.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({Key? key}) : super(key: key);

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  final _formKey = GlobalKey<FormState>();
  var isWeb = kIsWeb;
  final tokenbox = Hive.box('token_box');
  final myBox = Hive.box('temp_box');
  final myBox2 = Hive.box('guid_box');
  String token = "";
  late Calculate calc;

  //Map<dynamic, dynamic> map = {};
  final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color(0xFF52647E),
    side: BorderSide(
      color: Color(0xFF52647E),
    ),
  );

  void getFile(var token) async {
    var apiURL = 'http://localhost/api/export';
    var id = myBox2.get('GUID_id').toString();
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.post(
        apiURL,
        data: { "guid_id" : id },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      if(response.statusCode == 200){

       downloadFile(response.data.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  void downloadFile(String url) {
    var urll = "http://localhost/"  + url.substring(21);
    print(urll);
    html.AnchorElement anchorElement =  new html.AnchorElement(href: urll);
    anchorElement.download = urll;
    anchorElement.click();
  }

  Future<String?> calculate(String tok) async {
    var apiURL =
        'http://localhost/api/calculate/' + myBox2.get('GUID_id').toString();
    print(apiURL);
    Dio dio = Dio();
    Response response;
    print(tok);
    try {
      response = await dio.get(
        apiURL,
        options: Options(
          followRedirects: false,
          headers: {'Authorization': 'Bearer $tok'},
        ),
      );

      if (response.statusCode == 200) {
        //print(response.data);
        saveMap(response.data);
        return null;
      }
      return null;
    } catch (e) {
      print("error: $e");
    }
    return null;
  }

  Future saveMap(tmp) async {
    await myBox.put('map', tmp);
    //print("saved");
    return null;
  }

  void initData() {
    calculate(token);
    return;
  }

  String strNULL(String str) {
    if (str == "null" || str == "0") {
      str = " ";
      return str;
    } else {
      return str;
    }
  }

  Future<String> getData() {
    return Future.delayed(Duration(seconds: 3), () async {
      token = tokenbox.get('token').toString();
      //initData();
      await calculate(token);
      calc = Calculate.fromJson(myBox.get('map'));
      return " ";
    });
  }

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
                ? FutureBuilder(
                    future: getData(),
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error} occurred',
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        } else if (snapshot.hasData) {
                          return Padding(
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
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
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
                                        Center(
                                            child: Text("Cтатья затрат",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        Center(
                                            child: Text("Вид затрат",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        Column(
                                          children: [
                                            Container(
                                                child: Text("Затраты",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                  child: Center(
                                                      child: Text("1-ый год",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey),
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Container(
                                                  child: Center(
                                                      child: Text("2-ой год",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey),
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Container(
                                                  child: Center(
                                                      child: Text("3-ий год",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey),
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Container(
                                                  child: Center(
                                                      child: Text("4-ый год",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey),
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Container(
                                                  child: Center(
                                                      child: Text("5-ый год",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey),
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Container(
                                                  child: Center(
                                                      child: Text("Всего",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey),
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Center(
                                          child: Text(
                                            calc.inflic![0].item.toString(),
                                          ),
                                        ),
                                        Center(
                                            child: Text(
                                          calc.inflic![0].type.toString(),
                                        )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![0].year1
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![0].year2
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![0].year3
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![0].year4
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![0].year5
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![0].total
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Center(
                                          child: Text(
                                            calc.inflic![1].item.toString(),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            calc.inflic![1].type.toString(),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    strNULL(calc
                                                        .inflic![1].year1
                                                        .toString()),
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    strNULL(calc
                                                        .inflic![1].year2
                                                        .toString()),
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    strNULL(calc
                                                        .inflic![1].year3
                                                        .toString()),
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    strNULL(calc
                                                        .inflic![1].year4
                                                        .toString()),
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    strNULL(calc
                                                        .inflic![1].year5
                                                        .toString()),
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    strNULL(calc
                                                        .inflic![1].total
                                                        .toString()),
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Center(
                                            child: Text(
                                          calc.inflic![2].item.toString(),
                                        )),
                                        Center(
                                            child: Text(
                                          calc.inflic![2].type.toString(),
                                        )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![2].year1
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![2].year2
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![2].year3
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![2].year4
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![2].year5
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![2].total
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Center(
                                            child: Text(
                                          calc.inflic![3].item.toString(),
                                        )),
                                        Center(
                                            child: Text(
                                          calc.inflic![3].type.toString(),
                                        )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![3].year1
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![3].year2
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![3].year3
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![3].year4
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![3].year5
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![3].total
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Center(
                                            child: Text(
                                          calc.inflic![4].item.toString(),
                                        )),
                                        Center(
                                            child: Text(
                                          calc.inflic![4].type.toString(),
                                        )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![4].year1
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![4].year2
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![4].year3
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![4].year4
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![4].year5
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![4].total
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Center(
                                            child: Text(
                                          calc.inflic![5].item.toString(),
                                        )),
                                        Center(
                                            child: Text(
                                          calc.inflic![5].type.toString(),
                                        )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![5].year1
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![5].year2
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![5].year3
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![5].year4
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![5].year5
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![5].total
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Center(
                                            child: Text(
                                          calc.inflic![6].item.toString(),
                                        )),
                                        Center(
                                            child: Text(
                                          calc.inflic![6].type.toString(),
                                        )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![6].year1
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![6].year2
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![6].year3
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![6].year4
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![6].year5
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      strNULL(calc
                                                          .inflic![6].total
                                                          .toString()),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
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
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text("",
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text("",
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text("",
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text("",
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text("",
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text("",
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
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
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.development!.year1
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.development!.year2
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.development!.year3
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.development!.year4
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.development!.year5
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.development!.total
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Center(
                                            child:
                                                Text("Команда сопровождения")),
                                        Center(child: Text("")),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.support!.year1
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.support!.year2
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.support!.year3
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.support!.year4
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.support!.year5
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.support!.total
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Center(
                                            child: Text("ТСО / В год - CAPEX")),
                                        Center(child: Text("")),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.tsoCAPEX!.year1
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.tsoCAPEX!.year2
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.tsoCAPEX!.year3
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.tsoCAPEX!.year4
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.tsoCAPEX!.year5
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.tsoCAPEX!.total
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Center(
                                            child: Text("ТСО / В год - OPEX")),
                                        Center(child: Text("")),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.tsoOPEX!.year1
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.tsoOPEX!.year2
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.tsoOPEX!.year3
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.tsoOPEX!.year4
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.tsoOPEX!.year5
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              child: Center(
                                                  child: Text(
                                                      calc.tsoOPEX!.total
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16))),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.grey),
                                              ),
                                            )),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 40),
                                      child: OutlinedButton.icon(
                                        onPressed: () async {
                                         //exportExcelForWeb(token);
                                         getFile(token);
                                        },
                                        icon: Icon(Icons.download, size: 15),
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
                          );
                        }
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            Text("Загрузка данных..."),
                          ],
                        ),
                      );
                    })
                : Container(),
          ),
        ),
      ),
    );
  }
}
