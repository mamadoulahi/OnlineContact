
import 'package:contactonline/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/button.dart';
import 'controller/contact_controller.dart';

class ContactAddScreen extends GetView<ContactController>{
  final _keyForm=GlobalKey<FormState>();
  final contactcontroller = Get.put(ContactController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.MarronyColor,
          elevation: 1.sp,
          title: Text("Nouveau contact"),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: (){
                contactcontroller.AddContact();
              },
              child:  Container(
                height: 50.h,
                width: 100.w,
                color: AppColor.primaryColor,
                child: Center(child: Text("Enregister",style: TextStyle(color: AppColor.MarronyColor,fontSize: 16.sp,fontWeight: FontWeight.bold),)),
              )
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70.h,),
              CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColor.MarronyColor,
              ),
              SizedBox(height: 20.h,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w,vertical:10.h ),
                child: Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.MarronyColor,width: 3,)
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.MarronyColor,width: 1.5)
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                              suffixIcon: Icon(Icons.person,color: AppColor.MarronyColor,),
                              labelText: "Nom",
                              labelStyle: TextStyle(
                                  color: AppColor.MarronyColor
                              )
                          ),

                          controller: contactcontroller.Addname,
                          validator: (value){
                            if (value!.isEmpty){
                              return 'ce champ est obligatoire';
                            }
                          }

                      ),
                      SizedBox(height: 35.h,),
                      TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.MarronyColor,width: 3,)
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.MarronyColor,width: 1.5)
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                              suffixIcon: Icon(Icons.person_add,color: AppColor.MarronyColor,),
                              labelText: "Prénom",
                              labelStyle: TextStyle(
                                  color: AppColor.MarronyColor
                              )
                          ),
                          controller: contactcontroller.Addsurname,
                          validator: (value){
                            if (value!.isEmpty){
                              return 'ce champ est obligatoire';
                            }
                          }

                      ),
                      SizedBox(height: 35.h,),
                      TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.MarronyColor,width: 3,)
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.MarronyColor,width: 1.5)
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                              suffixIcon: Icon(Icons.email_outlined,color: AppColor.MarronyColor,),
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  color: AppColor.MarronyColor
                              )
                          ),

                          controller: contactcontroller.Addemail,
                          validator: (value){
                            if (value!.isEmpty){
                              return 'ce champ est obligatoire';
                            }
                          }

                      ),
                      SizedBox(height: 35.h,),
                      TextFormField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.MarronyColor,width: 3,)
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor.MarronyColor,width: 1.5)
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                              suffixIcon: Icon(Icons.phone_callback,color: AppColor.MarronyColor,),
                              labelText: "N° de téléphone",
                              labelStyle: TextStyle(
                                  color: AppColor.MarronyColor
                              )
                          ),

                          controller: contactcontroller.Addnumber,
                          validator: (value){
                            if (value!.isEmpty){
                              return 'ce champ est obligatoire';
                            }
                          }

                      ),


                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

}