import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p2/screen/home/home_1.dart';
import 'package:flutter_p2/screen/home/profile.dart';
import 'package:flutter_p2/screen/home/setting.dart';

import 'package:flutter_p2/utils/ui/texts.dart';

import 'home11.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( bottomNavigationBar: Container(

      child: Container(
          color: Colors.white,height: 70,width:414,child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children:  [
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
      ),

    ));
  }
}
