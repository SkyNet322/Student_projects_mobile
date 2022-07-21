import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
//import 'package:fluttertoast/fluttertoast.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  AuthorizationPageState createState() => AuthorizationPageState();
}

class AuthorizationPageState extends State<AuthorizationPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

 /* Future login() async {
    var url = Uri.http("192.168.137.1", '/login/pp.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "username": controller1.text,
      "password": controller2.text,
    });
    var data = json.decode(response.body);
    if (data.toString() == "Success") {
      Fluttertoast.showToast(
        msg: 'Success',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Error',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }*/

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Авторизация"),
        backgroundColor: Color(0xFF52647E),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFD7D7D7),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          //width: MediaQuery.of(context).size.width,
         // height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller1,

                decoration: InputDecoration(
                  labelText: 'Имя пользователя',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: controller2,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  border: OutlineInputBorder(),
                ),
                //onSaved: (value) =>
                //    setState(() => password = value!),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(

                onPressed: () {
                  //  var isValid = formKey.currentState?.validate();
                  /*   if (isValid!) {
                              formKey.currentState?.save();
                            }*/
                 // login();
                  print(controller1.value);
                  print(controller2.value);
                },
                child: Text("Вход"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
