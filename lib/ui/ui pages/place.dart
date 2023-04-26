import 'package:flutter/material.dart';
import 'package:flutter_application_3/ui/ui%20pages/part.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

import '../../api/getEmploiyer.dart';
import '../../api/place.dart';
import '../../main.dart';
import '../../models/Part.dart';
import '../../models/place.dart';
import 'Ajouterplace.dart';

class Place extends StatefulWidget{
  const Place({super.key});
  
  

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
   bool isLoading = true;
  List<Placee> Places = [];

  _loadData() async {
    PlaceController.fetchEmploiyer().then((Placeds) {
      
       
      setState(() {
        Places = Placeds;
        isLoading = false;
      });
    });
  }
  
@override
     void initState() {
    _loadData();

    super.initState();
  }
  Dialoge(BuildContext context) async {
    return showDialog(
      
        context: context,
        builder: (BuildContext context) {
          return const Ajouterplace();
        });
  }
  app(BuildContext context,Placee pl) async {
    return showDialog(
      
        context: context,
        builder: (BuildContext context) {
         
          return Partt(pk: pl.pk!);
        });
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
                      
                     Padding(
                       
                       padding: EdgeInsets.fromLTRB(0, 0, 0, 0),child: 
                  
                     Container( 
                     alignment: Alignment.topRight,
                    
                    
                    child:    
                    
                           
                       
                     IconButton(icon:Icon(Icons.queue,color: Colors.green,size: 30,),onPressed: (){Dialoge(context);}, ),
                     
                      
                     )
                   
                   
                    ),
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
                                          IconButton(icon:Icon(Icons.people,color: Colors.purple,size: 30,), onPressed: () { app(context,Places[index]);},),
                                          
                                            
                             
                  title:Text('Nom: ${Places[index].place}',style: TextStyle(
                  color:Colors.black,
                  fontSize: 15,),),
                  subtitle: Text('diplome: ${Places[index].diplomeA}',style: TextStyle(
                  color:Colors.black,
                  fontSize: 15,),),
                   
                   children: [
                              Text('                    nombre place: ${Places[index].nbrePlace}',style: TextStyle(
                  color:Colors.black,
                  fontSize: 15,),),            
                                       
                                      Text('                    Exprience: ${Places[index].exprenceA}',style: TextStyle(
                   color:Colors.black,
                   fontSize: 15,),
                   textAlign: TextAlign.center,
                  
                  
                  ),  
                                      Text('                   comptence 1: ${Places[index].comptence1}',style: TextStyle(
                   color:Colors.black,
                   fontSize: 15,),
                   textAlign: TextAlign.center,
                  
                  
                  ),
                    Text('                   comptence 2: ${Places[index].comptence2}',style: TextStyle(
                   color:Colors.black,
                   fontSize: 15,),
                   textAlign: TextAlign.center,
                  
                  
                  ),
                    Text('                   comptence 3: ${Places[index].comptence3}',style: TextStyle(
                   color:Colors.black,
                   fontSize: 15,),
                   textAlign: TextAlign.center,
                  
                  
                  ),
                  
                  Container( 
                   
                    alignment: Alignment.topLeft,
                   padding: EdgeInsets.all(10),
                    child:
                      
                     IconButton(icon :const Icon(Icons.delete_forever,color: Colors.red,size: 30,),onPressed: () async{
                       await PlaceController.delte(Places[index].pk!).then((yt) {
                    
                          
 yt
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                          backgroundColor: Colors.green,
                                          duration: Duration(seconds: 3),
                                          content: Text("place supprime",
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
                    },), ),
                      
                        
                    
                                        ],
                                        
                                       )  ),
                                   ],
                                 );
            },
            itemCount: Places.length,
                     
                   
             
                    
                    ),
                  ],
                ),
        );
            
       
     
      
  }
  
  
} 
    
      
      
     

      
    
 