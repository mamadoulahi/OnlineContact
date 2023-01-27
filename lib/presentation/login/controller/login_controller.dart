import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/loading.dart';

class LoginController extends GetxController{

  final TextEditingController EmailController = TextEditingController();
  final TextEditingController MdpController = TextEditingController();


  GoLogin() async {
    Get.dialog(Loading());
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: EmailController.text,
          password: MdpController.text);
      Get.offAllNamed(AppRoutes.contactScreen);
    }on FirebaseAuthException {
      Get.back();
      Get.snackbar(
          "Erreur",
          "Veuillez saisir les bonnes informations",
        backgroundColor: AppColor.MarronyColor,
        colorText: AppColor.primaryColor,

      );

    }


  }
  GoSignupScreen(){
    return Get.offAllNamed(AppRoutes.signupScreen);
  }



/*  void onClose(){
    EmailController.dispose();
    MdpController.dispose();
    super.onClose();
  }*/


}