import 'package:flutter/material.dart';
import 'package:simple_bmi_caculator/constants/app_colors.dart';

class CircleButton extends StatelessWidget {
  String icon;
  final VoidCallback? onPressed;
  CircleButton({super.key, required this.icon, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        icon,
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(7),
        backgroundColor: AppColors.appCircleButtonColor, // <-- Button color
      ),
    );
  }
}
