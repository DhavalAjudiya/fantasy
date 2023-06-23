import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../res/app_colors.dart';
import '../utils/size_utils.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final Widget? suffixIcon;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final String? labelText;
  final TextStyle? labelStyle;
  final bool readOnly;
  final AutovalidateMode? autoValidateMode;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool isShadow;
  final bool isBorderStyle;
  final bool isSuffix;
  final int? maxLines;

  const CommonTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.hintStyle,
    this.prefixIcon,
    this.labelText,
    this.labelStyle,
    this.readOnly = false,
    this.autoValidateMode,
    this.contentPadding,
    this.textInputAction,
    this.isShadow = false,
    this.isSuffix = false,
    this.inputFormatters,
    this.isBorderStyle = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isShadow == true
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 40,
              child: TextFormField(
                // key: ,
                inputFormatters: inputFormatters,
                autovalidateMode: AutovalidateMode.disabled,
                readOnly: readOnly,
                obscureText: obscureText,
                controller: controller,
                keyboardType: keyboardType,
                onChanged: onChanged,
                validator: validator,
                maxLines: maxLines ?? 2,
                textInputAction: textInputAction ?? TextInputAction.newline,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: color,
                  fontFamily: fontFamily,
                ),
                autocorrect: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  disabledBorder: const UnderlineInputBorder(
                      borderSide:  BorderSide(color: AppColor.backgroundColor)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.createButton)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.backgroundColor)),
                  errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.backgroundColor)),
                  focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.backgroundColor)),
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: AppColor.textColor.withOpacity(0.4), fontWeight: FontWeight.w400),
                  labelText: labelText,
                  labelStyle: labelStyle,
                  prefixIcon: prefixIcon,
                  suffixIcon: isSuffix == true
                      ? Icon(
                          Icons.arrow_forward_ios,
                          color: AppColor.black.withOpacity(0.7),
                          size: SizeUtils.horizontalBlockSize * 4.5,
                        )
                      : suffixIcon,
                ),
              ),
            ),
          )
        : TextFormField(
            // key: ,
            inputFormatters: inputFormatters,
            autovalidateMode: AutovalidateMode.disabled,
            readOnly: readOnly,
            obscureText: obscureText,
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            validator: validator,
            maxLines: maxLines ?? 2,
            textInputAction: textInputAction ?? TextInputAction.newline,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
              fontFamily: fontFamily,
            ),
            autocorrect: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: AppColor.textColor.withOpacity(0.4), fontWeight: FontWeight.w400),
              labelText: labelText,
              labelStyle: labelStyle,
              prefixIcon: prefixIcon,
              suffixIcon: isSuffix == true
                  ? Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.black.withOpacity(0.7),
                      size: SizeUtils.horizontalBlockSize * 4.5,
                    )
                  : suffixIcon,
              border: InputBorder.none,
              fillColor:
                  isBorderStyle == true ? AppColor.createButton.withOpacity(0.5) : AppColor.white,
              filled: true,
            ),
          );
    /*   : Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: isShadow == true ? Colors.transparent : AppColor.black.withOpacity(0.3),
                    spreadRadius: isShadow == true ? 0 : 1,
                    offset: isShadow == true ? Offset.zero : const Offset(2, 4),
                    blurRadius: isShadow == true ? 0 : 8),
              ],
            ),
            child: TextFormField(
              // key: ,
              textAlign: TextAlign.center,
              inputFormatters: inputFormatters,
              autovalidateMode: AutovalidateMode.disabled,
              readOnly: readOnly,
              obscureText: obscureText,
              controller: controller,
              keyboardType: keyboardType,
              onChanged: onChanged,
              validator: validator,
              textInputAction: textInputAction ?? TextInputAction.next,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: color,
                fontFamily: fontFamily,
              ),
              autocorrect: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    SizeUtils.fSize_12(),
                  ),
                  borderSide: BorderSide(color: AppColor.black.withOpacity(0.7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    SizeUtils.fSize_12(),
                  ),
                  borderSide: BorderSide(color: AppColor.black.withOpacity(0.7)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    SizeUtils.fSize_12(),
                  ),
                  borderSide: BorderSide(color: AppColor.black.withOpacity(0.7)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    SizeUtils.fSize_12(),
                  ),
                  borderSide: BorderSide(color: AppColor.black),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    SizeUtils.fSize_12(),
                  ),
                  borderSide: BorderSide(color: AppColor.black),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                    color: AppColor.textColor.withOpacity(0.4), fontWeight: FontWeight.w400),
                labelText: labelText,
                labelStyle: labelStyle,
                prefixIcon: prefixIcon,
                suffixIcon: isSuffix == true
                    ? Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.black.withOpacity(0.7),
                        size: SizeUtils.horizontalBlockSize * 4.5,
                      )
                    : suffixIcon,
                border: InputBorder.none,
                fillColor: AppColor.white,
                filled: true,
              ),
            ),
          );*/
  }
}
