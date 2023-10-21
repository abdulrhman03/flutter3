import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p2/utils/ui/texts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import 'package:google_fonts/google_fonts.dart';

class CommonViews{
  static final CommonViews _shared=CommonViews._private();
  factory CommonViews()=> _shared;
  CommonViews._private();

  AppBar getAppBar({required String title, String? imageActions, String? imageLeading,BuildContext? Context}){
    return AppBar(backgroundColor: Colors.red,centerTitle: true,
      title: Title(color: Colors.white, child: Text(title,style:TextStyle(fontSize:24,fontWeight: FontWeight.w500,letterSpacing: 0.48,fontFamily: GoogleFonts.faustina().fontFamily ),)),


    );
  }
  Widget CreatTextForm({required TextEditingController controller,String?prefixText,
    required FocusNode focusNode,Widget? suffixIcon,required String label,TextInputType KeyboardType=TextInputType.text,TextInputAction InputAction=TextInputAction.done,bool ObscureText=false,String ? errorText}){
    return TextFormField(controller: controller,focusNode: focusNode,
      decoration: InputDecoration(labelText: label,prefixText: prefixText,suffixIcon: suffixIcon,errorText: errorText,
          border: _getBorder(),enabledBorder: _getBorder(),disabledBorder: _getBorder(),focusedBorder: _getBorder()),
keyboardType:KeyboardType ,textInputAction:InputAction ,obscureText: ObscureText,
    );

  }

  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
            borderRadius:BorderRadius.circular(6),
            borderSide: BorderSide(
                color:Colors.black87   ));
  }
  Widget createButton(
      {required String title, required VoidCallback onPressed}) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor:Colors.black54),
        child: Textss(
          title: title,
          textColor: Colors.white,
        ));
  }

  void showSnackBar(String title, String msg) {
    Get.snackbar(title, msg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        duration: Duration(seconds: 5));
  }

  Widget createTextFormField(
      {required TextEditingController controller,
        required FocusNode focusNode,
        required String label,
        TextInputType keyboardType = TextInputType.text,
        TextInputAction inputAction = TextInputAction.done,
        ValueChanged<String>? onSubmitted,
        String? prefixText,
        String? hint,
        Widget? suffixIcon,
        String? errorText,
        FormFieldValidator<String>? validator,
        bool isObscure = false}) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: inputAction,
      obscureText: isObscure,
      autovalidateMode: AutovalidateMode.always,
      validator: (v) {
        if (validator != null) return validator!.call(v.toString());
      },
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        labelStyle:
        const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        hintText: hint,
        // prefixText: prefixText,
        prefix: Text(prefixText ?? ''),
        suffixIcon: suffixIcon,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        // prefixIcon: Text(prefixText??''),
        border: _getBorder(),
        enabledBorder: _getBorder(),
        disabledBorder: _getBorder(),
        focusedBorder: _getBorder(),
      ),
    );
  }

}


