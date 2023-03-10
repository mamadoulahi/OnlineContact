import 'package:contactonline/routes/app_routes.dart';
import 'package:contactonline/theme/app_color.dart';
import 'package:contactonline/widgets/mainpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Contact Online',
          theme: ThemeData(

            primarySwatch: Colors.brown,
          ),
          getPages: AppRoutes.pages,
          initialRoute: AppRoutes.initialRoute,
        );
      },

    );
  }
}

