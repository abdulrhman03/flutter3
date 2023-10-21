import 'package:flutter/material.dart';
import 'package:flutter_p2/utils/ui/texts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Intro1 extends StatefulWidget {
  const Intro1({Key? key}) : super(key: key);

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.cyanAccent,body: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [ Column(
        children: [
          Lottie.asset('lib/assets/intro2.json'),
        ],
      ),
        Center(child: Text( "Hello",style: TextStyle(fontSize: 59,fontFamily: GoogleFonts.aclonica().fontFamily))),
      ],
    ),);
  }
}
