import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contactonline/presentation/contact/contact_add_screen.dart';
import 'package:contactonline/presentation/contact/controller/contact_controller.dart';
import 'package:contactonline/presentation/signup/controller/signup_controller.dart';
import 'package:contactonline/theme/app_color.dart';
import 'package:contactonline/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/variables/global_variable.dart';
import '../../widgets/contact_detail.dart';
import 'contact_edit_screen.dart';

class ContactScreen extends GetWidget<ContactController>{
  final contactController = Get.put(ContactController());
  final signupcontroller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    if (docUser?.uid == null) {
      return Text("");
    }else return SafeArea (
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        drawer: Drawer(
          backgroundColor: AppColor.primaryColor,
          child: ListView(
            children: [
              DrawerHeader(child: CircleAvatar(
                backgroundColor: AppColor.MarronyColor,
              )),
              ListTile(
                title: Text("Historique",style: TextStyle(color: AppColor.MarronyColor),),
                leading: Icon(Icons.history_sharp,color: AppColor.MarronyColor),
              ),
              ListTile(
                title: Text("à propos",style: TextStyle(color: AppColor.MarronyColor),),
                leading: Icon(Icons.info_outline,color: AppColor.MarronyColor),
              ),
              ListTile(
                title: Text("Favoris",style: TextStyle(color: AppColor.MarronyColor),),
                leading: Icon(Icons.favorite_border_outlined,color: AppColor.MarronyColor),
              ),
              ListTile(
                onTap: () {
                 contactController.GoSignout();
                },
                title: Text("Déconnexion",style: TextStyle(color: AppColor.MarronyColor),),
                leading: Icon(Icons.exit_to_app,color: AppColor.MarronyColor),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("ContactOnline"),
          centerTitle: true,
          backgroundColor: AppColor.MarronyColor,
          actions: [
            IconButton(onPressed:(){}, icon: Icon(Icons.search,color: AppColor.primaryColor,)),
            IconButton(onPressed:(){}, icon: Icon(Icons.person,color: AppColor.primaryColor,))
          ],
        ),
        body:  SingleChildScrollView(
             child: StreamBuilder<QuerySnapshot>(
               stream: FirebaseFirestore.instance.collection("users").doc(docUser?.uid ).collection("contacts").snapshots(),
               builder: (context,snapshot){
                 List contactlist = snapshot.data!.docs;
                 if (snapshot.connectionState == ConnectionState.waiting) {
                   return Loading();
                 }
                 if (snapshot.hasError) {
                   return Text('Something went wrong');
                 }
                 if (!snapshot.hasData){
                   return Center(child: CircularProgressIndicator());
                 }else return SizedBox(
                   height: 690.h,
                   child: ListView.builder(
                       itemCount: contactlist.length,
                       itemBuilder:(context,index){
                         Map<String,dynamic> data = contactlist[index].data() as Map<String,dynamic>;
                         String DocId = contactlist[index].id;
                         return Card(
                           child: ListTile(
                             trailing: IconButton(
                                 onPressed: () {
                                   Get.to(EditContactScreen(
                                     initialnumero: "${data["numero"]}",
                                     initialprenom: "${data["prenom"]}",
                                     initialemail:"${data["email"]}",
                                     initialnom: "${data["nom"]}",
                                     docid: DocId,
                                   ));
                                 }, icon: Icon(Icons.edit,color: AppColor.MarronyColor,)),
                             onTap: () {
                               Get.to(
                                   DetailContact(
                                     numero: "${data["numero"]}",
                                     prenom: "${data["prenom"]}",
                                     email:"${data["email"]}",
                                     nom: "${data["nom"]}",
                                     docId: DocId,
                                   )
                               );
                             },
                             title: Text("${data["prenom"]}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                             leading: CircleAvatar(
                               backgroundColor: AppColor.MarronyColor,
                             ),
                             subtitle: Text("${data["email"]}"),

                           ),
                         );
                       }),
                 );
               
               },
             ),
           ),


        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.MarronyColor,
          child: Icon(Icons.add,color: AppColor.primaryColor,),
          onPressed: () {
            Get.to(ContactAddScreen());
          },
        ),
      ),
    );
  }

}