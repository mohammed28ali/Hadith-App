import 'package:alnawawiforty/model/hadithe.dart';
import 'package:flutter/material.dart';
import './networking_page_content.dart';

class NetworkingPage extends StatelessWidget {

  final Hadith hadith;
  final String data;
  NetworkingPage( {this.hadith,this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          NetworkingPageContent(data: data,),
        ],
      ),

    );
  }
}