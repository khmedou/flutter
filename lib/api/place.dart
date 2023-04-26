import 'dart:convert';

import 'package:flutter_application_3/models/place.dart';
import 'package:http/http.dart' as http;
class PlaceController {
  static Future<List<Placee>> fetchEmploiyer() async {

    final response = await http.get(
      Uri.parse('http://192.168.47.112:8000/rest/detail_place/'), 
    );

    if (response.statusCode == 200) {
      List<dynamic> responseJson = json.decode(utf8.decode(response.bodyBytes));
      var Places = (responseJson).map((e) => Placee.fromJson(e)).toList();
      return Places;
    } else {
      return <Placee>[];
    }
  }
  static Future<bool> addplace(Placee newplace) async {

    final response = await http.post(
        Uri.parse('http://192.168.47.112:8000/rest/detail_place/'),  
        body: jsonEncode({
            
    "pk": 1,
    "place":newplace.place,
    "nbre_place":newplace.nbrePlace,
    "diplome_A":newplace.diplomeA,
    "exprence_A":newplace.exprenceA,
    "comptence_1":newplace.comptence1,
    "comptence_2":newplace.comptence2,
    "comptence_3":newplace.comptence3
    
        }),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
         
        });

    if (201 == response.statusCode) {
    print(newplace.comptence3);
//Get.snackbar('title', 'add secsse',colorText: Colors.green,);
                         
                      
                        
                        
      return true;
    } else {
      print(response.body);
    // Get.snackbar('title', 'add error',colorText: Colors.red,);
      return false;
    }
  }
  static Future<bool> delte(int pk) async {
  print(pk);
  final http.Response  response = await http.delete(
  Uri.parse('http://192.168.47.112:8000/rest/delete/$pk'),
  
  );
  if (response.statusCode ==204) {
    print(response.statusCode);
   // print("deleted");
return true;

  }
  else {
     print(response.body);
    return false;
   // throw "prd!";
  }
   
}
  }