import 'package:flutter/material.dart';
import 'package:simple_bmi_caculator/model/result.dart';
import 'package:simple_bmi_caculator/screens/bmi_calculator_screen.dart';
import 'package:simple_bmi_caculator/screens/history_screen.dart';
import 'package:simple_bmi_caculator/screens/plash_screen.dart';
import 'package:simple_bmi_caculator/screens/result_bmi_screen.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case home:
        return MaterialPageRoute<BMI_Calculator>(
          builder: (_) => const BMI_Calculator(),
        );
      case splash:
        return MaterialPageRoute<PlashScreen>(
          builder: (_) => PlashScreen(),
        );
      case resultPage:
        BMIResult result = args as BMIResult;
        return MaterialPageRoute<ResultBMIPage>(
          builder: (_) => ResultBMIPage(
            bmiResult: result,
          ),
        );
      case inputPage:
        return MaterialPageRoute<BMI_Calculator>(
          builder: (_) => const BMI_Calculator(),
        );
      case historyPage:
        return MaterialPageRoute<BMI_Calculator>(
          builder: (_) => const HistoryPage(),
        );
      default:
        throw const RouteException("Route not found");
    }
  }

  static const home = '/';
  static const splash = 'splash';
  static const inputPage = 'input';
  static const resultPage = 'result';
  static const historyPage = 'history';
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
