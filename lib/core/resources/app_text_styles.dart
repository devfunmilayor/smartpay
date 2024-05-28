import 'package:flutter/material.dart';

import 'package:smart_pay/core/resources/app_fonts.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color,
    {TextDecoration? decoration,
    double? letterSpacing,
    TextLeadingDistribution? leadingDistribution}) {
  return TextStyle(
      letterSpacing: letterSpacing,
      height: 1.5,
      leadingDistribution: leadingDistribution,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      decoration: decoration,
      color: color);
}

// regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    TextDecoration? decoration,
    double? letterSpacing,
    TextLeadingDistribution? leadingDistribution}) {
  return _getTextStyle(
      leadingDistribution: leadingDistribution,
      letterSpacing: letterSpacing,
      fontSize,
      FontConstants.fontFamily,
      FontWeightManager.regular,
      color,
      decoration: decoration);
}

// light text style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    TextDecoration? decoration,
    double? letterSpacing,
    TextLeadingDistribution? leadingDistribution}) {
  return _getTextStyle(
      leadingDistribution: leadingDistribution,
      letterSpacing: letterSpacing,
      fontSize,
      FontConstants.fontFamily,
      FontWeightManager.light,
      color,
      decoration: decoration);
}

// bold text style
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    TextDecoration? decoration,
    double? letterSpacing,
    TextLeadingDistribution? leadingDistribution}) {
  return _getTextStyle(
      leadingDistribution: leadingDistribution,
      letterSpacing: letterSpacing,
      fontSize,
      FontConstants.fontFamily,
      FontWeightManager.bold,
      color,
      decoration: decoration);
}

// semiBold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    TextDecoration? decoration,
    double? letterSpacing,
    TextLeadingDistribution? leadingDistribution}) {
  return _getTextStyle(
      leadingDistribution: leadingDistribution,
      letterSpacing: letterSpacing,
      fontSize,
      FontConstants.fontFamily,
      FontWeightManager.semiBold,
      color,
      decoration: decoration);
}

// extrabold text style
TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    TextDecoration? decoration,
    double? letterSpacing,
    TextLeadingDistribution? leadingDistribution}) {
  return _getTextStyle(
      leadingDistribution: leadingDistribution,
      letterSpacing: letterSpacing,
      fontSize,
      FontConstants.fontFamily,
      FontWeightManager.extraBold,
      color,
      decoration: decoration);
}

// medium text style
TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    TextDecoration? decoration,
    double? letterSpacing,
    TextLeadingDistribution? leadingDistribution}) {
  return _getTextStyle(
      leadingDistribution: leadingDistribution,
      letterSpacing: letterSpacing,
      fontSize,
      FontConstants.fontFamily,
      FontWeightManager.medium,
      color,
      decoration: decoration);
}
