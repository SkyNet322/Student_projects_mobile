import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  var token;

  Future<String> loginApis(String user, String password) async {
    var apiURL = 'http://78.107.209.48/api/login';
    var formData = FormData.fromMap({
      'login': user,
      'password': password,
    });
    Dio dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    Response response;
    try {
      response = await dio.post(
        apiURL,
        data: formData,
      );
      print("response data " + response.toString());
      if (response.data['token'] != null) {
        Navigator.pushNamed(context, '/datainput');
        token = response.data['token'];
       // HeaderAuth(token);
        Fluttertoast.showToast(
            msg: "Login Successful", backgroundColor: Colors.cyan);
        print(response.headers['Authorization']);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Error", backgroundColor: Colors.cyan);
      return 'something wrong';
    }
    return '';
  }
  // Future<String> HeaderAuth(var token) async {
  //   var apiURL = 'http://78.107.209.48/api/login';
  //
  //   Dio dio = Dio();
  //
  //   Response response;
  //   try {
  //     response = await dio.post(
  //       apiURL,
  //         options: Options(
  //           headers: {"Authorization": "Bearer $token"},
  //         ),
  //     );
  //
  //     print(response.headers);
  //
  //     } catch (e) {
  //
  //     return 'something wrong';
  //   }
  //   return '';
  // }

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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                loginApis(username.text, password.text);

                                // Navigator.of(context).pushReplacementNamed('/datainput');
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
                                // Navigator.of(context).pushNamed('/datainput',);
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
