import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pockman/modules/splash/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,
      title: ' Pockemon app',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.lalezarTextTheme(
          Theme.of(context).textTheme,
        ),

      ),

      home: SplashScreen(),
    );
  }
}

