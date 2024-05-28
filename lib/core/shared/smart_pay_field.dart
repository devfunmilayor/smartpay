import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/core/resources/app_colors.dart';
import 'package:smart_pay/core/resources/app_text_styles.dart';

class SmartPayField extends StatelessWidget {
  const SmartPayField(
      {super.key,
      this.controller,
      this.hintText,
      this.obscureText = false,
      this.label,
      this.inputformatters,
      required this.inputType,
      this.validate,
      required this.isLastField,
      this.enabled = true,
      this.expand = false,
      this.onTap,
      this.textfieldLabel,
      this.onSaved,
      this.maxLines = 1,
      this.focusNode,
      this.textInputAction,
      this.onEditingComplete,
      this.filledColor = false,
      this.onChanged,
      this.readonly = false,
      this.onFieldSubmitted,
      this.prefixIcon,
      this.maxLengthDrtChx,
      this.intiaVal,
      this.error,
      this.suffixIcon,
      this.isForSearch = false,
      this.hasTextfieldLabel,
      this.maxLength,
      this.textfieldHeight});

  final TextEditingController? controller;
  final String? hintText;
  final String? label, textfieldLabel;
  final TextInputType inputType;
  final bool isLastField;
  final bool? hasTextfieldLabel;
  final bool enabled, isForSearch, readonly;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final bool expand;
  final bool obscureText;
  final bool filledColor;
  final Function(String?)? onSaved;
  final String? Function(String?)? validate;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final double? textfieldHeight;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? intiaVal;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputformatters;
  final Widget? suffixIcon;
  final MaxLengthEnforcement? maxLengthDrtChx;
  final VoidCallback? onEditingComplete;
  final String? error;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isForSearch || hasTextfieldLabel == false
            ? SizedBox.shrink()
            : Container(
                margin: EdgeInsets.only(bottom: 13, top: 15),
                child: Text(textfieldLabel ?? '',
                    style: getRegularStyle(
                        color: ColorManager.spalshRentalColor, fontSize: 13)),
              ),
        TextFormField(
            maxLength: maxLength,
            key: ValueKey<String?>(intiaVal),
            cursorColor: isForSearch
                ? ColorManager.grey.withOpacity(0.02)
                : ColorManager.secondaryColor,
            cursorHeight: 15.h,
            cursorWidth: isForSearch ? 1.2.w : 1.2.w,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: enabled,
            textDirection: TextDirection.ltr,
            enableInteractiveSelection: true,
            textAlign: TextAlign.left,
            initialValue: intiaVal,
            focusNode: focusNode,
            obscureText: obscureText,
            onChanged: onChanged,
            onTap: onTap,
            controller: controller,
            validator: validate,
            maxLengthEnforcement: maxLengthDrtChx,
            onSaved: onSaved,
            inputFormatters: inputformatters,
            onFieldSubmitted: onFieldSubmitted,
            onEditingComplete: onEditingComplete,
            maxLines: maxLines,
            textInputAction:
                isLastField ? TextInputAction.done : TextInputAction.next,
            keyboardType: inputType,
            style: getBoldStyle(
              color: ColorManager.spalshRentalColor,
              fontSize: 12.5,
            ),
            decoration: InputDecoration(
                errorText: error,
                labelStyle: getLightStyle(
                    color: ColorManager.spalshRentalColor, fontSize: 12),
                errorMaxLines: 2,
                errorStyle: getLightStyle(color: Colors.red, fontSize: 11.sp),
                labelText: label ?? hintText,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
                hintText: hintText,
                fillColor
                        : ColorManager.spalshRentalColor.withOpacity(0.03),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: enabled == false ? 1 : 0,
                      color: isForSearch
                          ? Colors.transparent
                          :ColorManager.spalshRentalColor.withOpacity(0.03)),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: enabled == false ? 1 : 0,
                        color: isForSearch
                            ? Colors.transparent
                            : ColorManager.spalshRentalColor.withOpacity(0.03)),
                    borderRadius: BorderRadius.circular(10.r)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: enabled == false ? 1 : 0,
                        color: isForSearch
                            ? Colors.transparent
                            : ColorManager.spalshRentalColor.withOpacity(0.03)),
                    borderRadius: BorderRadius.circular(10.r)),
                hintStyle: getRegularStyle(
                    color: ColorManager.spalshRentalColor.withOpacity(0.4),
                    fontSize: 13))),
      ],
    );
  }
}
