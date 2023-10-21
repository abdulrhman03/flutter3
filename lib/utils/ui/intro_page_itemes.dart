import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class IntroPageItem extends StatelessWidget {
  final String image;
  final String title;
  final double fonts;
  const IntroPageItem({Key? key,required this.image,required this.title,required this.fonts}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(borderRadius:BorderRadius.only(bottomLeft:Radius.circular(50),bottomRight: Radius.circular(50)),child: Container(child: Image.asset(image,height:150,width: 90.w,fit: BoxFit.cover),width: 100.w,height: 500,)),
        SizedBox(height: 5,)
        ,Text(title,style:TextStyle(fontFamily: GoogleFonts.akronim().fontFamily,fontSize:fonts),)
      ],
    );
  }
}
