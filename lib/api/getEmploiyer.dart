import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/Emploiyer.dart';
import 'package:get/get.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class EmploiyerController {
  static Future<List<Employee>> fetchEmploiyer() async {

    final response = await http.get(
      Uri.parse('http://192.168.47.112:8000/rest/detail/'), 
    );

    if (response.statusCode == 200) {
      List<dynamic> responseJson = json.decode(utf8.decode(response.bodyBytes));
      var emploiyes = (responseJson).map((e) => Employee.fromJson(e)).toList();

      return emploiyes;
    } else {
      return <Employee>[];
    }
  }
   
  
    static Future<bool> addEmploiye(Employee newEmployee,File? image) async {
 var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.47.112:8000/rest/detail/'));
    request.files.add(http.MultipartFile.fromBytes(
        'photo', image!.readAsBytesSync(),
        filename: 'YourFilename.png'));
         request.fields["pk"] = "1";
   request.fields[ "nom"] = newEmployee.nom!;
    request.fields["adresse"] = newEmployee.adresse!;
    request.fields["num_tel"] =newEmployee.numTel!;
   request.fields[ "Email"] = newEmployee.email!;
    request.fields["poste"] = newEmployee.poste!;
   request.fields[ "num_compte"] = newEmployee.numCompte!;
    request.fields["data_naissance"] = newEmployee.dataNaissance!;
    request.fields["salaire"] = newEmployee.salaire!.toString();
    request.fields["statut"] =newEmployee.statut.toString();


    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body);

     if (201 == response.statusCode) {
    print(responseData);
//Get.snackbar('title', 'add secsse',colorText: Colors.green,);
                         
                      
                        
                        
      return true;
    } else {
      print(responseData);
    // Get.snackbar('title', 'add error',colorText: Colors.red,);
      return false;
    }

  }
  static Future<bool> editEmploiye(Employee newEmployee,File? image) async {
 var request = http.MultipartRequest(
        'PUT', Uri.parse('http://192.168.47.112:8000/rest/GPD_emp/${newEmployee.pk}'));
    request.files.add(http.MultipartFile.fromBytes(
        'photo', image!.readAsBytesSync(),
        filename: 'YourFilename.png'));
         request.fields["pk"] = "1";
   request.fields[ "nom"] = newEmployee.nom!;
    request.fields["adresse"] = newEmployee.adresse!;
    request.fields["num_tel"] =newEmployee.numTel!;
   request.fields[ "Email"] = newEmployee.email!;
    request.fields["poste"] = newEmployee.poste!;
   request.fields[ "num_compte"] = newEmployee.numCompte!;
    request.fields["data_naissance"] = newEmployee.dataNaissance!;
    request.fields["salaire"] = newEmployee.salaire!.toString();
    request.fields["statut"] =newEmployee.statut.toString();


    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    final responseData = json.decode(responsed.body);

     if (200 == response.statusCode) {
    print(responseData);
//Get.snackbar('title', 'add secsse',colorText: Colors.green,);
                         
                      
                        
                        
      return true;
    } else {
      print(responseData);
    // Get.snackbar('title', 'add error',colorText: Colors.red,);
      return false;
    }

  }
 static Future<bool> delteEmploiyer(int pk) async {
  print(pk);
  final http.Response  response = await http.delete(
  Uri.parse('http://192.168.47.112:8000/rest/GPD_emp/$pk'),
  
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
