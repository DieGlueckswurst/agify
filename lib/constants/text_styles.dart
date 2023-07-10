import 'package:agify/constants/palette.dart';
import 'package:agify/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle recoletaH1Regular = const TextStyle(
    fontFamily: FontFamily.recoleta,
    fontWeight: FontWeight.w400,
    color: Palette.black,
    fontSize: 48,
  );

  static TextStyle robotoH4Regular = const TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
    color: Palette.black,
    fontSize: 17,
  );

  static TextStyle robotoH4SemiBold = robotoH4Regular.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle robotoH5Regular = const TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w600,
    color: Palette.black,
    fontSize: 17,
  );

  static TextStyle robotoH5SemiBold = robotoH5Regular.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle robotoH6SemiBold = const TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w600,
    color: Palette.black,
    fontSize: 15,
  );
}
