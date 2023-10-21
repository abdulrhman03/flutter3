import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p2/screen/wait.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';


import '../utils/helpers/navigater.dart';
import 'intro_0/intro.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _navigate();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue,
    body: Container(
      child:
      Center(child:
      Container(margin:const EdgeInsets.only(bottom: 90,left: 90),
       child:
      Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Lottie.asset('lib/assets/splash.json'),
            ],
          ),
        ],
      ),
    ),
    ),),

    );
  }
  void _navigate (){
    Timer(const Duration(seconds: 4),()async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isIntroenterdBefor = prefs.getBool("introenterd")??false;
      GoNavigator.of(context).pushReplacement(isIntroenterdBefor ?const Wait():const Intro());

//LoginScreen



    });

  }
}
