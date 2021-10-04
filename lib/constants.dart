import 'package:flutter/material.dart';

int hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalColor = int.parse(newColor);
  return finalColor;
}

const String familyFont = 'Sofia';
Color kPrimaryColor = Color(hexColor('#6C63FF'));
//Color kPrimaryColor = Colors.black;
Color kPrimaryLightColor = Color(hexColor('##eeeeee'));
const String version = '1.0.0';
const String baseUrl = 'http://192.168.43.49:5000';
const String server = 'http://192.168.43.49:5000/hustler';
