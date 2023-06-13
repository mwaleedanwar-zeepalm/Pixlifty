import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';

/// Simple rounded button counterpart to simple button
class RoundedButtonLite extends StatelessWidget {
  const RoundedButtonLite({
    required this.onTap,
    required this.label,
    this.color,
    this.width,
    this.height,
    this.style,
    super.key,
  });
  final void Function() onTap;
  final String label;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: (width ?? 183).w,
        height: (height ?? 58).h,
        decoration: BoxDecoration(
          color: color ?? AppColors.kPrimary050,
          borderRadius: BorderRadius.circular(100.r),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: (style ?? AppTypography.BodyLBold).copyWith(
            color: AppColors.kPrimary,
          ),
        ),
      ),
    );
  }
}
