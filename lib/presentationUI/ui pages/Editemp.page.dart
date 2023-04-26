import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Employer.page.dart';
import '../../presentationUI/ui pages/cliping_path.dart';
import '../../presentationUI/ui pages/home.page.dart';
import '../../presentationUI/ui pages/maind.page.dart';

class Editemppage extends StatefulWidget{
  const Editemppage({super.key});

  @override
  State<Editemppage> createState() => _EditemppageState();
}
final _formKey = GlobalKey<FormState>();
class _EditemppageState extends State<Editemppage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return AlertDialog(
      insetPadding: const EdgeInsets.all(40),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(20))),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Edit Employe',
              textScaleFactor: 1.0,
              style: const TextStyle(
                  color: Colors.teal, fontWeight: FontWeight.bold)),
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close)),
        ],
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: Get.size.width,
          child: Form(
            
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [
               
                  

                   
                        
                      SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        
                        decoration: const InputDecoration(icon:Icon(Icons.person,color:Colors.blue)),
                      ),
                    ),
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        
                        decoration: const InputDecoration(icon: Icon(Icons.picture_in_picture, color: Colors.blue)),
                      ),
                    ),
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        
                        decoration: const InputDecoration(icon: Icon(Icons.call, color: Colors.green)),
                      ),
                    ),
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        
                        decoration: const InputDecoration(icon: Icon(Icons.email, color: Colors.black)),
                      ),
                    ),
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                       
                        decoration: const InputDecoration(icon:Icon(Icons.card_travel, color:Colors.black)),
                      ),
                    ),
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                       
                        decoration: const InputDecoration(icon:Icon(Icons.money, color:Colors.blue)),
                     
                      ),
                    ),
      Container( 
                  height: 200,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton.icon(
                      onPressed: (){
                        print("You pressed Icon Elevated Button");
                      }, 
                      icon: Icon(Icons.add),  
                      label: Text("Edit"), 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.blue 
                      ),
                  ),),
                    ])))));
 }
}

         
       
     
       
    
       
     
     
     
   

     
  