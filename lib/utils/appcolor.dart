import 'package:flutter/cupertino.dart';

class AppColors {
  AppColors._();

  static const Color primaryColorYellow = Color(0xffFFF700);
  static const Color primaryColorRed = Color(0xffF53C3C);
  static const Color textColor = Color(0xffAF7C58);
  static const Color gray = Color(0xffdadada);
  static const Color darkGray = Color(0xff9EA1AB);
  static const Color liteRed = Color(0xffFFA393);
  static const Color appBorder = Color(0xffC2C2C2);
  static const Color pink = Color(0xfff4ece5);
  static const Color red = Color(0xFFFF0000);
  static const Color redDark = Color(0xFF841617);
  static const Color buttonColor = Color(0xFF789292);
  static const Color hint = Color(0xFFB9B9B9);
  static const Color green = Color(0xFF8CE4A4);
  static const Color dieselGreen = Color(0xFF43561c);
  static const Color lite = Color(0xFFe0ffe7);
  static const Color dark = Color(0xFFc4ebcf);
  static const Color black = Color(0xFF222222);
  static const Color white = Color(0xFFFFFFFF);
  static const Color liteGreen = Color(0xFF69d28c);
  static const Color shadowRed = Color(0xFFF67676);
  static const Color shadow  = Color(0xFFEE9898);
  static const Color otpColor = Color(0xFF303030);
  static const Color orange = Color(0xFFFFA451);
  static const Color darkYellow = Color(0xFFcdb538);
  static const Color bottomGray = Color(0xFF789292);
  static const Color close = Color(0xFFD7D7D7);
  static const Color liteGray = Color(0xFFEDEDED);

  static LinearGradient gradient = const LinearGradient(colors: <Color>[
    AppColors.gray,
  ], begin: Alignment.center, end: Alignment.topRight);

  static Gradient horizontalLinear = const LinearGradient(
    begin: Alignment(-0.9, 1.0),
    end: Alignment(0.4, 1.0),
    colors: [
      shadowRed,
      white,
    ],
  );
  static Gradient colorBg = const LinearGradient(
    begin: Alignment(-0.9, 1.0),
    end: Alignment(0.4, 1.0),
    colors: [
      orange,
      shadow,
    ],
  );
}
