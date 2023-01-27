
import 'package:contactonline/presentation/signup/controller/signup_controller.dart';
import 'package:contactonline/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/utils/validation_fonction.dart';
import '../../theme/app_color.dart';
import '../../widgets/button.dart';

class SignupScreen extends GetWidget<SignupController>{
  final _formkey = GlobalKey<FormState>();
  final signupcontroller = Get.put(SignupController());
  @override
  GoLoginScreen(){
    Get.offAllNamed(AppRoutes.initialRoute);
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: SingleChildScrollView(
          child: Column(

            children: [
              Center(
                child: Container(
                  child: Image.asset("assets/images/logo.png",width: 230.w,height: 175.h,),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w,vertical:10.h ),
                child: Form(
                  key: _formkey,
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
                            labelText: "Nom complet",
                            labelStyle: TextStyle(
                                color: AppColor.MarronyColor
                            )
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'ce champ doit etre rempli';
                          }
                        },
                        controller: signupcontroller.NomCompletController,
                      ),
                      SizedBox(height: 20.h,),
                      TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.MarronyColor,width: 3,)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.MarronyColor,width: 1.5)
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                            suffixIcon: Icon(Icons.mail,color: AppColor.MarronyColor,),
                            labelText: "Email",
                            labelStyle: TextStyle(
                                color: AppColor.MarronyColor
                            )
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'champ obligatoire';
                          }
                          if (!isValidEmail(value)){
                            return "invalide email";
                          }
                        },
                        controller: signupcontroller.EmailController,
                      ),
                      SizedBox(height: 20.h,),
                      TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.MarronyColor,width: 3,)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.MarronyColor,width: 1.5)
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                            suffixIcon: Icon(Icons.security,color: AppColor.MarronyColor,),
                            labelText: "Mot de pass",
                            labelStyle: TextStyle(
                                color: AppColor.MarronyColor
                            )
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'ce champ doit etre rempli';
                          }
                        },
                        controller: signupcontroller.MdpController,

                      ),
                      SizedBox(height: 20.h,),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.MarronyColor,width: 3,)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.MarronyColor,width: 1.5)
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                            suffixIcon: Icon(Icons.password,color: AppColor.MarronyColor,),
                            labelText: "Confirmez le mot de pass",
                            labelStyle: TextStyle(
                                color: AppColor.MarronyColor
                            )
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'ce champ doit etre rempli';
                          }

                          if(value != signupcontroller.MdpController.text){
                            return 'renseigner le bon mot de pass';
                          }

                        },

                      ),
                      SizedBox(height: 20.h,),
                      Button(
                        onpressed: (){
                          if (_formkey.currentState!.validate()){
                            signupcontroller.CreateUser();
                          }
                        },
                        text_size: 15.sp,
                        text_button: "S'inscrire",
                        width_container: double.infinity,
                        height_container: 40.h,
                        foreground_color: AppColor.primaryColor,
                        background_color: AppColor.MarronyColor,
                      ),
                      SizedBox(height: 20.h,),
                      Button(
                        onpressed: GoLoginScreen,
                        text_size: 15.sp,
                        text_button: "Avez vous déjà un compte?",
                        width_container: double.infinity,
                        height_container: 40.h,
                        foreground_color: AppColor.MarronyColor,
                        background_color: AppColor.primaryColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}