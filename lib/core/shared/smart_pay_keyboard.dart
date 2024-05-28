import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';

class VerificationAndPinController {
  TextEditingController pinController = TextEditingController();
  TextEditingController amountControllerwithDot = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController bvn = TextEditingController();
  List<Map<String, dynamic>> keypad = [
    {'name': 'one', 'digit': '1'},
    {'name': 'two', 'digit': '2'},
    {'name': 'three', 'digit': '3'},
    {'name': 'four', 'digit': '4'},
    {'name': 'five', 'digit': '5'},
    {'name': 'six', 'digit': '6'},
    {'name': 'seven', 'digit': '7'},
    {'name': 'eight', 'digit': '8'},
    {'name': 'nine', 'digit': '9'},
    {'name': 'none', 'digit': ''},
    {'name': 'zero', 'digit': '0'},
    {'name': 'delete', 'digit': ''},
  ];

  List<Map<String, dynamic>> keypadwithDot = [
    {'name': 'one', 'digit': '1'},
    {'name': 'two', 'digit': '2'},
    {'name': 'three', 'digit': '3'},
    {'name': 'four', 'digit': '4'},
    {'name': 'five', 'digit': '5'},
    {'name': 'six', 'digit': '6'},
    {'name': 'seven', 'digit': '7'},
    {'name': 'eight', 'digit': '8'},
    {'name': 'nine', 'digit': '9'},
    {'name': 'dot', 'digit': '*'},
    {'name': 'zero', 'digit': '0'},
    {'name': 'delete', 'digit': ''},
  ];

  void onInit() {}

  void onReady() {}

  void onClose() {
    amountControllerwithDot.clear();
    phoneNumberCtrl.clear();
    pinController.clear();
  }

  void inputCode(int selectedIndex) {
    pinController.append(keypad[selectedIndex]['digit'], 6);
    amountControllerwithDot.append(keypadwithDot[selectedIndex]['digit'], 10);
    phoneNumberCtrl.append(keypad[selectedIndex]['digit'], 12);
    bvn.append(keypad[selectedIndex]['digit'], 11);
  }

  void deleteInput(int selectedIndex) {
    pinController.delete();
    phoneNumberCtrl.delete();
    bvn.delete();
    amountControllerwithDot.delete();
  }

  void verifyAccount() {
    print(pinController.text);
  }
}

Widget keypad(VerificationAndPinController verificationCtrl) {
  return Container(
    alignment: Alignment.center,
    child: GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 30,
          mainAxisSpacing: 0,
          childAspectRatio: 1.15),
      itemCount: verificationCtrl.keypadwithDot.length,
      itemBuilder: (BuildContext ctx, index) {
        return InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onTap: verificationCtrl.keypadwithDot[index]['name'] == 'none'
                ? null
                : () {
                    verificationCtrl.keypadwithDot[index]['name'] == 'delete'
                        ? verificationCtrl.deleteInput(index)
                        : verificationCtrl.inputCode(index);
                  },
            child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(),
                child: verificationCtrl.keypadwithDot[index]['name'] == 'delete'
                    ? Icon(CupertinoIcons.delete_left,
                        color: ColorManager.black, size: 18)
                    : Text(verificationCtrl.keypadwithDot[index]['digit'],
                        style: getBoldStyle(
                            color: ColorManager.black, fontSize: 20))));
      },
    ),
  );
}
