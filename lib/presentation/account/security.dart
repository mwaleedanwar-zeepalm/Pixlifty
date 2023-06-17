import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';
import 'package:pixlify/presentation/account/controllers/account.controller.dart';
import 'package:pixlify/theme.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetX<AccountController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back<void>(),
            icon: Icon(
              IconlyLight.arrow_left,
              color: theme.defaultIconColor,
            ),
          ),
          title: Text(
            'Security',
            style: AppTypography.h4Bold.copyWith(
              color: theme.primaryTextColor,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          children: [
            SizedBox(
              height: 20.h,
            ),
            ListTile(
              title: Text(
                'Remember Me',
                style: AppTypography.h5SemiBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              trailing: Switch(
                value: controller.rememberMe,
                onChanged: (checked) {
                  controller
                    ..rememberMe = checked
                    ..update();
                },
                activeColor: AppColors.kPrimary,
                inactiveTrackColor: AppColors.kGreyScale300,
                inactiveThumbColor: AppColors.kWhite,
                trackOutlineColor: MaterialStatePropertyAll(
                  Colors.transparent,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Biometric ID',
                style: AppTypography.h5SemiBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              trailing: Switch(
                value: controller.bioMetricId,
                onChanged: (checked) {
                  controller
                    ..bioMetricId = checked
                    ..update();
                },
                activeColor: AppColors.kPrimary,
                inactiveTrackColor: AppColors.kGreyScale300,
                inactiveThumbColor: AppColors.kWhite,
                trackOutlineColor: MaterialStatePropertyAll(
                  Colors.transparent,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Face ID',
                style: AppTypography.h5SemiBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              trailing: Switch(
                value: controller.faceId,
                onChanged: (checked) {
                  controller.faceId = checked;
                },
                activeColor: AppColors.kPrimary,
                inactiveTrackColor: AppColors.kGreyScale300,
                inactiveThumbColor: AppColors.kWhite,
                trackOutlineColor: MaterialStatePropertyAll(
                  Colors.transparent,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'SMS Authenticator',
                style: AppTypography.h5SemiBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              trailing: Switch(
                value: controller.smsAuth,
                onChanged: (checked) {
                  controller
                    ..smsAuth = checked
                    ..update();
                },
                activeColor: AppColors.kPrimary,
                inactiveTrackColor: AppColors.kGreyScale300,
                inactiveThumbColor: AppColors.kWhite,
                trackOutlineColor: MaterialStatePropertyAll(
                  Colors.transparent,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Google Authenticator',
                style: AppTypography.h5SemiBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              trailing: Switch(
                value: controller.googleAuth,
                onChanged: (checked) {
                  controller
                    ..googleAuth = checked
                    ..update();
                },
                activeColor: AppColors.kPrimary,
                inactiveTrackColor: AppColors.kGreyScale300,
                inactiveThumbColor: AppColors.kWhite,
                trackOutlineColor: MaterialStatePropertyAll(
                  Colors.transparent,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Device Management',
                style: AppTypography.h5SemiBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              trailing: Icon(
                IconlyLight.arrow_right_2,
                color: theme.defaultIconColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            RoundedButtonLite(
              onTap: () {},
              label: 'Change Password',
            ),
          ],
        ),
      ),
    );
  }
}
