import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../contact/contact_screen.dart';
import '../login/login_screen.dart';
import 'controller/mainpage_controller.dart';

class MainPageScreen extends GetWidget<MainPageController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if (snapshot.hasData){
              return ContactScreen();
            }else {
              return LoginScreen();
            }
          },
        )
    );
  }

}