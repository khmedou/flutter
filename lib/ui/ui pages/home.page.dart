
import 'dart:ui';

import 'package:flutter_application_3/models/st.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_3/ui/ui%20pages/text.dart';

 import '../../api/st.dart';
class homepage extends StatefulWidget{
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {


    st sst = st(active: 0,conge: 0,emp: 0,place: 0);
bool isLoading=true;
  _loadData() async {
    
    stController.fetchst().then((employeds) {
      
       
      setState(() {
        sst = employeds;
        isLoading = false;
      });
    });
  }
   @override
     void initState() {
    _loadData();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text("",
          
          style: TextStyle(
            color: Colors.blue,
            fontSize: 28.0,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.start,
          ),
         ),
         Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Wrap(
             spacing: 20.0,
             runSpacing: 20.0,
             children: [
               SizedBox(
                width: 160.0,
                height: 160.0,
                child: Card(
                  color:Colors.blue,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                                          radius: 20,
                          backgroundImage:AssetImage('assets/image.jpeg',),),
                          SizedBox(height: 10.0),
                          Text("Employees", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                          ),),
                          SizedBox(height: 5.0),
                          Text("${sst.emp}", style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                          ),)
                        ]
                        ),

                    )
                    ),
                ),
               ),
                SizedBox(
                width: 160.0,
                height: 160.0,
                child: Card(
                  color: Colors.teal,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                                          radius: 20,
                                          
                          backgroundImage:AssetImage('assets/image.jpeg',),),
                          SizedBox(height: 10.0),
                          Text("Place", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                          ),),
                          SizedBox(height: 5.0),
                          Text("${sst.place}", style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                          ),)
                        ]
                        ),

                    )
                    ),
                ),
               ),
               SizedBox(
                width: 160.0,
                height: 160.0,
                child: Card(
                  color: Colors.green,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                                          radius: 20,
                                          
                          backgroundImage:AssetImage('assets/image.jpeg',),),
                          SizedBox(height: 10.0),
                          Text("Employees Active", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                          ),),
                          SizedBox(height: 5.0),
                          Text("${sst.active}", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),)
                        ]
                        ),

                    )
                    ),
                ),
               ),
               
               SizedBox(
                width: 160.0,
                height: 160.0,
                child: Card(
                  color: Colors.green.shade100,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                         CircleAvatar(
                                          radius: 20,
                                          
                          backgroundImage:AssetImage('assets/image.jpeg',),),
                          SizedBox(height: 10.0),
                          Text("Employees en conge", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                          ),),
                          SizedBox(height: 5.0),
                          Text("${sst.conge}", style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                          ),)
                        ]
                        ),

                    )
                    ),
                ),
               ),
             ],

              ),
            ),
         )
        
             
      ],
    );

       
  }
}