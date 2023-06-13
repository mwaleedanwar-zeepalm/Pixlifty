import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';

/// Custom text form field to be used in app. Requires a TextEditingController.
class SkinnyTextFormField extends StatelessWidget {
  // ignore: public_member_api_docs
  const SkinnyTextFormField({
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.enabled = true,
    this.borderRadius = 12,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.validator,
    this.width,
    super.key,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool enabled;
  final String hintText;
  final double borderRadius;
  final int maxLines;
  final String? Function(String?)? validator;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.kPrimary,
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword,
      enabled: enabled,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabled: enabled,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 18.h,
        ),
        constraints: BoxConstraints(
          maxWidth: width ?? Get.width,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.kGreyScale500, width: 1.w),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.kGreyScale500, width: 1.w),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kPrimary,
            width: 3.w,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kPrimary,
            width: 2.w,
          ),
        ),
        focusColor: AppColors.kGreyScale100,
        hintText: hintText,
        errorStyle: AppTypography.BodyMRegular.copyWith(
          color: AppColors.kAlertError,
        ),
        errorMaxLines: 1,
        disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: AppColors.kDarkDisabled,
          ),
        ),
        hintMaxLines: 1,
      ),
    );
  }
}
