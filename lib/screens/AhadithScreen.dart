
import 'package:alnawawiforty/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../botombar.dart';
import '../db/mydata.dart';
import '../model/hadithe.dart';
import '../utils/Strings.dart';

class AhadithScreen extends StatefulWidget {
  @override
  State<AhadithScreen> createState() => _AhadithScreenState();
}

class _AhadithScreenState extends State<AhadithScreen> {


  Widget ayah(String key, name) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/img.png"),
        SvgPicture.asset("assets/svg/grey.svg"),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(key,style: TextStyle(fontSize: 16,color: colorApp.offWhite2),),
            Text(name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: colorApp.offWhite),textScaleFactor: .5,),
          ],
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          Expanded(
            child:Stack (
            children: [
              SvgPicture.asset("assets/svg/background.svg",width: double.infinity,fit: BoxFit.cover,),
              Column(
                children: [
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(""),
                      SvgPicture.asset(""),
                      SvgPicture.asset("assets/svg/arrow-right.svg"),
                    ],
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextApp.topHomeScreen,
                      TextApp.headerHomeScreen,

                    ],
                  ),
                ],
              ),
            ],
          ),flex: 1,),

          Expanded(child:  Stack  (
            children: [
              SvgPicture.asset("assets/svg/background.svg",width: double.infinity,fit: BoxFit.cover,),
              FutureBuilder(

                //we call the method, which is in the folder db file database.dart
                  future: Mydata.getAlldata(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Hadith item = snapshot.data[index];
                          //delete one register for id
                          return GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeHadith(hadith: item,)));
                              },
                              child: ayah(item.key, item.nameHadith));
                        },
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          mainAxisSpacing: 20,
                          childAspectRatio: 3/2,),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),flex: 3,),
        ],
      ),



    );
  }
}
