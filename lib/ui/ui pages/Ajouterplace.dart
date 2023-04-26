import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/api/place.dart';
import 'package:get/get.dart';

import '../../models/place.dart';

class Ajouterplace extends StatefulWidget{
  const Ajouterplace({super.key});

  @override
  State<Ajouterplace> createState() => _AjouterplaceState();
}
final _formKey = GlobalKey<FormState>();
class _AjouterplaceState extends State<Ajouterplace> {
  int currentIndex = 0;
  TextEditingController placeController = TextEditingController();
  TextEditingController nbreplaceController = TextEditingController();
  TextEditingController diplomeAController = TextEditingController();
  TextEditingController exprienceAController = TextEditingController();
  TextEditingController comptence1Controller = TextEditingController();
  TextEditingController comptence2Controller = TextEditingController();
  TextEditingController comptence3Controller = TextEditingController();
  
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
          Text('Add Avis poste',
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
                        controller: placeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'place',
                          hintText: 'Enter un place',
                         
                        ),
                      ),
                    ),
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                         controller:nbreplaceController,
                       decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'nbre place',
                          hintText: 'Enter nnre de place',
                         
                        ),
                      ),
                      ),
                   
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                         controller:diplomeAController ,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'Diplome',
                          hintText: 'Enter le diplome',
                         
                        ),
                      ),
                      ),
                   
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller:exprienceAController ,
                       decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'Exprienc',
                          hintText: 'Enter dure de Exprience',
                         
                        ),
                      ),
                      ),
                   
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller:comptence1Controller ,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'premiere comptence',
                          hintText: 'Enter premiere comptence',
                         
                        ),
                      ),
                     
                      ),
                   
                    SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller:comptence2Controller ,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'deuxieme',
                          hintText: 'entre de deuxieme comptence',
                         
                        ),
                      ),
                        
                      ),
                    
                      SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller:comptence3Controller ,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'troisieme comptence',
                          hintText: 'Entre troisieme comptence',
                         
                        ),
                      ),
                      ),
                   
      Container( 
                  height: 200,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton.icon(
                      onPressed: (){
                        Placee newplace=Placee(place:placeController.text, nbrePlace:int.parse(nbreplaceController.text),diplomeA: diplomeAController.text,exprenceA:exprienceAController.text,comptence1:comptence1Controller.text,comptence2:comptence2Controller.text ,comptence3:comptence3Controller.text);
                                
                       PlaceController.addplace(newplace).then((yt) {
                    
                          
 yt
                                  ? ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.green,
                                      duration: Duration(seconds: 3),
                                      content: Text("place  added",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ))
                                  : ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 3),
                                      content: Text("Eroor",
                                          style:
                                              TextStyle(color: Colors.white,),),
                                    ));
                               Get.back();

                       });
                    
                      }, 
                      icon: Icon(Icons.add),  
                      label: Text("Add"), 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.blue 
                      ),
                  ),),
                    ])))));
 }
}

         
       
     
       
    
       
     
     
     
   

     
    
 