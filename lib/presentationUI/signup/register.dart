import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentationUI/ui%20pages/home.page.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../ui pages/menupage.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  File? _pickedImage = null;
  Future pickercamera() async {
    final myfile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = File(myfile!.path);
    });
  }

  loginAPI(String username, String password, File pickedImage) async {
    var body = {"username": username, "password": password};
    print(body);
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.47.112:8000/rest/registerr/'));
    request.files.add(http.MultipartFile.fromBytes(
        'image', pickedImage.readAsBytesSync(),
        filename: 'YourFilename.png'));
    request.fields['username'] = username;
    request.fields['password'] = password;

    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body);

    if (responseData['user'] == "ok") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => testpage()),
      );
    } else {
      print(responseData);
    }
    //  if (response.statusCode==200) {
    //     print("SUCCESS");
    //     print(responseData);
    //   }
    //  else {
    //   print("ERROR");
    // }
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
              height: 30,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 50,
              ),
              //replace with our own icon data.
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Register",
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
                          height: 30,
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
                              _pickedImage == null
                                  ? IconButton(
                                      onPressed: pickercamera,
                                      icon: Icon(
                                        Icons.camera_alt,
                                      ),
                                    )
                                  : Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          image: DecorationImage(
                                              image: FileImage(_pickedImage!),
                                              fit: BoxFit.fill)),
                                    ),

                              // Flexible(
                              //   flex: 1,
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     children: [
                              //       IconButton(
                              //         onPressed: pickercamera,
                              //         icon: Icon(
                              //           Icons.camera_alt,
                              //           color: Theme.of(context)
                              //               .textTheme
                              //               .bodyText1
                              //               .color
                              //               .withOpacity(0.64),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: username,
                                  decoration: InputDecoration(
                                      hintText: "username",
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
                                      hintText: "Password",
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
                                  controller: password2,
                                  decoration: InputDecoration(
                                      hintText: "Repeate Password",
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
                                    password.text == "" ||
                                    password2.text == "" ||
                                    _pickedImage == null) {
                                  print("empty");
                                } else {
                                  if (password.text == password2.text) {
                                    loginAPI(username.text, password.text,
                                        _pickedImage!);
                                  } else {
                                    print("password not the same");
                                  }
                                }
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
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
