
import 'package:chattpot/MODEL.dart';
import 'package:chattpot/NAV1.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart' as lo;
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';


class SplashScrean extends StatefulWidget {
  @override
  _SplashScreanState createState() => _SplashScreanState();
}

class _SplashScreanState extends State<SplashScrean> {

  @override
  bool servise;
  Future Getlocationper() async {


    servise = await Geolocator.isLocationServiceEnabled();
    if (servise == false) {
      dialogs(
          click: false,
          F: () async {
            Navigator.pop(context);
            await Future.delayed(Duration(seconds: 2), await Getlocationper());
          },
          context: context,
          C: 'Turn Location Services on,Please ',
          t: 'Warning!',
          a: 'OK');
    } else if (await Geolocator.checkPermission() == false) {
      print(await Geolocator.checkPermission());
      Geolocator.requestPermission();
      print('ddddddddddddddddddddddddddddddddd');
    } else if (await Geolocator.checkPermission() == true) {
      Geolocator.requestPermission();
      print('ccccccccccccccccccccccccccccc');
    }else{
      Future.delayed(
          Duration(seconds: 4),
              () =>
              Navigator.of(context, rootNavigator: false).pushReplacement(
                MaterialPageRoute(
                    builder: (context) =>HomePage()
                ),
              ));
    }
  }
  void initState() {
    Getlocationper().then((value){


    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 300,top:100),
          child: Center(child:  Column(
            children: [
              Container(
                  width:300,

                  child:lo.Lottie.asset('images/robot.json',
                      height: hight / 3,
                      width: width,
                      fit: BoxFit.fill),),
              SizedBox(height: 30,),
              Text("Chat Bot", style: TextStyle(fontSize: 40),)
            ],
          ),),
        ));
  }
}
