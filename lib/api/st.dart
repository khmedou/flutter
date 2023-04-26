import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/st.dart';
class stController  {
  
  static Future<st> fetchst() async {

    final response = await http.get(
      Uri.parse('http://192.168.47.112:8000/rest/st/'), 
    );

    if (response.statusCode == 200) {
      // dynamic responseJson = json.decode(utf8.decode(response.bodyBytes));
     // var sts = (responseJson).map((e) => st.fromJson(e)).toList();

      return st.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return st();
    }
  }
}