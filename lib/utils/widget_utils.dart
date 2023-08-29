import 'package:flutter/material.dart';

const double baseHeight = 650.0;
const double baseWidth = 128.0;

double scaleH(double size, BuildContext context) {
  double drawingHeight =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  return size * drawingHeight / baseHeight;
}

double scaleW(double size, BuildContext context) {
  double drawingWidth =
      MediaQuery.of(context).size.width - MediaQuery.of(context).padding.left;
  return size * drawingWidth / baseWidth;
}

void showSnackBar(BuildContext scaffoldContext, String message) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 60),
    // duration:const  Duration(milliseconds: 500),
    dismissDirection: DismissDirection.horizontal,
    content: Text(message),
  );

  // Find the Scaffold in the Widget tree and use it to show a SnackBar!
  ScaffoldMessenger.of(scaffoldContext).showSnackBar(snackBar);
}
