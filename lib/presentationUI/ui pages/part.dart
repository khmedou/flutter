import 'package:flutter/material.dart';
import 'package:flutter_application_3/api/part.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:get/get.dart';
import '../../models/Part.dart';

class Partt extends StatefulWidget{
  int pk;
   Partt({required this.pk,super.key});
  
  

  @override
  State<Partt> createState() => _ParttState();
}

class _ParttState extends State<Partt> {
  int currentIndex = 0;
   bool isLoading = true;
  List<Part> Parts = [];

  _loadData(int pk) async {
    PartController.fetchPart(pk).then((Partd) {
      
       
      setState(() {
        Parts = Partd;
        isLoading = false;
      });
    });
  }
  
@override
     void initState() {
    _loadData(widget.pk);

    super.initState();
  }
 @override
  Widget build(BuildContext context) {
    
   Size size = MediaQuery.of(context).size;
   

    return  
       
       AlertDialog(
      insetPadding: const EdgeInsets.all(40),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(20))),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('les candidats',
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

         
            
                
                  child: 
                    
                    
                    
                     
                    
                     
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
                                          IconButton(icon:Icon(Icons.people,color: Colors.green,size: 30,), onPressed: () {  },),
                                          
                                            
                             
                  title:Text('Nom: ${Parts[index].nom}',style: TextStyle(
                  color:Colors.black,
                  fontSize: 15,),),
                  subtitle: Text('Email: ${Parts[index].email}',style: TextStyle(
                  color:Colors.black,
                  fontSize: 15,),),
                   
                   children: [
                              Text('                    tel: ${Parts[index].nbreTel}',style: TextStyle(
                  color:Colors.black,
                  fontSize: 15,),),            
                                       
                                      Text('                    Exprience: ${Parts[index].exprenceC}',style: TextStyle(
                   color:Colors.black,
                   fontSize: 15,),
                   textAlign: TextAlign.center,
                  
                  
                  ),  
                                      Text('                   diplome: ${Parts[index].diplome}',style: TextStyle(
                   color:Colors.black,
                   fontSize: 15,),
                   textAlign: TextAlign.center,
                  
                  
                  ),
                    Text('                   comptence : ${Parts[index].comptence}',style: TextStyle(
                   color:Colors.black,
                   fontSize: 15,),
                   textAlign: TextAlign.center,
                  
                  
                  ),
                   
                  
                  
                      
                        
                    
                                        ],
                                        
                                       )  ),
                                   ],
                                 );
            },
            itemCount: Parts.length,
                     
                   
             
                    
                    ),
                 
                ),
        ));
            
       
     
      
  }
  
  
} 
    
      
      
     

      
    
 