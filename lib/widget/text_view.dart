import 'package:flutter/material.dart';
import '../utils/constant.dart';

class TextView extends StatelessWidget {
  String data;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  int? maxLines;
  Color? textColor;
  Color? decorationTextColor;
  Color? backgroundColor;
  double fontSize;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  double? letterSpacing;
  double? wordSpacing;
  List<Shadow>? shadows;
  TextDecoration? textDecoration;
  String? fontFamily;
  TextStyle? textStyle;
  bool? softWrap;

  TextView(this.data,
      {super.key,
        this.textAlign,
        this.textOverflow,
        this.maxLines,
        this.textColor,
        this.decorationTextColor,
        this.backgroundColor,
        this.fontSize = 14.0,
        this.fontWeight,
        this.fontStyle,
        this.letterSpacing,
        this.wordSpacing,
        this.shadows,
        this.textDecoration,
        this.fontFamily = Constants.semibold,
        this.softWrap = true,
        this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      softWrap: softWrap,
      style: textStyle ??
          TextStyle(
            color: textColor,
            backgroundColor: backgroundColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            shadows: shadows,
            decoration: textDecoration,
            decorationColor : decorationTextColor,

            fontFamily: fontFamily,
          ),
    );
  }
}
