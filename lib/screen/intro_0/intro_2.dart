import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro2 extends StatefulWidget {
  const Intro2({Key? key}) : super(key: key);

  @override
  State<Intro2> createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.cyanAccent,body:  Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('lib/assets/Animation - 1696607435133.json'),
        ],
      ),
    ),);
  }
}
