import 'package:flutter/material.dart';

class ColorManager {
  static Color appBgColor = HexColor.fromHex('#FFFFFF');
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#FC2417");
  static Color calenderNotification = HexColor.fromHex("#D0021B");

  static Color transparent = Colors.transparent;
  static Color green = Colors.green;
  static Color darkPrimary = HexColor.fromHex("#111827");
  static Color lightBlue = HexColor.fromHex("#31ABFC");
  static Color lightGrey = HexColor.fromHex("#999999");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");
  static Color secondaryColor = HexColor.fromHex("#111827");
  static Color primary = HexColor.fromHex("#2b7787");
  static Color black = HexColor.fromHex("#000000");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#53535C");
  static Color grey1 = HexColor.fromHex("#53535C");
  static Color grey2 = HexColor.fromHex("#8B8B92");
  static Color grey3 = HexColor.fromHex("#C1C1C1");
  static Color textfieldColor = HexColor.fromHex('#ECEDEE');

  static Color darkGreen = HexColor.fromHex("#3A531D");
  static Color tabIndicator = HexColor.fromHex("#F1A7B4");
  static Color lighterror = HexColor.fromHex("#FFE6E9");
  static Color lemon = HexColor.fromHex("#EDFFD9");
  static Color ratings = HexColor.fromHex("#F5C519");

  static Color spalshRentalColor = HexColor.fromHex('#242721');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', "").trim();

    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

final appVerticalGradientHighlight = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [ColorManager.spalshRentalColor, ColorManager.grey],
);
