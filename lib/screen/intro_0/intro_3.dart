import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro3 extends StatefulWidget {
  const Intro3({Key? key}) : super(key: key);

  @override
  State<Intro3> createState() => _Intro3State();
}

class _Intro3State extends State<Intro3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.cyanAccent,body:  Column(
      children: [
        Lottie.asset('lib/assets/intro3.json'),
      ],
    ),);
  }
}
