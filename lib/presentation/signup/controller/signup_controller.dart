
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contactonline/presentation/signup/model/user_model.dart';
import 'package:contactonline/theme/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/variables/global_variable.dart';
import '../../../routes/app_routes.dart';

class SignupController extends GetxController{

  final Rx<UserModel> user = UserModel().obs;
   TextEditingController EmailController = TextEditingController();
   TextEditingController NomCompletController = TextEditingController();
   TextEditingController MdpController = TextEditingController();



  CreateUser() async{

   Get.dialog(Center(child: CircularProgressIndicator(color: AppColor.MarronyColor,)));
   final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: EmailController.text,
        password:MdpController.text);

   if (result != null){
     user.value.email=EmailController.text;
     user.value.nom=NomCompletController.text;
     user.value.id = docUser!.uid;
     await FirebaseFirestore.instance.collection("users").doc(docUser?.uid).set(user.value.tojson());
     Get.offAllNamed(AppRoutes.initialRoute);
   };

  }
  void onClose(){
    super.onClose();
    EmailController.dispose();
    NomCompletController.dispose();
    MdpController.dispose();
  }




}