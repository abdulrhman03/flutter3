
import 'package:flutter/material.dart';
import 'package:flutter_p2/screen/home/setting.dart';
import 'package:sizer/sizer.dart';

import '../../screen/config/curent.dart';
import '../../utils/ui/common_views.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../utils/ui/texts.dart';
import 'home11.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bpm = 0;
  int glocuse = 0;
  int insulin = 0;

  @override
  void initState() {
    readFromDatabase();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
        bottomNavigationBar:

         Container(decoration: BoxDecoration(color: Colors.cyan.shade100)
       , height: 70,width:414,child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children:  [
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

          body: Container(height:100.h ,width:100.w ,
            decoration:BoxDecoration(
        image: DecorationImage(image:  AssetImage("lib/assets/blue-fluid-background-frame_53876-99019.jpg"),fit: BoxFit.cover),),
        child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("BMP : $bpm",style: TextStyle(fontSize: 30,color: Colors.black),),
                Text("glocuse : $glocuse",style: TextStyle(fontSize: 30,color: Colors.black)),
                Text("insulin : $insulin",style: TextStyle(fontSize: 30,color: Colors.black))
              ],
            )),
      ),
    );
  }
//
  void writeToFirebase() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("fip5");
    ref.set({
      "BPM": 20,
      "glocuse": 10,
      "insulin": 100,

    });
  }

  void readFromDatabase() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("fip5");
    var data = await ref.get();
    if (data.exists) {
      Map<dynamic, dynamic> myData = data.value as Map<dynamic, dynamic>;
      _fillData(myData);
      ref.onValue.listen((event) {
        _fillData(event.snapshot.value as Map<dynamic, dynamic>);
      });
    }
  }

  void _fillData(Map<dynamic, dynamic> myData) {
    if (myData["BPM"] != null) bpm = myData["BPM"];
    if (myData["glocuse"] != null) glocuse = myData["glocuse"];
    if (myData["insulin"] != null) insulin = myData["insulin"];
    setState(() {});
  }
}