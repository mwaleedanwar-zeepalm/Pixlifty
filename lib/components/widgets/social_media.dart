import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    required this.icon,
    required this.platform,
    required this.onTap,
    this.width,
    this.height,
    this.style,
    super.key,
  });
  final void Function() onTap;
  final Widget icon;
  final String platform;
  final double? width;
  final TextStyle? style;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: (height ?? 60).h,
        width: width?.w ?? double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          border: Border.all(
            color: AppColors.kGreyScale200,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: height?.w ?? 18.w,
            ),
            Text(
              'Continue with $platform',
              style: style ?? AppTypography.BodyXlBold,
            ),
          ],
        ),
      ),
    );
  }
}
