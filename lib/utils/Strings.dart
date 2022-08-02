
import 'package:flutter/material.dart';

abstract class TextApp {

  static const Text topHomeScreen=const Text("حــــَدِيــــــث ",textDirection: TextDirection.ltr
    ,style: TextStyle(color: Color(0xff232b63),fontWeight: FontWeight.w900,fontSize: 30, ),);

  static const Text headerHomeScreen=const Text("لحفظ وسماع الأحاديث "
    ,style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 30),);


  static const Text bookOneScreen=const Text("اَلْأَحَادِيثُ");
  static const Text bookTwoScreen=const Text("اَلِاسْتِمَاع لِلْأَحَادِيثِ");
  static const Text bookThreeScreen=const Text("اَلْأَحَادِيث اَلْمَحْفُوظَةِ");
}