import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';

class SmartPinBox extends StatelessWidget {
  const SmartPinBox({
    super.key,
    this.value,
    this.borderColor,
    this.borderWidth = 0.5,
    this.disable = false,
    this.radius = 10,
    this.bgColor,
    this.textColor,
  });
  final String? value;
  final bool disable;
  final double radius;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: Column(
        children: [
          Center(
            child: Text(disable ? '*' : value ?? '',
                textAlign: TextAlign.center,
                style: getBoldStyle(color: ColorManager.black, fontSize: 20)),
          ),
          Container(
            height: 1,
            decoration: BoxDecoration(color: ColorManager.darkPrimary),
          )
        ],
      ),
    );
  }
}

class SmartNumericInput extends StatelessWidget {
  const SmartNumericInput({
    super.key,
    this.bgColor,
    this.textColor,
    required this.value,
    required this.onTaped,
    this.border,
  });
  final void Function(String) onTaped;
  final String value;

  final BoxBorder? border;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: () {
            onTaped(value);
            HapticFeedback.heavyImpact();
          },
          splashColor: Colors.transparent,
          child: Container(
            height: 50,
            width: 70,
            alignment: Alignment.center,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: getRegularStyle(color: ColorManager.black, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class SmartClearButton extends StatelessWidget {
  const SmartClearButton({
    super.key,
    required this.onTapped,
    this.iconColor,
    this.icon = CupertinoIcons.arrow_left_square,

    // CupertinoIcons.arrow_left_square,
  });
  final void Function() onTapped;
  final IconData icon;

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: onTapped,
          child: SizedBox(
              height: 60,
              width: 70,
              child: Icon(
                icon,
                color: iconColor ?? Theme.of(context).iconTheme.color,
              )),
        ),
      ],
    );
  }
}
