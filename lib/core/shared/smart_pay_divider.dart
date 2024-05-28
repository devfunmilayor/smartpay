import 'package:flutter/material.dart';

import 'package:smart_pay/core/resources/app_colors.dart';

// buildRebakeDivider( final Color? color;
//   final double? height;)
class SmartPayDivider extends StatelessWidget {
  const SmartPayDivider({
    super.key,
    this.color,
    this.height,
  });

  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 0.5,
      decoration: BoxDecoration(
          color: color ?? ColorManager.darkPrimary.withOpacity(0.2)),
    );
  }
}
