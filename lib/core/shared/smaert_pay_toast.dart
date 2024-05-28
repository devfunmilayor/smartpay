import 'package:flutter/material.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';

class ToasResp {
  static void errorMessage(String message) {
    BotToast.closeAllLoading();
    BotToast.showCustomLoading(
        duration: const Duration(seconds: 3),
        wrapToastAnimation: (controller, cancel, child) =>
            transition(child, controller),
        align: Alignment.topRight,
        toastBuilder: ((cancelFunc) {
          return toast(message, ColorManager.error, 200);
        }));
  }

  static void successMessage(String message) {
    BotToast.closeAllLoading();

    BotToast.showCustomLoading(
      duration: const Duration(seconds: 3),
      wrapToastAnimation: (controller, cancel, child) =>
          transition(child, controller),
      align: Alignment.topRight,
      toastBuilder: ((cancelFunc) => toast(message, ColorManager.green, 200)),
    );
  }
}

Widget toast(text, color, double width) {
  return Container(
    color: color,
    width: width,
    margin: const EdgeInsets.only(top: 15, right: 3),
    padding: const EdgeInsets.fromLTRB(10, 5.5, 10, 5.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            maxLines: 3,
            style: getRegularStyle(color: ColorManager.white, fontSize: 10),
          ),
        ),
        Icon(Icons.cancel_rounded, color: ColorManager.white, size: 14)
      ],
    ),
  );
}

Widget transition(child, controller) {
  return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.5, 0.3),
        end: const Offset(0, 0.3),
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.decelerate,
      )),
      child: Opacity(opacity: 1, child: child));
}
