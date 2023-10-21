
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p2/screen/home/edit.dart';
import 'package:flutter_p2/screen/home/setting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../screen/config/curent.dart';
import '../../utils/ui/common_views.dart';


import '../../utils/ui/texts.dart';
import 'home_1.dart';
class HomeScreen11 extends StatefulWidget {
  const HomeScreen11({Key? key}) : super(key: key);

  @override
  State<HomeScreen11> createState() => _HomeScreen11State();
}

class _HomeScreen11State extends State<HomeScreen11> {
  // final users=FirebaseAuth.instance.currentUser!;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(

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
          )),

      body: Center(
          child: Container(height: 100.h,width:100.w,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("lib/assets/blue-fluid-background-frame_53876-99019.jpg"),fit: BoxFit.cover)),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundImage: NetworkImage(
                      CurrentSession().user!.photoURL!
                    ),
                    radius: 80),
                // Text("email :   " + users.email!,style: TextStyle(fontSize: 20,color: Colors.black),),
                // Text("uid:   " + users.uid!,style: TextStyle(fontSize: 20,color: Colors.black),),
Textss(title: "email :  " + CurrentSession().user!.email),
Textss(title: "uid:  " + CurrentSession().user!.uid!,fontSize: 15),
Textss(title: "name is:   " + CurrentSession().user!.displayName,),
Textss(title: "phone  is:   " + CurrentSession().user!.phoneNumber!),
                // Text("email :  " + CurrentSession().user!.email,style: TextStyle(fontSize: 20,color: Colors.black),),
                    SizedBox(height: 40,),
                ElevatedButton(child: Text("Edit  " ,style: TextStyle(fontSize: 20,color: Colors.black),),onPressed: (){
                Get.to(()=>EditPage());
                },),


              ],
            ),
          )),
    );
  }





}