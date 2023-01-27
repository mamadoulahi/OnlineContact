
import 'package:contactonline/presentation/contact/binding/contact_binding.dart';
import 'package:contactonline/presentation/contact/contact_screen.dart';
import 'package:contactonline/presentation/mainpage/mainpage.dart';
import 'package:contactonline/presentation/signup/signup_screen.dart';
import 'package:get/get.dart';
import '../presentation/login/binding/login_binding.dart';
import '../presentation/login/login_screen.dart';
import '../presentation/signup/binding/signup_binding.dart';

class AppRoutes {
  static String initialRoute = "/initialRoute";
  static String signupScreen="/signup";
  static String contactScreen = "/contact";


  static List<GetPage> pages= [
    GetPage(
        name: initialRoute,
        page: ()=>MainPageScreen(),
    ),
    GetPage(
        name: signupScreen,
        page: ()=>SignupScreen(),
        bindings:[
          SignupBinding()
        ]),

    GetPage(
        name: contactScreen,
        page: ()=>ContactScreen(),
      bindings: [
        ContactBinding(),
      ]
    )
  ];
}