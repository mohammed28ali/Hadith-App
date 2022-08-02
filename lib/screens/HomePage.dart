import 'package:alnawawiforty/utils/Strings.dart';
import 'package:alnawawiforty/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AhadithScreen.dart';
import 'AudioAhadith.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          SvgPicture.asset("assets/svg/background.svg",width: double.infinity,fit: BoxFit.cover,),
          Column(
            children: [
              SizedBox(height: 100,),
              SvgPicture.asset(""),
              Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextApp.topHomeScreen,
                  TextApp.headerHomeScreen,
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AhadithScreen()));
                      },
                      child: myCard(colorApp.blue1, colorApp.blue2,"اَلْأَحَادِيث","assets/quran.png",'assets/svg/one.svg')),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AudioAhadithScreen()));
                      },
                      child: myCard(colorApp.purple, colorApp.red2,"اَلِاسْتِمَاع لِلْأَحَادِيث","assets/play.png",'assets/svg/twoo.svg')),
                  myCard(colorApp.red1, colorApp.red2, "اَلْأَحَادِيث اَلْمَحْفُوظَة", "assets/save-instagram.png", "assets/svg/three.svg")
                ],
              ),
            ],
          )
        ],
      )
    );
  }
}

Widget myCard (Color color1,color2,String text,path1,path2,){
  return Padding(
    padding: const EdgeInsets.only(left: 20,right: 20,top: 48),
    child: Container(

      height: 117,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(10, 10),
            blurRadius: 40

          )
        ],
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(colors: [
          color1,
          color2,
        ],begin: AlignmentDirectional.topEnd,end: AlignmentDirectional.bottomStart

        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(path1),
          Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
          )),
          SvgPicture.asset(path2)
        ],
      )
    ),
  );
}
