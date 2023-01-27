import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contactonline/presentation/contact/contact_edit_screen.dart';
import 'package:contactonline/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/variables/global_variable.dart';

class DetailContact extends StatelessWidget {
  final String? numero;
  final String? prenom;
  final String? email;
  final String? nom;
  final String? docId;
  const DetailContact({Key? key, this.numero, this.prenom, this.email, this.nom, this.docId}) : super(key: key);
/*  _launchurl() async {
    String _url = 'mailto:keitamamadoulahi@gmail.com' ;
    await launch(_url);
  }*/

  deletecontact(){
    try {
      FirebaseFirestore.instance.collection("users").
      doc(docUser?.uid ?? "" ).
      collection("contacts").doc(docId).delete();
      Get.back();
    }on FirebaseException{}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.MarronyColor,
          title: Text("$prenom"),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: deletecontact,
              child: Container(
                margin: EdgeInsets.only(right: 5.w),
                  child: Icon(Icons.delete)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70.h,),
              Center(
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundColor: AppColor.MarronyColor,
                ),
              ),
              SizedBox(height: 5.h,),
              Divider(
                height: 15.h,
                color: AppColor.MarronyColor,
              ),
              Padding(
                padding:  EdgeInsets.all(10.h),
                child: Text("$nom",style: TextStyle(color: AppColor.MarronyColor,fontSize: 20.sp),),
              ),
              Divider(
                height: 20.h,
                color: AppColor.MarronyColor,
              ),
              Container(
                padding: EdgeInsets.all(10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.call,color: AppColor.MarronyColor,),
                        Text("Appel",style: TextStyle(color: AppColor.MarronyColor),)
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.sms,color: AppColor.MarronyColor,),
                        Text("SMS",style: TextStyle(color: AppColor.MarronyColor))
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.email,color: AppColor.MarronyColor,),
                        Text("Email",style: TextStyle(color: AppColor.MarronyColor))
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 20.h,
                color: AppColor.MarronyColor,
              ),
              Container(
                padding: EdgeInsets.all(10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.call,color: AppColor.MarronyColor,),
                      ],
                    ),
                    SizedBox(width: 5.w,),
                    Column(
                      children: [
                        Text("$numero",style: TextStyle(color: AppColor.MarronyColor))
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 20.h,
                color: AppColor.MarronyColor,
              ),
              Container(
                padding: EdgeInsets.all(10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.email,color: AppColor.MarronyColor,),
                      ],
                    ),
                    SizedBox(width: 5.w,),
                    Column(
                      children: [
                        Text("$email",style: TextStyle(color: AppColor.MarronyColor))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.MarronyColor,
          child: Icon(Icons.edit),
          onPressed: () {
            //Get.to(EditContactScreen());
          },),
      ),
    );
  }
}
