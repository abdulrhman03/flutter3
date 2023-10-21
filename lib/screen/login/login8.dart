import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p2/screen/home/home.dart';
import 'package:flutter_p2/utils/helpers/navigater.dart';
import 'package:flutter_p2/utils/ui/loding_view.dart';
import 'package:get/get.dart';

import '../../utils/ui/common_views.dart';
import '../config/curent.dart';
import '../config/firebase_errors/firebase_error_messages.dart';
import '../home/home_1.dart';

import '../register/reg5.dart';


class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void login(String email, String password) async {
    try {
      if (isValid(email, password)) {
        LodingView.shard.startLoading(Get.context);

        UserCredential response = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (response.user != null) {
          UserModel? model = await _getDataFromFirestore(response.user!.uid);
          LodingView.shard.stopLoading();
          if (model != null) {
            CurrentSession().user=model;
            CommonViews().showSnackBar("Success", "Login Successful");
            GoNavigator.of(Get.context!).pushAndRemoveUntil(Home());
          } else {CommonViews().showSnackBar("Failed", "Login Failed");}
        }
      }
    } catch (error) {
      LodingView.shard.stopLoading();
      if (error is FirebaseException) {
        print(error.code);
        CommonViews()
            .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
      } else {
        CommonViews().showSnackBar("Failed", error.toString());
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
    }
    return true;
  }

  Future<UserModel?> _getDataFromFirestore(String uid) async {
    try {
      var collection = FirebaseFirestore.instance.collection("users");
      var result = await collection.where("uid", isEqualTo: uid).get();
      if (result.docs.isNotEmpty) {UserModel model = UserModel.fromMap(result.docs.first.data());
        return model;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}