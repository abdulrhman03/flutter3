import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p2/screen/intro_0/intro_1.dart';
import 'package:flutter_p2/screen/intro_0/intro_2.dart';
import 'package:flutter_p2/screen/intro_0/intro_3.dart';

import 'package:flutter_p2/utils/ui/texts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login/login6.dart';



class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  bool inLastbage=false;
 PageController _controller= PageController();
  Widget build(BuildContext context) {
    return Scaffold(body:
    Stack(

      children: [
        PageView(
 controller: _controller,
        onPageChanged: (index){
   setState(() {
     inLastbage=(index==2);
   });
        },
        children: [
   Intro1(),
   Intro2(),
   Intro3(),
        ],
      ),

     Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         InkWell(child: Text("Skip",style: TextStyle(fontSize: 20)),onTap:(){
           _controller.jumpToPage(2);
         },),
         SmoothPageIndicator(controller: _controller, count: 3)
         ,inLastbage?InkWell(child:

         Text("Done",style: TextStyle(fontSize: 20)),onTap:() {
           _saveData();
           Get.to(LoginScreen());
         }):InkWell(child:

         Text("Next",style: TextStyle(fontSize: 20)),onTap:() {
           _controller.nextPage(
               duration: Duration(microseconds: 300), curve: Curves.ease);
         }),
       ],
     ),alignment: Alignment(0, 1),margin: EdgeInsets.all(20),) ],
    ),);
  }
  void _saveData()async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("introenterd", true);
  }
}
