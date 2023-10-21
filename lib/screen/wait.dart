import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p2/screen/home/home.dart';
import 'package:flutter_p2/screen/home/home_1.dart';


import 'login/login6.dart';

class Wait extends StatefulWidget {
  const Wait({Key? key}) : super(key: key);

  @override
  State<Wait> createState() => _WaitState();
}

class _WaitState extends State<Wait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
       builder:((context,snapshot) {
     if(snapshot.hasData){
       return Home();
    }
     else return LoginScreen();
    }
      )
      ) );
  }
}
