import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:pockman/modules/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 6000), () {
      Get.offAll(HomePage(),transition:Transition.leftToRight );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.45, 1.0],
            colors: const [
              Color(0xFF2E90F8),
              Color(0xFF165EB8),
              Color(0xFF071B52),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height * 0.18),
              SizedBox(height: size.height * 0.21),
              Image.asset("assets/images/logos.png", width: size.width * 0.8)
                 ,

              Text(
                    "POKÉDEX",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      letterSpacing: 5,
                    ),
                  )
             ,
              Text(
                    "PRO",
                    style: TextStyle(
                      color: Color(0xFFD9BE87),
                      fontSize: 50,
                      height: 0.4,
                    ),
                  )
             ,
              SizedBox(height: size.height * 0.018),
              //gotta
              Text(
                    "Gotta Know 'Em All!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.054,
                      height: 3,
                      letterSpacing: 2,
                    ),
                  )
      ,
              Spacer(),

              Text(
                    "Loading Your Journey...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  )
      ,
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
