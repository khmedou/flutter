import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/api/getEmploiyer.dart';
import 'package:flutter_application_3/models/Emploiyer.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import 'Employer.page.dart';
import 'cliping_path.dart';
import 'home.page.dart';
import 'maind.page.dart';

class Ajouterpage extends StatefulWidget{
  const Ajouterpage({super.key});

  @override
  State<Ajouterpage> createState() => _AjouterpageState();
}
final _formKey = GlobalKey<FormState>();
class _AjouterpageState extends State<Ajouterpage> {
  int currentIndex = 0;
  TextEditingController nomController = TextEditingController();
 
  TextEditingController telController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController sallaireController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController numconteController = TextEditingController();
  TextEditingController statutController = TextEditingController();
  // File? _image;
  // bool eding = false;
  // final imagePicker = ImagePicker();
  // XFile? pickedFile;
  // Future getImage() async {
  //   final XFile? pickedFile =
  //       await imagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = File(pickedFile!.path);
  //   });
  // }



  // Widget _imageWidget() {
  //   return Container(
  //     width: Get.size.width,
  //     height: _image == null
  //         ? Get.size.width * 0.08
  //         : Get.size.height * 0.12,
  //     decoration: BoxDecoration(
  //         border: Border.all(color: const Color.fromARGB(255, 230, 228, 228)),
  //         borderRadius: const BorderRadius.all(Radius.circular(15),),),
  //     child: _image == null
  //         ? Row(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(10.0),
  //                 child:InkWell(
  //                   child: Text('take a photo'),
  //                   onTap: () => getImage(),
  //                 ),
  //               ),
  //             ],
  //           )
  //         : Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Image.file(_image!),
  //                 IconButton(
  //                     onPressed: () => setState(() => _image = null),
  //                     icon: const Icon(Icons.delete),)
  //               ],
  //             ),
  //           ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


   return AlertDialog(
      insetPadding: const EdgeInsets.all(20),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(20))),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Add Employe',
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
                    //  _imageWidget(),
                    //   SizedBox(height: size.height * 0.03),
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
                          filled: false,
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
    dateController.text="${value!.year}-${value.month}-${value.day}";
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 3,
                            )
                          ),
                          labelText: 'date de fin de contrat',
                          hintText: 'date de fin de contrat',
                          filled: false,
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
                         
                         });},)
                        ),
                      ),
                      ),
                   
      Container( 
                  height: 200,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton.icon(
                      onPressed: (){
                        Employee newEmployee=Employee(nom:nomController.text, email: emailController.text,numTel: telController.text,poste: postController.text,salaire:int.parse(sallaireController.text ),numCompte: numconteController.text,dataNaissance:dateController.text,adresse: nomController.text,statut: true);
                                
                       EmploiyerController.addEmploiye(newEmployee).then((yt) {
                    
                          
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
                  ),
                  ),
                    ]
                    )
                    )
                    )
                    )
                    );
 }
}

         
       
     
       
    
       
     
     
     
   

     
    
 