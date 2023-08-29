import 'package:flutter/material.dart';

extension LocalizationExt on BuildContext {
  // String localize(String value)
  // {
  //   final code = AppLocalization.of(this).locate.languageCode;
  //   final database =  AppLocalization._localizeValues
  // }
}

class AppLocalization {
  final Locale locate;
  AppLocalization(this.locate);
  static AppLocalization of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization)!;
  static final Map<String, Map<String, String>> _localizeValues = {
    "en": {
      "title": "BMI Calculattion",
      "title_history": "History",
      "label_calculator": "CALCULATOR",
      "label_recalculator": "RE-CALCULATOR",
      "label_male": "MALE",
      "label_female": "FEMALE",
    }
  };
}
