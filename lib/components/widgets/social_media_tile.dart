import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';

/// Tile version of the social media button. Contains only the icon.
class SocialMediaTile extends StatelessWidget {
  const SocialMediaTile({required this.onTap, required this.icon, super.key});
  final Widget icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 84.w,
        height: 56.w,
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(
            color: AppColors.kGreyScale200,
          ),
        ),
        alignment: Alignment.center,
        child: icon,
      ),
    );
  }
}
