import 'package:flutter/material.dart';
import 'package:smart_pay/core/app/smart_pay.dart.dart';
import 'package:smart_pay/core/enum/smart_pay_enum.dart';
import 'package:smart_pay/core/route/route_transition.dart';

class RouteConfigKQ {
  static back() => navigatorKey.currentState?.pop();

  static to({required Widget page}) {
    navigatorKey.currentState?.push(Transitions(
        transitionType: TransitionType.fade,
        duration: Duration(milliseconds: 500),
        curve: Curves.bounceInOut,
        reverseCurve: Curves.fastOutSlowIn,
        widget: page));
  }

  static void toReplacement({required page}) {
    navigatorKey.currentState?.pushReplacement(Transitions(
        transitionType: TransitionType.fade,
        duration: Duration(milliseconds: 500),
        curve: Curves.bounceInOut,
        reverseCurve: Curves.fastOutSlowIn,
        widget: page));
  }

  static toCloseAll({required Widget p}) {
    navigatorKey.currentState?.pushAndRemoveUntil(
        Transitions(
            transitionType: TransitionType.fade,
            duration: Duration(milliseconds: 500),
            curve: Curves.bounceInOut,
            reverseCurve: Curves.fastOutSlowIn,
            widget: p),
        (Route<dynamic> route) => false);
  }
}
