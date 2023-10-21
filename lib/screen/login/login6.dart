
import 'package:flutter/material.dart';
import 'package:flutter_p2/utils/helpers/navigater.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ui/common_views.dart';
import '../config/firebase_errors/app_con.dart';


import '../register/reg6.dart';

import 'login8.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _mobileFocus = FocusNode();
  bool _isPasswordObscure = true;
  LoginController controller = Get.put(LoginController());

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Obx(
                () => CommonViews().createTextFormField(
                controller: _emailController,
                focusNode: _emailFocus,
                label: "Email",
                errorText: controller.emailError.value.isEmpty
                    ? null
                    : controller.emailError.value,
                onSubmitted: (v) {
                  setState(() {});
                  _passwordFocus.requestFocus();
                },
                inputAction: TextInputAction.next),
          ),
          const SizedBox(
            height: AppConstants.textFieldSpacing,
          )
    ,SizedBox(height: 30,), Obx(
                () => CommonViews().createTextFormField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                label: "Password",
                errorText: controller.emailError.value.isEmpty
                    ? null
                    : controller.emailError.value,
                isObscure: _isPasswordObscure,
                suffixIcon: InkWell(
                    child: Icon(
                        _isPasswordObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.brown),
                    onTap: () {
                      setState(() {
                        _isPasswordObscure = !_isPasswordObscure;
                      });
                    }),
                onSubmitted: (v) {
                  _mobileFocus.requestFocus();
                },
                inputAction: TextInputAction.next),
          ),SizedBox(height: 30,),
          CommonViews().createButton(
              title: "Login",
              onPressed: () {
                controller.login(_emailController.text, _passwordController.text);
              }),
           Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text ( "Don’t have an account?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 0.36,color: Colors.grey.shade700,fontFamily: GoogleFonts.faustina().fontFamily),),InkWell(child: InkWell( child: Text("Signup" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 0.36,color: Colors.black,fontFamily: GoogleFonts.faustina().fontFamily,decoration: TextDecoration.underline)),onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen()));  },))
        ]),  ],),
      ),
    );
  }
}