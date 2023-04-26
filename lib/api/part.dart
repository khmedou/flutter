import '../models/Part.dart';
import 'dart:convert';


import 'package:http/http.dart' as http;
class PartController {
  static Future<List<Part>> fetchPart(int pk) async {
    final response = await http.get(
      Uri.parse('http://192.168.47.112:8000/rest/cree_candidat/$pk'), 
    );

    if (response.statusCode == 200) {
      List<dynamic> responseJson = json.decode(utf8.decode(response.bodyBytes));
      var Parts = (responseJson).map((e) => Part.fromJson(e)).toList();
      return Parts;
    } else {
      return <Part>[];
    }
  }}
  