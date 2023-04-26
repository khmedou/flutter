// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/models/Emploiyer.dart';
import 'package:flutter_application_3/ui/ui%20pages/Edit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/ui/ui%20pages/Ajouter.page.dart';
import 'package:flutter_application_3/ui/ui%20pages/text.dart';

import '../../api/getEmploiyer.dart';

 
class Employerpage extends StatefulWidget{
  const Employerpage({super.key});
  
  

  @override
  State<Employerpage> createState() => _EmployerpageState();
}





class _EmployerpageState extends State<Employerpage> {
   bool isLoading = true;
  List<Employee> employes = [];

  _loadData() async {
    EmploiyerController.fetchEmploiyer().then((employeds) {
      
       
      setState(() {
        employes = employeds;
        isLoading = false;
      });
    });
  }
  
   appbarDialoge(BuildContext context) async {
    return showDialog(
      
        context: context,
        builder: (BuildContext context) {
          return const Ajouterpage();
        });}
    
  edit(BuildContext context,Employee emploiye) async {
    return showDialog(
      
        context: context,
        builder: (BuildContext context) {
          return  Edit(emploiyer: emploiye,);
        });}
   @override
     void initState() {
    _loadData();

    super.initState();
  }

       
  @override
  Widget build(BuildContext context) {
    
   
    

    return  
            
         
        RefreshIndicator(
        onRefresh: () => _loadData(),

          child: Column(
            
                
                  children: [
                    
                    
                    
                     
                     Padding(
                       
                       padding: EdgeInsets.fromLTRB(16, 8, 200, 8),
                       child: TextField(
                  
                    
                    decoration:InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1),borderRadius: BorderRadius.circular(15),gapPadding: 2.0,),
                        hintText: "chercher", 
                      suffixIcon:  Icon(Icons.search),
                      
              
                    ),
                    ),
                  
          
                     ),
                     isLoading?CircularProgressIndicator():
                    ListView.builder(
                         shrinkWrap:true,
                           controller: ScrollController(),
                      itemBuilder: (context, index) {
        
                             return  
                              
                                 Column(
                                   children: [
                                     Card(
                                      color: Colors.white,
                                      elevation:2,
                   
                    
                        
                 
                                       child: ExpansionTile(
                                        
                                        iconColor: Colors.green,
                                        collapsedIconColor: Colors.green,
                                        childrenPadding: 
                                        EdgeInsets.all(8),
                              expandedAlignment: Alignment.topLeft,        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                       textColor: Colors.black,
                                         
                  
                     
                      
                                        leading: 
                                       (employes[index].photo==null)?
                                        CircleAvatar(
                                          radius: 20,
                                          
                                         backgroundImage:AssetImage('assets/image.jpeg'))
                                         :CircleAvatar(
                                          radius: 20,
                                          
                                         backgroundImage:NetworkImage('http://192.168.100.112:8000/'+employes[index].photo),
                              ),
                                        title: Text('Nom: ${employes[index].nom}',style: TextStyle(
                  color:Colors.black,
                  fontSize: 15,),),
                                        
                               
                                       
                                        subtitle: (employes[index].statut == "true")?
                                         Align(
                                           alignment: Alignment.topLeft,
                                            child:Icon(Icons.lens,color: Colors.green.shade100,))
                                          : Align(
                                           alignment: Alignment.topLeft,
                                            child:Icon(Icons.lens,color: Colors.green,)),
              
                                        children: [
                                      Text('               Tel: ${employes[index].numTel}',style: TextStyle(
                  color:Colors.black,
                  fontSize: 15,),),  
                                       
                                      Text('                Email: ${employes[index].email}',style: TextStyle(
                   color:Colors.black,
                   fontSize: 15,),
                   textAlign: TextAlign.center,
                  
                  
                  ), 
                
                                      Text('                poste: ${employes[index].poste}',style: TextStyle(
                  color:Colors.black,
                  fontSize: 15,
                  
                  ),),
                                      Text('                Salaire : ${employes[index].salaire}',
                                      style: TextStyle(
                  color:Colors.black,
                  fontSize: 15,
                
                  ),
                                      ),
 Text('                date debut de contrat : ${employes[index].numCompte}',
                                      style: TextStyle(
                  color:Colors.black,
                  fontSize: 15,
                
                  ),
                                      ),
                                 Text('                 date debut de contrat : ${employes[index].dataNaissance}',
                                      style: TextStyle(
                  color:Colors.black,
                  fontSize: 15,
                
                  ),
                                      ),         
                                               
                                              
        
                                
         
                        Row(
                          children: [
                            Container( 
                    
                    
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(10),
                    
                    child:                  
                                         
                   IconButton(icon:Icon(Icons.edit,color: Colors.green,size: 30,),onPressed: () => edit(context,employes[index]),), ),
                         
                   
                      
                    
                    Container( 
                   
                    alignment: Alignment.topLeft,
                   padding: EdgeInsets.all(10),
                    child:
                      
                     IconButton(icon :const Icon(Icons.delete_forever,color: Colors.red,size: 30,),onPressed: () async{
                       await EmploiyerController.delteEmploiyer(employes[index].pk!).then((yt) {
                    
                          
 yt
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                          backgroundColor: Colors.green,
                                          duration: Duration(seconds: 3),
                                          content: Text("Employee supprime",
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
                                        Get.to(testpage());
                              });
                    },), ),   ],
                        ),
                      
                        
                    
                                        ],
                                        
                                       )  ),
                                   ],
                                 );
            },
            itemCount: employes.length,
                     
                   
             
                    
                    ),
                  ],
                ),
        );
            
       
     
      
  }
  
  
} 
    
      
      
     

      
    
 