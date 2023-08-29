import 'package:flutter/material.dart';
import 'package:simple_bmi_caculator/constants/app_colors.dart';
import 'package:simple_bmi_caculator/constants/app_style.dart';
import 'package:simple_bmi_caculator/model/gender.dart';
import 'package:simple_bmi_caculator/model/result.dart';
import 'package:simple_bmi_caculator/routes/route.dart';
import 'package:simple_bmi_caculator/service/calculator.dart';
import 'package:simple_bmi_caculator/widgets/gender_widget.dart';
import 'package:simple_bmi_caculator/widgets/reusable_card.dart';

class BMI_Calculator extends StatefulWidget {
  const BMI_Calculator({super.key});

  @override
  State<BMI_Calculator> createState() => _BMI_CalculatorState();
}

class _BMI_CalculatorState extends State<BMI_Calculator>
    with SingleTickerProviderStateMixin {
  int _currentHeight = 160;
  int _currentWeight = 55;
  int _currentAge = 18;
  Gender _selectedGender = Gender.male;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        lowerBound: -1,
        upperBound: 0);
    controller.animateTo(0,
        curve: Curves.easeOut, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xff0a0e21),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteGenerator.historyPage);
              },
              icon: Icon(Icons.history),
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        color: const Color(0xff0a0e21),
        child: Center(
          //padding: EdgeInsets.all(10.0),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedBuilder(
                    animation: controller,
                    builder: (_, Widget? child) {
                      return Transform.translate(
                        offset: Offset(controller.value * 200, 0),
                        child: child,
                      );
                    },
                    child: GestureDetector(
                      onTap: () => setState(() {
                        _selectedGender = Gender.male;
                      }),
                      child: GenderWidget(
                        icon: Icons.male,
                        label: 'Male',
                        selectedGender: _selectedGender,
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                      animation: controller,
                      builder: (_, Widget? child) {
                        return Transform.translate(
                          offset: Offset(controller.value * -200, 0),
                          child: child,
                        );
                      },
                      child: GestureDetector(
                        onTap: () => setState(() {
                          _selectedGender = Gender.female;
                        }),
                        child: GenderWidget(
                          icon: Icons.female,
                          label: 'Female',
                          selectedGender: _selectedGender,
                        ),
                      ))
                ],
              ),
              Expanded(
                  child: AnimatedBuilder(
                      animation: controller,
                      builder: (_, Widget? child) {
                        return Transform.translate(
                          offset: Offset(controller.value * -200, 0),
                          child: child,
                        );
                      },
                      child: GestureDetector(
                        onTap: () => setState(() {
                          _selectedGender = Gender.female;
                        }),
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kActiveCardColour,
                          ),
                          height: 180,
                          width: 340,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('HEIGHT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    _currentHeight.toString(),
                                    style: kNumberTextStyle,
                                  ),
                                  const Text(
                                    'cm',
                                    style: kLabelTextStyle,
                                  ),
                                ],
                              ),
                              Slider(
                                thumbColor: AppColors.red,
                                activeColor: Colors.white,
                                value: _currentHeight.toDouble(),
                                max: 250,
                                divisions: 250,
                                label: _currentHeight.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    _currentHeight = value.toInt();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ))),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedBuilder(
                        animation: controller,
                        builder: (_, Widget? child) {
                          return Transform.translate(
                            offset: Offset(controller.value * 200, 0),
                            child: child,
                          );
                        },
                        child: ReusableCard(
                          label: 'WEIGHT',
                          onChanged: (int value) => setState(() {
                            _currentWeight = value;
                          }),
                        ),
                      ),
                      AnimatedBuilder(
                        animation: controller,
                        builder: (_, Widget? child) {
                          return Transform.translate(
                            offset: Offset(controller.value * -200, 0),
                            child: child,
                          );
                        },
                        child: ReusableCard(
                          label: 'AGE',
                          onChanged: (int value) => setState(() {
                            _currentAge = value;
                          }),
                        ),
                      ),
                    ]),
              )
            ]),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        // onTap: () => Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ResultBMIPage()),
        // ),
        onTap: () async {
          Calculator calc = Calculator(
            height: _currentHeight,
            weight: _currentWeight,
          );

          Navigator.pushNamed(
            context,
            RouteGenerator.resultPage,
            arguments: BMIResult(
              resultBMIScore: await calc.calculateBMI(),
              resultText: await calc.getResult(),
              resultInterpretation: await calc.getInterpretation(),
              resultColor: await calc.getStatusColor(),
            ),
          );
        },

        child: const BottomAppBar(
          color: const Color(0xffeb1455),
          child: Center(
            child: Text(
              'CALCULATE',
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
