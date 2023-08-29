import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_bmi_caculator/constants/app_style.dart';
import 'package:simple_bmi_caculator/model/result.dart';
import 'package:simple_bmi_caculator/screens/bmi_calculator_screen.dart';
import 'package:simple_bmi_caculator/service/calculator.dart';

class ResultBMIPage extends StatelessWidget {
  final BMIResult? bmiResult;

  const ResultBMIPage({super.key, required this.bmiResult});
  Future<void> onSavePressed(String bmi, String status, int statusColor) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> saveList = prefs.getStringList('saveList') ?? [];
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd - kk:mm').format(now);

      saveList.add(
          '{"bmi":"$bmi","status":"$status","statusColor":"$statusColor","formattedDate":"$formattedDate"}');
      await prefs.setStringList('saveList', saveList);
    } catch (e) {
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        backgroundColor: const Color(0xff0a0e21),
        leading: IconButton(
          onPressed: () => {
            Navigator.pop(context),
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'BMI CACULATOR',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (bmiResult != null) {
                  onSavePressed(
                    bmiResult!.resultBMIScore,
                    bmiResult!.resultText,
                    bmiResult!.resultColor.value,
                  );
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Save Result'),
                            content: const Text('Your result saved'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ));
                }
              },
              icon: const Icon(
                Icons.save,
                color: Colors.white,
              )),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
            Text(
              bmiResult?.resultText.toUpperCase() ?? "",
              style: kResultTextStyle.copyWith(color: bmiResult?.resultColor),
            ),
            Text(
              bmiResult?.resultBMIScore ?? "",
              style: kBMITextStyle,
            ),
            Text(
              bmiResult?.resultInterpretation ?? "",
              style: kBodyTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.pop(
          context,
        ),
        child: const BottomAppBar(
          color: const Color(0xffeb1455),
          child: Center(
            child: Text(
              'RE-CALCULATE',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
