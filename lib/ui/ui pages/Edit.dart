import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/api/getEmploiyer.dart';
import 'package:flutter_application_3/models/Emploiyer.dart';

import 'package:get/get.dart';

import 'Employer.page.dart';
import 'cliping_path.dart';
import 'home.page.dart';
import 'maind.page.dart';

class Edit extends StatefulWidget{
  Employee emploiyer;
   Edit({required this.emploiyer,super.key});

  @override
  State<Edit> createState() => _EditState();
}
final _formKey = GlobalKey<FormState>();
class _EditState extends State<Edit> {
   
  int currentIndex = 0;
  TextEditingController nomController = TextEditingController();
  //TextEditingController  statutController = TextEditingController();
  TextEditingController  imageController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController sallaireController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController numconteController = TextEditingController();
  Employee emploiyeEdit=Employee();
   @override
     void initState() {
      emploiyeEdit=widget.emploiyer;
   nomController = TextEditingController(text: widget.emploiyer.nom);
  //  statutController = TextEditingController(text: widget.emploiyer.statut);
   imageController = TextEditingController(text: widget.emploiyer.photo);
   telController = TextEditingController(text: widget.emploiyer.numTel);
   emailController = TextEditingController(text: widget.emploiyer.email);
   postController = TextEditingController(text:widget.emploiyer.poste );
   sallaireController = TextEditingController(text:widget.emploiyer.salaire.toString());
   dateController = TextEditingController(text:widget.emploiyer.dataNaissance);
   numconteController = TextEditingController(text:widget.emploiyer.numCompte);
    super.initState();
  }
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
                        controller: nomController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'nom',
                          hintText: 'Enter un nom',
                         
                        ),
                      ),
                    ),
                    // SizedBox(height: size.height * 0.03),
                    // Container(
                    //   alignment: Alignment.center,
                    //   margin: const EdgeInsets.symmetric(horizontal: 40),
                    //   child: TextField(
                    //     controller: statutController,
                    //     decoration: const InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(20)),
                    //         borderSide: BorderSide(
                    //           color: Colors.brown,
                    //           width: 3,
                    //         )
                    //       ),
                    //       labelText: 'statut',
                    //       hintText: 'Enter un statut',
                         
                    //     ),
                    //   ),
                    // ),
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                         controller:telController,
                       decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'tel',
                          hintText: 'Enter num tel',
                         
                        ),
                      ),
                      ),
                   
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                         controller:emailController ,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'Email',
                          hintText: 'Enter Email',
                         
                        ),
                      ),
                      ),
                   
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller:postController ,
                       decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'poste',
                          hintText: 'Enter  poste',
                         
                        ),
                      ),
                      ),
                   
                     SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller:sallaireController ,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'salaire',
                          hintText: 'Enter salaire',
                         
                        ),
                      ),
                     
                      ),
                   
                    SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller:dateController ,
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'date debut de contrat',
                          hintText: 'date de debut de contrat',
                         suffixIcon: IconButton(icon: Icon(Icons.calendar_month),onPressed: () async {
                              await showDatePicker(
  
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2030),
    ).then((value) {
    setState(() {
    numconteController.text="${value!.year}-${value.month}-${value.day}";
   });
                         
                         });},
                          ),
                        ),
                      ),
                        
                      ),
                    
                      SizedBox(height: size.height * 0.03),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller:numconteController ,
                        decoration:  InputDecoration(
                         border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            ),
                            
                          ),
                          labelText: 'date de fin de contrat',
                          hintText: 'date de fin de contrat',
                          suffixIcon: IconButton(icon: Icon(Icons.calendar_month),onPressed: () async {
                              await showDatePicker(
  
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2030),
    ).then((value) {
    setState(() {
    numconteController.text="${value!.year}-${value.month}-${value.day}";
   });
                         
                         });},
                          ),

                        ),
                      ),
                        
                      ),
                   
      Container( 
                  height: 200,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton.icon(
                      onPressed: (){
                        setState(() {
                          emploiyeEdit.nom=nomController.text;
                          //emploiyeEdit.statut=statutController.text;
                          emploiyeEdit.photo=imageController.text; 
                          emploiyeEdit.numTel=telController.text;
                          emploiyeEdit.email=emailController.text;
                          emploiyeEdit.poste =postController.text; 
                          emploiyeEdit.salaire=int.parse(sallaireController.text);
                          emploiyeEdit.dataNaissance =dateController.text;
                          emploiyeEdit.numCompte =numconteController.text;
                          emploiyeEdit.photo=widget.emploiyer.photo;
 
                        });
                       

                       EmploiyerController.editEmploiye(emploiyeEdit).then((yt) {
                    
                          
 yt
                                  ? ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.green,
                                      duration: Duration(seconds: 3),
                                      content: Text("Employee added",
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

         
       
     
       
    
       
     
     
     
   

     
    
 