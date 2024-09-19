import 'package:flutter/services.dart';

class Constants {
  static List<TextInputFormatter> nameFormatter = [
    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
    LengthLimitingTextInputFormatter(20)
  ];

  static const String fontfamily = "Rubik";
  static const String semibold = "semibold";
  static const String next = "Next";
  static const String signin = "Sign In";
}
