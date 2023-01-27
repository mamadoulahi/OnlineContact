import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contactonline/presentation/contact/controller/contact_controller.dart';
import 'package:contactonline/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/variables/global_variable.dart';
import '../../theme/app_color.dart';
import '../../widgets/loading.dart';


  class EditContactScreen extends StatefulWidget {
    final String initialnom;
    final String initialprenom;
    final String initialemail;
    final String initialnumero;
    final String docid;
    const EditContactScreen({Key? key, required this.initialnom, required this.initialprenom, required this.initialemail, required this.initialnumero, required this.docid}) : super(key: key);

    @override
    State<EditContactScreen> createState() => _EditContactScreenState();
  }

  class _EditContactScreenState extends State<EditContactScreen> {

    final _keyForm=GlobalKey<FormState>();
    final contactcontroller = Get.put(ContactController());
    var Editnom ;
    var Editsurname;
    var Editemail;
    var Editnumber;
    inialvariables(){
      Editnom = widget.initialnom;
      Editnumber=widget.initialnumero;
      Editsurname = widget.initialprenom;
      Editemail= widget.initialemail;

    }



    EditContact() async{
      Get.dialog(Loading());
      await FirebaseFirestore.instance.collection("users").doc(docUser!.uid).collection("contacts").doc(widget.docid).update(
          {
            "nom":Editnom,
            "prenom":Editsurname,
            "email":Editemail,
            "numero":Editnumber
          }
      ).then((value) => Get.offAllNamed(AppRoutes.contactScreen)
      ).catchError((onError)=>Get.snackbar("erreur", "$onError"));

    }

    @override
  void initState() {
    // TODO: implement initState
      inialvariables();
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.primaryColor,
            appBar: AppBar(
              backgroundColor: AppColor.MarronyColor,
              elevation: 1.sp,
              title: Text("modification"),
              centerTitle: true,
              actions: [
                GestureDetector(
                    onTap:(){
                      EditContact();
                    },
                    child:  Container(
                      height: 50.h,
                      width: 100.w,
                      color: AppColor.primaryColor,
                      child: Center(child: Text("Modifier",style: TextStyle(color: AppColor.MarronyColor,fontSize: 16.sp,fontWeight: FontWeight.bold),)),
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
                              initialValue: widget.initialnom,
                              onChanged: (value) {
                                setState(() {
                                  Editnom = value;
                                });
                              },
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

                              validator: (value){
                                if (value!.isEmpty){
                                  return 'ce champ est obligatoire';
                                }
                              }

                          ),
                          SizedBox(height: 35.h,),
                          TextFormField(
                              initialValue: widget.initialprenom,
                              onChanged: (value) {
                               setState(() {
                                 Editsurname = value;
                               });
                              },
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

                              validator: (value){
                                if (value!.isEmpty){
                                  return 'ce champ est obligatoire';
                                }
                              }

                          ),
                          SizedBox(height: 35.h,),
                          TextFormField(
                              initialValue: widget.initialemail,
                              onChanged: (value) {
                                setState(() {
                                  Editemail=value;
                                });
                              },
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

                              validator: (value){
                                if (value!.isEmpty){
                                  return 'ce champ est obligatoire';
                                }
                              }

                          ),
                          SizedBox(height: 35.h,),
                          TextFormField(
                              initialValue: widget.initialnumero,
                              onChanged: (value) {
                               setState(() {
                                 Editnumber=value;
                               });
                              },
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



