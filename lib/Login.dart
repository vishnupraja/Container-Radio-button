import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:verification/attica.dart';

import 'helper/validator.dart';
import 'otp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController EmailCtr = TextEditingController();
  TextEditingController OtpCtr = TextEditingController();

  void Login(String email , otp)async {
    Response response = await post(
        Uri.parse(
            'https://alphawizztest.tk/Atticadigitamarketing/app/v1/api/email_otp'),
        body: {
          "email": email,
          "otp" : otp,

        }
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print("Api success");
    } else {
      print("failed");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: formGlobalKey,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: 70,
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: EmailCtr,
                    decoration: InputDecoration(
                        labelText: "Enter email id",
                        hintStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(

                          borderSide: BorderSide(
                            color: Colors.black
                          )
                        )),
                    validator: (value) => validateEmail(value),
                  ),
                )),

            InkWell(
                child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "send",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
                onTap: () {
                  if (formGlobalKey.currentState!.validate()) {
                    print("Process data");
                  } else {
                    print('Error');

                  }
                  Login(EmailCtr.text.toString(),OtpCtr.text.toString());

                }),
            SizedBox(
              height: 60,
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: 70,
                  width: 300,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: OtpCtr,
                    decoration: InputDecoration(
                        labelText: "Enter Otp",
                        hintStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(

                            borderSide: BorderSide(
                                color: Colors.black
                            )
                        )),
                  ),
                )),
            InkWell(
              child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Attica()));
                // Login("otp======${OtpCtr.text.toString()}");
              },
            )
          ],
        ),
      ),
    );
  }

  String? isEmailValid(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }
}

