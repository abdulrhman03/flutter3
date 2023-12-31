import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_p2/screen/register/reg5.dart';
import 'package:flutter_p2/utils/helpers/navigater.dart';
import 'package:flutter_p2/utils/ui/loding_view.dart';
import 'package:get/get.dart';

import '../../utils/ui/common_views.dart';
import '../config/firebase_errors/firebase_error_messages.dart';
import '../login/login6.dart';


class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<void> registerWithEmailAndPassword(UserModel userModel) async {
    if (isValid(userModel.email, userModel.password ?? '')) {
      try {
        LodingView.shard.startLoading(Get.context);
        var result = await _auth.createUserWithEmailAndPassword(
            email: userModel.email, password: userModel.password!);

        if (result.user != null) {
          userModel.uid = result.user!.uid;
          userModel.photoURL = await saveImageToStorage(userModel.file!);
          _registerUserToFirestore(userModel);
        } else {
          LodingView.shard.stopLoading();
          CommonViews().showSnackBar("Failed", "Registration UnSuccessful");
        }
        FocusManager.instance.primaryFocus!.unfocus();
      } catch (error) {
        LodingView.shard.stopLoading();
        if (error is FirebaseException) {
          CommonViews()
              .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
        } else {
          CommonViews()
              .showSnackBar("Failed", "Registration UnSuccessful$error");
        }
        FocusManager.instance.primaryFocus!.unfocus();
      }
    }
  }

  bool isValid(String email, String password) {
    emailError.value = '';
    passwordError.value = '';
    if (email.isEmpty) {
      emailError.value = "Email is Required";
      return false;
    } else if (password.isEmpty) {
      passwordError.value = "Password is Required";
      return false;
    } else if (password.length < 6) {
      passwordError.value = "please enter Strong password";
      return false;
    }
    return true;
  }

  void _registerUserToFirestore(UserModel userModel) async {
    try {
      var collection = FirebaseFirestore.instance.collection("users");
      await collection.add(userModel.toMap());
      LodingView.shard.stopLoading();
      CommonViews().showSnackBar("Success", "Registration Successful");
      GoNavigator.of(Get.context!).pushAndRemoveUntil(LoginScreen());

    } catch (error) {
      if (error is FirebaseException) {
        CommonViews()
            .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
      }
    }
  }

  Future<String> saveImageToStorage(File imgFile) async {
    try {
      Reference storageReference = FirebaseStorage.instance.ref();
      String fileName = "fip5_${DateTime.now().millisecondsSinceEpoch}${Random().nextInt(1000)}";
      Reference imageRef = storageReference.child("images/$fileName.jpg");
      await imageRef.putFile(imgFile);
      return imageRef.getDownloadURL();
    } catch (error) {
      if (error is FirebaseException) {
        CommonViews()
            .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
      }
      return "";
    }
  }
}