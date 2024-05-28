import 'dart:developer';

import 'package:flutter/services.dart';

mixin SmartPayValidate {
  final RegExp _nigerianNumberFull = RegExp(r'^(234|0)(7|8|9)(0|1)\d{8}$');

  final RegExp numberRegExp = RegExp(r'^\d+$');

  // final RegExp _passwordRegExp =
  //     RegExp(r'^(?=.[a-zA-Z])(?=.[@$!%?&])(?=.\d)[A-Za-z\d@$!%*?&]{8,}$');
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$',
  );

  String? validateUserInput(String? txt, String? label) {
    String p = txt?.trim() ?? '';
    if (p.isEmpty) {
      return '$label is required';
    } else if (p.replaceAll(' ', '').length < 2) {
      return '$label is too short';
    }

    return null;
  }

  String? validateAccountNumberL(String? txt, String? lable) {
    String p = txt?.trim() ?? '';
    if (p.isEmpty) {
      return '$lable is required';
    } else if (p.length < 10) {
      return '$lable is less than 10 string length';
    } else if (p.length > 10) {
      return '$lable can\'t be more than 10 string length';
    }

    return null;
  }

  String? validateReedemVal(String? txt, String? assevalue) {
    String amountTxt = txt?.trim() ?? '';
    String a = assevalue?.trim() ?? '';
    String v = a.replaceAll(',', '');
    String r = amountTxt.replaceAll(',', '');
    log('r: $r');
    if (amountTxt.isEmpty) {
      return 'Amount is required';
    }
    if (num.parse(r) < 10000) {
      return 'Amount must be at least NGN 10,000.00';
    }
    if (num.parse(r) > num.parse(v)) {
      return 'Balance is insufficient';
    }

    return null;
  }

  String? bvnNoValidator(String? number, {bool allowEmpty = false}) {
    number = number?.replaceAll(' ', '');
    if (number?.isEmpty ?? true) {
      return allowEmpty ? null : 'Please enter your BVN';
    } else if (!numberRegExp.hasMatch(number!)) {
      return 'BVN can only include numbers ';
    } else if (number.length != 11) {
      return 'BVN number must be 11 digits';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    RegExp regex =
        RegExp(r'^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$');
    String p = password?.trim() ?? '';
    if (p.isEmpty) {
      return 'Please enter password';
    } else if (p.length < 6) {
      return 'password must be at least 6 characters';
    } else if (!regex.hasMatch(p)) {
      return 'Password must contain lowercase, Upper Case, number and a special character';
    }
    return null;
  }

  String? validateEmail(String? value, [bool allowEmpty = false]) {
    String val = value.toString();
    String emailPattern =
        r"(^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z])";

    RegExp regExp = RegExp(emailPattern);

    ///returning var cus email is optional
    if (val.isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(val)) {
      return 'Invalid E-mail';
    }

    return null;
  }

  String? validateQuantity(
    String? p0,
  ) {
    int? num = int.tryParse(p0 ?? '');
    if (num != null && num > 20) {
      return 'Quantity cannot be more than 20';
    }
    return null;
  }

  String? rePasswordValidator(String password, String pass) {
    RegExp regex =
        RegExp(r'^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$');
    if (password != pass) {
      return 'Passwords do not match';
    } else if (!regex.hasMatch(pass)) {
      return 'Password must contain lowercase, upperCase, number and a special character';
    }
    return null;
  }

  String? newpasswordValidator(String password, [bool allowEmpty = false]) {
    RegExp regex =
        RegExp(r'^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$');
    if (password.isEmpty) {
      return 'Please enter password';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!regex.hasMatch(password)) {
      return 'Password must contain a letter, number and a special character';
    }
    return null;
  }

  String? emailValidator(String? email, [bool allowEmpty = false]) {
    String e = email?.trim() ?? '';
    log('e ::: $e');
    if (e.isEmpty) {
      return allowEmpty ? null : 'Please enter email';
    } else if (!_emailRegExp.hasMatch(e)) {
      log('error $e');

      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateMinorEmail(String? value, String? guard,
      [bool allowEmpty = false]) {
    String val = value.toString();
    String emailPattern =
        r"(^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z])";

    RegExp regExp = RegExp(emailPattern);

    ///returning var cus email is optional
    if (val.isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(val)) {
      return 'Invalid E-mail';
    } else if (val == guard) {
      return 'Guardian E-mail and Minor E-mail can\'t be the same';
    }

    return null;
  }

  // String? rePasswordValidator(String password, String pass) {
  //   if (password != pass) return 'Passwords do not match';
  //   return null;
  // }

  String? pinValidate(String? text, [bool allowEmpty = false]) {
    text = text?.trim() ?? '';
    if (text.isEmpty) {
      return 'Field can\'t be empty';
    } else if (text.length < 4) {
      return '';
    }
    return null;
  }

  String? otpValidator(String? text) {
    text = text?.trim() ?? '';
    log('text: $text');
    if (text.isEmpty) {
      return 'Otp must be  4 digits';
    } else if (text.length < 4) {
      return 'Otp must be  4 digits';
    }
    return '';
  }

  String? phoneNumberFullValidator(String? number,
      [bool allowEmpty = false, bool restrictToNigeria = true]) {
    number = number!.replaceAll(' ', '');
    if (number.isEmpty) {
      return allowEmpty ? null : 'Please enter phone number';
    } else if (!numberRegExp.hasMatch(number)) {
      return 'Phone number can only include numbers ';
    } else if (!_nigerianNumberFull.hasMatch(number)) {
      return 'Please enter a valid Nigerian number';
    }
    return null;
  }

  String? validateUKPhoneNumber(String? input) {
    if (input == null || input.isEmpty) return 'Please enter a phone number';

    String digits = input.replaceAll(RegExp(r'\s+'), '');

    RegExp ukPhoneRegex = RegExp(r'^44\d{10}$');
    if (!ukPhoneRegex.hasMatch(digits)) {
      return 'Please enter a valid UK phone number';
    }
    return null;
  }
}

class PhoneNumberFormatter extends TextInputFormatter with SmartPayValidate {
  final int maxLength;

  PhoneNumberFormatter({this.maxLength = 11});
  int position = 0;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = sanitizeNumber(newValue.text);
    if (newValue.selection.baseOffset == 0) return newValue;
    position = newValue.selection.baseOffset;
    text = formatText(text) ?? '';

    if (newValue.selection.baseOffset < text.length - 1) {
      position = newValue.selection.baseOffset;
    }
    return newValue.copyWith(
        text: text,
        selection: TextSelection.fromPosition(TextPosition(offset: position)));
  }

  String? formatText(String text) {
    text = sanitizeNumber(text);
    int startOffset = 2;
    position = 0;
    var buffer = StringBuffer();
    if (text[0] == '0') startOffset = 3;
    for (int i = 0; i < text.length; i++) {
      if (numberRegExp.hasMatch(text[i])) {
        position++;
        buffer.write(text[i]);
      }
      if ((i == startOffset ||
              i == startOffset + 4 ||
              i == startOffset + 8 ||
              (startOffset == 2 && i == startOffset + 9)) &&
          i != text.length - 1) {
        position++;
        buffer.write(' ');
      }
    }
    return buffer.toString().trim();
  }
}

String sanitizeNumber(String number) {
  String? text = number.trim();
  text = text.replaceAll('-', '');
  text = text.replaceAll('(', '');
  text = text.replaceAll(')', '');
  text = text.replaceAll(' ', '');
  return text;
}

class UKPhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (!newText.startsWith('44') && newText.length > 1) {
      newText = '44$newText';
    }

    String formattedText = '';
    for (int i = 0; i < newText.length; i++) {
      if (i == 2) formattedText += ' ';
      if (i == 6) formattedText += ' ';
      if (i == 9) formattedText += ' ';
      formattedText += newText[i];
    }

    if (formattedText.length > 14) {
      formattedText = formattedText.substring(0, 15);
    }

    int offset = newValue.selection.end;
    if (oldValue.text.length < formattedText.length) {
      offset += formattedText.length - oldValue.text.length;
    }
    offset = offset > formattedText.length ? formattedText.length : offset;

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int oldLength = oldValue.text.length;
    final int newLength = newValue.text.length;

    if (newLength < oldLength) {
      // Handle deletion case
      return newValue;
    }

    String text = newValue.text.replaceAll('/', '');

    if (text.length > 2) {
      text = text.substring(0, 2) + '/' + text.substring(2);
    }

    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
