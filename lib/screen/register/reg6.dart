import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p2/screen/register/reg5.dart';
import 'package:flutter_p2/screen/register/reg8.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/ui/common_views.dart';
import '../config/firebase_errors/app_con.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _displayNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  FocusNode _emailFocus = FocusNode();
  FocusNode _fullNameFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _mobileFocus = FocusNode();
  XFile? xFile;
  bool _isPasswordObscure = true;
  RegisterController controller = Get.put(RegisterController());

  @override
  String? validatePss(String? value){
    const pattern = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
    final regex=RegExp(pattern);
    if(value==null || value.isEmpty)
      return 'Please enter a password.';
    else if (!regex.hasMatch(value)) {
      return 'Password must be at least 8 characters long and contain both letters and numbers.';
    }

    return null; // Validation passed
  }
  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
        height: 40,
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 10),
        child: Center(
            child: CommonViews().createButton(
                title: "Register",
                onPressed: () async {

                  File file=File(xFile!.path);
                  UserModel model = UserModel(
                    displayName:  _displayNameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                    photoURL: "",
                    phoneNumber: _phoneNumberController.text,
                  );
                  model.file=file;
                  controller.registerWithEmailAndPassword(model);
                })),
      ),
      body: Form(
        key: controller.key,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                _getProfileImageView(),
                const SizedBox(
                  height: AppConstants.textFieldSpacing,
                ),
                Obx(
                      () => CommonViews().createTextFormField(validator: validateEmail,
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
                ),           Obx(
                      () => CommonViews().createTextFormField(
                      controller: _displayNameController,
                      focusNode: _fullNameFocus,
                      label: "fullName",
                      errorText: controller.emailError.value.isEmpty
                          ? null
                          : controller.emailError.value,



                      inputAction: TextInputAction.next),
                ),SizedBox(height: 20),
                Obx(
                      () => CommonViews().createTextFormField(validator: validatePss,
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
                ),

                const SizedBox(
height: 10,
                ),
                CommonViews().createTextFormField(
                    controller: _phoneNumberController,
                    focusNode: _mobileFocus,
                    label: "Mobile Number",
                    prefixText: "+962",
                    hint: " 7",
                    keyboardType: TextInputType.phone),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getProfileImageView() {
    return InkWell(
      onTap: () async {
        ImagePicker picker = ImagePicker();
        xFile = await picker.pickImage(source: ImageSource.camera); // permission
        setState(() {});
      },
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.greenAccent, width: 3),
        ),
        child: Center(
            child: xFile == null
                ?  Lottie.asset('lib/assets/Animation - 1696607435133.json')
                : ClipRRect(
              borderRadius: BorderRadius.circular(800),
              child: Container(height:150,width:150,
                child: Image.file(
                  File(xFile!.path),
fit:BoxFit.cover,
                ),
              ),
            )),
      ),
    );
  }
}