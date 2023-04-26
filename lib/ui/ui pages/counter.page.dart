
import 'package:flutter/material.dart';

class counterpage extends StatefulWidget {
 
  @override
  State<counterpage> createState() => _counterpageState();
}

class _counterpageState extends State<counterpage> {
  int conter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('conter')),
      body:Center(
        child: Text('conter value=> ${conter}'
        ),


      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [ 
           
           FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                --conter;
              });
              print(conter);
          
        },
        ),
        SizedBox(width: 8,),
         
         FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                ++conter;
              });
              print(conter);
          
        },
        ),
        ],
      ),
    );



    
  }
}