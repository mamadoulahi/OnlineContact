
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contactonline/presentation/contact/model/contact_model.dart';
import 'package:contactonline/presentation/signup/controller/signup_controller.dart';
import 'package:contactonline/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/variables/global_variable.dart';
import '../../../theme/app_color.dart';
import '../../../widgets/loading.dart';

class ContactController extends GetxController{

   final TextEditingController Addname = TextEditingController();
   final TextEditingController Addsurname = TextEditingController();
   final TextEditingController Addemail= TextEditingController();
   final TextEditingController Addnumber = TextEditingController();



   final Rx<ContactModel> contact = ContactModel().obs;
   final RxString nom = "".obs;
   final RxString prenom = "".obs;
   final RxString email = "".obs;
   final RxString telephone = "".obs;
   final SignupController signupController= Get.put(SignupController());





 AddContact() async {
   final docContact = await FirebaseFirestore.instance.collection("users").doc(docUser?.uid ?? "").collection("contacts");
   contact.value.id=docUser!.uid;
   contact.value.telephone= Addnumber.text;
   contact.value.email=Addemail.text;
   contact.value.surname = Addsurname.text;
   contact.value.name=Addname.text;
   Get.dialog(Loading());
   await docContact.add(contact.value.toJson());
   Get.offAllNamed(AppRoutes.contactScreen);
 }


GoSignout() async {
  Get.dialog(Loading());
  await FirebaseAuth.instance.signOut();
  Get.offAllNamed(AppRoutes.initialRoute);
}



}