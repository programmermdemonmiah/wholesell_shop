import 'package:flutter/material.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/utils/ui_const.dart';

Widget customButton({
  required String buttonName,
  required BuildContext context,
  final Color? fontColor,
  final Color? borderColor,
  final Color? bgColor,
  final double? radius,
  final Gradient? borderGradient,
  final bool isBorderGradient = false,
  final VoidCallback? onTap,
  final FocusNode? focusNode,
}) {
  return Material(
    color: Colors.transparent, // Keeps the background transparent
    child: Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: radiusAll(radius ?? 2.5),
        border: Border.all(
          width: 2,
          color: borderColor ?? AppColors.primaryColor,
        ),
        color: bgColor ?? AppColors.primaryColor,
      ),
      child: InkWell(
        onTap: onTap,
        focusNode: focusNode,
        splashColor: Colors.black12,
        child: Container(
          width: double.infinity,
          padding: edgeInsetsAll(2.2),
          child: Text(
            buttonName,
            textAlign: TextAlign.center,
            style: AppTextStyle.tittleBig3(
              context: context,
              color: fontColor ?? Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
