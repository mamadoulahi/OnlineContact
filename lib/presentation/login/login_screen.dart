
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_color.dart';
import '../../widgets/button.dart';
import 'controller/login_controller.dart';

class LoginScreen extends GetWidget<LoginController>{

  final loginController = Get.put(LoginController());

  final _keyForm=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                 child: Image.asset("assets/images/logo.png",width: 230.w,height: 230.h,),
                ),
              ),
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
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: AppColor.MarronyColor
                          )
                        ),

                        controller: loginController.EmailController,
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
                            suffixIcon: Icon(Icons.security,color: AppColor.MarronyColor,),
                            labelText: "Mot de pass",
                            labelStyle: TextStyle(
                                color: AppColor.MarronyColor
                            )
                        ),
                        controller: loginController.MdpController,
                          validator: (value){
                            if (value!.isEmpty){
                              return 'ce champ est obligatoire';
                            }
                          }

                      ),
                      SizedBox(height: 35.h,),
                      Button(
                        onpressed: (){
                          if (_keyForm.currentState!.validate()){
                            loginController.GoLogin();
                          }
                        },
                        text_size: 15.sp,
                        text_button: "connexion",
                        width_container: double.infinity,
                        height_container: 40.h,
                        foreground_color: AppColor.primaryColor,
                        background_color: AppColor.MarronyColor,
                      ),
                      SizedBox(height: 35.h,),
                      Button(
                        onpressed: loginController.GoSignupScreen,
                        text_size: 15.sp,
                        text_button: "Avez vous besoin d'un nouveau compte?",
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