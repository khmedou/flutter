// TODO Implement this library.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentationUI/signup/register.dart';
import 'package:flutter_application_3/presentationUI/ui%20pages/menupage.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  loginAPI(String username, String password) async {
    var body = {"username": username, "password": password};
    print(body);
    final res = await http 
        .post(Uri.parse("http://192.168.47.112:8000/rest/login/"), body: body);
    var data = jsonDecode(res.body);
    if (data['user'] == "ok") {
      print("bbbbb");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => testpage()),
      );
    } else {
      print("notok");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.teal, Colors.teal, Colors.teal])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.teal,
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: username,
                                  decoration: InputDecoration(
                                      hintText: "Nom",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: password,
                                  decoration: InputDecoration(
                                      hintText: "Mode pass",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(50),
                          //     color: Colors.teal[900]),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.teal),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)))),
                              onPressed: () {
                                if (username.text == "" ||
                                    password.text == "") {
                                  print("empty");
                                } else {
                                  loginAPI(username.text, password.text);
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              foregroundColor: Colors.teal),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),
                            );
                          },
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
