import 'package:flutter/material.dart';
import 'package:flutter_p2/utils/ui/texts.dart';
import 'package:sizer/sizer.dart';

import 'home11.dart';
import 'home_1.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(    bottomNavigationBar: Container(

        child: Container(decoration: BoxDecoration(color: Colors.cyan.shade100),
         height: 70,width:414,child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children:  [
          InkWell(child: Textss(title: "Home"),onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
          }),
          InkWell(child:Textss(title: "Setting"),onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Setting()));
          }),
          InkWell(child: Textss(title: "Profile"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen11()));
              }

          )],)
        ))
      ,body:
      Container(height: 100.h,width: 100.w,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/blue-fluid-background-frame_53876-99019.jpg"),fit: BoxFit.cover)),
        child: Column(children: [

        SizedBox(height:60,),Row(mainAxisAlignment: MainAxisAlignment.center,children: [Textss(title: "Settings")],),SizedBox(height:70,)
        ,ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
          child: Container(

            color: Colors.cyan.shade700,
            child: Column(
              children: [SizedBox(height: 20,),
                Row(children: [Textss(title: "general",fontSize: 15),],),
   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Row(children: [Icon(Icons.person),SizedBox(width: 20,),Textss(title: "Arithmetic")],),Icon(Icons.arrow_forward_ios_outlined)],),SizedBox(height: 20,)
   ,Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Row(children: [Icon(Icons.lock),SizedBox(width: 20,),Textss(title: "change password")],),Icon(Icons.arrow_forward_ios_outlined)],),SizedBox(height: 20,)
   ,Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Row(children: [Icon(Icons.call),SizedBox(width: 20,),Textss(title: "call us")],),Icon(Icons.arrow_forward_ios_outlined)],),SizedBox(height:100,)
                  ,Row(children: [Textss(title: "Other",fontSize: 15),],)
   ,Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Row(children: [Icon(Icons.error),SizedBox(width: 20,),Textss(title: "who are we")],),Icon(Icons.arrow_forward_ios_outlined)],),SizedBox(height:16,)
   ,Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Row(children: [Icon(Icons.indeterminate_check_box),SizedBox(width: 20,),Textss(title: "Terms and Conditions")],),Icon(Icons.arrow_forward_ios_outlined)],),SizedBox(height:16,)
   ,Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Row(children: [Icon(Icons.privacy_tip),SizedBox(width: 20,),Textss(title: "privacy policy")],),Icon(Icons.arrow_forward_ios_outlined)],),SizedBox(height:31,),SizedBox(height:119,)],),
          ),
        ),
    ],),
      ),);
  }
}
