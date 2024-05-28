// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_fonts.dart';
import 'package:smart_pay/core/resources/app_size.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // colors of the app

    scaffoldBackgroundColor: ColorManager.appBgColor,
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    // ripple color
    splashColor: ColorManager.primary.withOpacity(0.3),

    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.transparent,
      elevation: AppSize.s0,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s16,
      ),
      iconTheme: IconThemeData(color: ColorManager.primary),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.green,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),

    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),

    // Text theme
    // Text theme
    textTheme: TextTheme(
      headlineSmall: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s16,
      ),
      titleMedium: getMediumStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s14,
      ),
      titleSmall: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s14,
      ),
      bodySmall: getRegularStyle(color: ColorManager.darkGrey),
      bodyLarge: getRegularStyle(color: ColorManager.darkGrey),
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: getRegularStyle(
          color: ColorManager.lightGrey.withOpacity(0.5),
          fontSize: 15,
        ),
        suffixStyle: TextStyle(color: ColorManager.primary),
        prefixStyle: TextStyle(color: ColorManager.primary),
        labelStyle: getRegularStyle(
          color: ColorManager.lightGrey.withOpacity(0.5),
          fontSize: 15,
        ),
        errorStyle: getRegularStyle(color: ColorManager.error),
        // borders
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.grey.withOpacity(0.3),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.error,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.error,
            // width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
        ),
        // prefix
        prefixIconColor: ColorManager.primary,
        // surfix
        suffixIconColor: ColorManager.primary),
    colorScheme: ColorScheme(
      background: ColorManager.appBgColor,
      brightness: Brightness.light,
      primary: ColorManager.primary,
      onPrimary: ColorManager.primary,
      secondary: ColorManager.secondaryColor,
      onSecondary: ColorManager.secondaryColor,
      error: ColorManager.error,
      onError: ColorManager.error,
      surface: ColorManager.primary,
      onSurface: ColorManager.primary,
      onBackground: Colors.transparent,
    ),
  );
}
