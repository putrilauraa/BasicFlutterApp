// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

TextStyle HeaderStyle() {
  return TextStyle(
    color: Color.fromARGB(255, 35, 35, 35),
    fontSize: 35,
    fontFamily: "QuickSand",
    fontWeight: FontWeight.w700,
  );
}

TextStyle SubHeaderStyle() {
  return TextStyle(
    color: const Color.fromARGB(255, 68, 68, 68),
    fontSize: 25,
    fontFamily: "QuickSand",
    fontWeight: FontWeight.w600,
  );
}

TextStyle TitleStyle() {
  return TextStyle(
    color: Color.fromARGB(255, 35, 35, 35),
    fontSize: 20,
    fontFamily: "QuickSand",
    fontWeight: FontWeight.w600,
  );
}

TextStyle DescStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: "QuickSand",
    fontWeight: FontWeight.w500,
  );
}

TextStyle DescBoldStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: "QuickSand",
    fontWeight: FontWeight.w700,
  );
}

TextStyle SmallStyle() {
  return TextStyle(
    color: const Color.fromARGB(255, 68, 68, 68),
    fontSize: 9,
    fontFamily: "QuickSand",
    fontWeight: FontWeight.w600,
  );
}
