import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_bmi_caculator/constants/app_colors.dart';
import 'package:simple_bmi_caculator/constants/app_style.dart';
import 'package:simple_bmi_caculator/widgets/round_button.dart';

class ReusableCard extends StatefulWidget {
  final Function onChanged;
  String label;
  ReusableCard({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  int _currentValue = 0;
  @override
  void initState() {
    _currentValue = widget.label == 'AGE' ? 18 : 55;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kActiveCardColour,
      ),
      height: 180,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              )),
          Text(
            this._currentValue.toString(),
            style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleButton(
                  icon: '-',
                  onPressed: () => {
                        setState(() {
                          _currentValue <= 0
                              ? _currentValue = 0
                              : _currentValue--;
                        }),
                        widget.onChanged(_currentValue)
                      }),
              CircleButton(
                icon: '+',
                onPressed: () {
                  setState(() {
                    widget.label == 'AGE' && _currentValue == 100
                        ? _currentValue = 0
                        : _currentValue++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
