import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/utils/ui_const.dart';

class customTextFormFild extends StatelessWidget {
  final BuildContext? context;
  final TextEditingController controller;
  final Key? filedKey;
  final String? hintText;
  final bool isSecurePass;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final bool isFilled;
  final ValueChanged? onChanged;
  final bool isPrefixIcon;
  final bool isSuffixIcon;
  final TextInputType inputType;
  final bool isSuffix;
  final String? suffixText;
  final bool isPrefix = false;
  final String? prefixText;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final double? radiusSet;
  final bool border;
  final Function(String)? onFieldSubmitted;
  final Function()? suffixTap;
  final EdgeInsets? padding;
  final bool customPadding;
  final int? maxLength;
  final double? borderWidth;
  final Color? borderColor;

  const customTextFormFild({
    super.key,
    this.context,
    required this.controller,
    this.onFieldSubmitted,
    required this.inputType,
    this.filedKey,
    this.hintText,
    this.isSecurePass = false,
    this.fillColor,
    this.focusNode,
    required this.isFilled,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.onSaved,
    this.prefixIcon,
    this.prefixText,
    this.radiusSet,
    this.suffixIcon,
    this.validator,
    this.suffixText,
    this.suffixTap,
    this.isSuffixIcon = false,
    this.isPrefixIcon = false,
    this.border = true,
    this.isSuffix = false,
    this.padding,
    this.customPadding = false,
    this.maxLength,
    this.borderWidth,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: isSecurePass,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      maxLength: maxLength,
      cursorColor: Colors.black38,
      enabled: true,
      style: AppTextStyle.text2(context: context),
      buildCounter: (context,
              {required currentLength,
              required isFocused,
              required maxLength}) =>
          null,
      decoration: InputDecoration(
          contentPadding: customPadding
              ? padding
              : isSuffixIcon && isPrefixIcon
                  ? null
                  : edgeInsetsOnly(4, 4, 1, 1),
          enabled: true,
          filled: isFilled,
          fillColor: fillColor ?? Colors.white,
          hintStyle:
              AppTextStyle.text2(context: context, color: Colors.black38),
          hintText: hintText,
          // suffixText: isSuffix ? suffixText! : null,
          suffixStyle: AppTextStyle.tittleSmall4(context: context),
          focusColor: Colors.black26,
          hoverColor: Colors.black12,
          // prefixText: isPrefix ? prefixText! : null ,
          // prefix: isPrefix ? Padding(
          //   padding: const EdgeInsets.only(right: 3.0),
          //   child: Container(
          //     padding: EdgeInsets.all(3),
          //     color: Colors.black12,
          //     child: Text(prefixText!,style: TextStyle(
          //         color: Colors.black38, fontSize: 20, fontWeight: FontWeight.w500),),
          //   ),
          // ) : null,

          prefixIcon: isPrefixIcon
              ? Icon(
                  prefixIcon,
                  color: Colors.black38,
                  size: 20.sp,
                )
              : null,
          suffixIcon: isSuffixIcon
              ? InkWell(
                  onTap: suffixTap,
                  child: Icon(
                    suffixIcon,
                    color: Colors.black38,
                    size: 20.sp,
                  ))
              : null,
          border: border == true
              ? OutlineInputBorder(
                  borderRadius: radiusAll(radiusSet ?? 2.5),
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.black12,
                      width: borderWidth ?? 2),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.black12.withOpacity(0.2)),
                ),
          enabledBorder: border == true
              ? OutlineInputBorder(
                  borderRadius: radiusAll(radiusSet ?? 2.5),
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.black12,
                      width: borderWidth ?? 2),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.black12.withOpacity(0.2)),
                ),
          focusedBorder: border == true
              ? OutlineInputBorder(
                  borderRadius: radiusAll(radiusSet ?? 2.5),
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.black12,
                      width: borderWidth ?? 2),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.black12.withOpacity(0.2)),
                ),
          errorBorder: border == true
              ? OutlineInputBorder(
                  borderRadius: radiusAll(radiusSet ?? 2.5),
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.black12,
                      width: borderWidth ?? 2),
                )
              : null,
          errorStyle: AppTextStyle.text4(
              context: context, color: const Color(0xffF79500))),
    );
  }
}
// Widget customTextFormFild({
  
// }){
 
// }