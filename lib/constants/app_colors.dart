import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color.fromRGBO(188, 52, 143, 1);
  static const gradientColors = [
    Color(0xff4c65d4),
    Color(0xffbc348f),
    Color(0xfffed676),
  ];
  Map<int, Color> color = {
    50: const Color.fromRGBO(188, 52, 143, .1),
    100: const Color.fromRGBO(188, 52, 143, .2),
    200: const Color.fromRGBO(188, 52, 143, .3),
    300: const Color.fromRGBO(188, 52, 143, .4),
    400: const Color.fromRGBO(188, 52, 143, .5),
    500: const Color.fromRGBO(188, 52, 143, .6),
    600: const Color.fromRGBO(188, 52, 143, .7),
    700: const Color.fromRGBO(188, 52, 143, .8),
    800: const Color.fromRGBO(188, 52, 143, .9),
    900: const Color.fromRGBO(188, 52, 143, 1),
  };
  MaterialColor get materialColor => MaterialColor(0xffbc348f, color);
}
