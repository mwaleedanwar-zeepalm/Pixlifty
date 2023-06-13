import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';

import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/alert_button.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/social_media.dart';
import 'package:pixlify/components/widgets/social_media_tile.dart';

/// First page after walkthrough. Shows available auth options.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Images.logo,
                height: 100.h,
              ),
              Text('Pixlify', style: AppTypography.h2Bold),
              Text(
                "Welcome! Let's dive in into your account!",
                style: AppTypography.BodyXlRegular,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.h,
              ),
              SocialMediaButton(
                icon: SvgPicture.asset(Images.googleLogo),
                platform: 'Google',
                onTap: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              SocialMediaButton(
                icon: SvgPicture.asset(Images.appleLogo),
                platform: 'Apple',
                onTap: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              SocialMediaButton(
                icon: SvgPicture.asset(Images.facebookLogo),
                platform: 'Facebook',
                onTap: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              SocialMediaButton(
                icon: SvgPicture.asset(Images.twitterLogo),
                platform: 'Twitter',
                onTap: () {},
              ),
              SizedBox(
                height: 50.h,
              ),
              RoundedButton(
                  onTap: () {
                    Get.toNamed("/sign-in");
                  },
                  label: 'Sign in with password'),
              SizedBox(
                height: 45.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: AppTypography.BodyLMedium,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/sign-up');
                    },
                    child: Text(
                      'Sign up',
                      style: AppTypography.BodyLBold.copyWith(
                        color: AppColors.kPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
