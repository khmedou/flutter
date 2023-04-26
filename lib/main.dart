
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'presentationUI/signup/signup.dart';


void main() =>runApp(MyApp());
class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  
 


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale:  const Locale('fr', 'Fr'),
     
    debugShowMaterialGrid: false,
   debugShowCheckedModeBanner: false,
      home: HomePage()
      );
    
  }  
}


    
  



