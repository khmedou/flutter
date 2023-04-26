import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
Widget text1({required String name}) {
  return  Padding(
                padding: const EdgeInsets.all(10),
                child: Text(name, 
                 style: TextStyle(
                  color:Colors.teal,
                  fontSize: 10,
                  fontWeight: FontWeight.bold
                  ),
                  ),
              );
  
}