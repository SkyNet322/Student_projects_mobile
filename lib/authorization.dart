import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tco_calculator/datainput.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';
import 'package:tco_calculator/infrastructure.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  AuthorizationPageState createState() => AuthorizationPageState();
}

class AuthorizationPageState extends State<AuthorizationPage> {
  var isWeb = kIsWeb;
  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();
  bool passObscure = true;
  final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color(0xFF52647E),
    side: BorderSide(
      color: Color(0xFF52647E),
    ),
  );

  /* Future login() async {
    var url = Uri.http("192.168.137.1", '/login/pp.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "username": username.text,
      "password": password.text,
    });
    var data = json.decode(response.body);
    if (data.toString() == "Success") {
      Fluttertoast.showToast(
        msg: 'Success',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => dataInput(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Error',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
*/
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Авторизация",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF52647E),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFD7D7D7),
        body: Align(
          alignment: Alignment.center,
          child: isWeb
              ? Container(
                  height: 300,
                  width: 300,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '* Необходимо заполнить данное поле';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Имя пользователя',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '* Необходимо заполнить данное поле';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Пароль',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  passObscure = !passObscure;
                                },
                              );
                            },
                            icon: Icon(passObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: passObscure,
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
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => dataInput(),
                                  ),
                                );

                                // login();
                                print(username.value);
                                print(password.value);
                              }
                            },
                            child: Text("Вход"),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '* Необходимо заполнить данное поле';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Имя пользователя',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '* Необходимо заполнить данное поле';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Пароль',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  passObscure = !passObscure;
                                },
                              );
                            },
                            icon: Icon(passObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: passObscure,
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
                                  '/datainput',
                                );

                                // login();
                                print(username.value);
                                print(password.value);
                              }
                            },
                            child: Text("Вход"),
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
