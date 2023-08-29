import 'package:flutter/material.dart';
import 'package:simple_bmi_caculator/routes/route.dart';
import 'package:simple_bmi_caculator/utils/widget_utils.dart';
import 'package:simple_bmi_caculator/widgets/pacman_loading.dart';

class PlashScreen extends StatefulWidget {
  const PlashScreen({super.key});

  @override
  State<PlashScreen> createState() => _PlashScreenState();
}

class _PlashScreenState extends State<PlashScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: const Color(0xff0f1538),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash_logo.png',
                height: scaleH(100, context),
              ),
              SizedBox(height: scaleH(20, context)),
              const Text(
                'BMI CALCULATOR',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: scaleH(150, context)),
              const CircularProgressIndicator(
                color: Colors.pink,
              ),
              SizedBox(
                height: scaleH(20, context),
              ),
              const Text("Check Your BMI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
              SizedBox(
                height: scaleH(20, context),
              ),
              const LoadingIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
