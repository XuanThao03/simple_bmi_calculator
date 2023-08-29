import 'package:flutter/material.dart';
import 'package:simple_bmi_caculator/constants/app_style.dart';
import 'package:simple_bmi_caculator/model/gender.dart';

class GenderWidget extends StatefulWidget {
  final IconData icon;
  final String label;
  Gender selectedGender;
  GenderWidget(
      {super.key,
      required this.icon,
      required this.label,
      required this.selectedGender});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  bool _selected = false;
  @override
  void initState() {
    // TODO: implement initStatpe
    // print('name: ${widget.selectedGender.name}');
    // print('label: ${widget.label}');
    _selected =
        widget.selectedGender.name == widget.label.toLowerCase() ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    _selected =
        widget.selectedGender.name == widget.label.toLowerCase() ? true : false;
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: _selected == true ? kActiveCardColour : kInactiveCardColour,
      ),
      height: 180,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon,
              color: _selected == true && widget.label == 'Male'
                  ? Colors.blue
                  : _selected == true && widget.label == 'Female'
                      ? Colors.yellow
                      : Colors.white,
              size: 50),
          Text(widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ))
        ],
      ),
    );
  }
}
