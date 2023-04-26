import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentationUI/ui%20pages/edit.page.dart';
import 'package:flutter_application_3/presentationUI/ui%20pages/langue.page%20.dart';
import 'package:get/get.dart';

import '../../presentationUI/signup/signup.dart';
 
class Maindrawer extends StatelessWidget{
  const Maindrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget> [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue,Colors.black])
              ),
              child:Center(
               child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/image.jpeg'),
                ),
              ),
            ),
           
           ListTile(
            title: Text('langue'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Languepage()));
            },
           
            
            

           ),
           
           ListTile(
            title: Text('Compte'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Editpage()));
            },
           

           ) ,
          
           ListTile(
            title: Text('Deconnecte'),
            onTap: (){
              Get.offAll(HomePage());
            },

           ) , 
          ],
        ),
      );
      
       
    
  } 
}
      
    
    
  



