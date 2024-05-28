import 'package:flutter/material.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';
import 'package:smart_pay/core/route/route.dart';
import 'package:smart_pay/gen/assets.gen.dart';

class AppBarWithBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithBack({
    super.key,
    this.title = '',
    this.onTap,
    this.cTap = false,
    this.extraDef = const SizedBox.shrink(),
    this.w,
    this.doIwantLogoOnTheAppBar = false,
    this.actions,
  });

  final String title;
  final PreferredSize? w;
  final bool cTap;
  final bool doIwantLogoOnTheAppBar;
  final Function()? onTap;
  final List<Widget>? actions;

  final Widget extraDef;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: actions,
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: w,
        backgroundColor: ColorManager.appBgColor,
        leading: buildCircularWidget(
            click: () async {
              if (onTap != null) {
                await onTap!();
              }
              RouteConfigKQ.back();
            },
            w: Assets.svg.appArrow.svg()),
        centerTitle: true,
        title: Text(title,
            overflow: TextOverflow.ellipsis,
            style: getBoldStyle(
                color: ColorManager.spalshRentalColor, fontSize: 15)));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarWithoutBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithoutBack({
    super.key,
    this.title = '',
    this.onTap,
    this.cTap = false,
    this.extraDef = const SizedBox.shrink(),
    this.w,
    this.doIwantLogoOnTheAppBar = false,
  });

  final String title;
  final PreferredSize? w;
  final bool cTap;
  final bool doIwantLogoOnTheAppBar;
  final Function()? onTap;

  final Widget extraDef;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        bottom: w,
        backgroundColor: ColorManager.appBgColor,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(title,
            style: getBoldStyle(
                color: ColorManager.spalshRentalColor, fontSize: 15)));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

buildCircularWidget({Function()? click, Widget? w}) {
  return InkResponse(
    onTap: click,
    hoverColor: ColorManager.spalshRentalColor,
    borderRadius: BorderRadius.circular(30),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: ColorManager.darkPrimary.withOpacity(0.1), width: 1)),
        child: w ?? SizedBox.shrink(),
      ),
    ),
  );
}
