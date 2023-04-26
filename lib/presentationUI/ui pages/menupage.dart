import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentationUI/ui%20pages/Ajouter.page.dart';
import 'package:flutter_application_3/presentationUI/ui%20pages/Employer.page.dart';
import 'package:flutter_application_3/presentationUI/ui%20pages/cliping_path.dart';
import 'package:flutter_application_3/presentationUI/ui%20pages/home.page.dart';
import 'package:flutter_application_3/presentationUI/ui%20pages/place.dart';

import '../../presentationUI/ui pages/maind.page.dart';

class testpage extends StatefulWidget {
  const testpage({super.key});

  @override
  State<testpage> createState() => _testpageState();
}
class _testpageState extends State<testpage> {
    int currentIndex = 1;
  final Screens = [

   homepage(),
   Employerpage(),
   Place(),

  


  ];
  
    appbarDialoge(BuildContext context) async {
    return showDialog(
      
        context: context,
        builder: (BuildContext context) {
          return const Ajouterpage();
        });
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    floatingActionButton:currentIndex==1? FloatingActionButton(onPressed:(){appbarDialoge(context);},
    
                       child: Icon(Icons.person_add), backgroundColor: Colors.teal,):Text(''),
       
       drawer:  Maindrawer(),
        body:CustomScrollView(slivers: [SliverAppBar(backgroundColor: Colors.transparent,flexibleSpace: MyClippingPath(),expandedHeight: 150,),SliverToBoxAdapter(child: Screens[currentIndex]) ],
        ),
       
      bottomNavigationBar: CurvedNavigationBar(
        //  currentIndex: currentIndex,
        onTap: (index) => setState(() =>currentIndex = index),
        backgroundColor: Colors.white,
        color:Colors.teal,
        animationDuration: Duration(milliseconds: 300),
        items: [
            
            Icon(
              Icons.home,
              color: Colors.white),
            
            Icon(
                 Icons.people,
                 color: Colors.white),
          
            Icon(
                 Icons.content_paste,
                 color: Colors.white)
          
    
    
        ]
    
      ),
      )
   ;
  }
}
     
    