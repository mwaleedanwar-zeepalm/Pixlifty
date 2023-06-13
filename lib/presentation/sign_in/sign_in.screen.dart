import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/simple_button.dart';
import 'package:pixlify/components/widgets/simple_check_box.dart';
import 'package:pixlify/components/widgets/skinny_password_text_form_field.dart';
import 'package:pixlify/components/widgets/skinny_text_form_field.dart';

import 'package:iconly/iconly.dart';
import 'package:pixlify/components/widgets/social_media_tile.dart';
import 'package:pixlify/components/widgets/success_dialog.dart';
import 'package:pixlify/presentation/auth_wrapper/controllers/auth_wrapper.controller.dart';
import 'package:pixlify/presentation/screens.dart';
import 'package:pixlify/presentation/sign_in/controllers/sign_in.controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<SignInController>(
      init: SignInController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          body: Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: MediaQuery.of(context).padding.top,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back<void>();
                      },
                      icon: Icon(
                        IconlyLight.arrow_left,
                        size: 28.w,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'Welcome back 👋',
                      style: AppTypography.h3Bold,
                    ),
                    Text(
                      'Please enter your email & password to sign in.',
                      style: AppTypography.BodyXlRegular,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'Email',
                      style: AppTypography.BodyLBold,
                    ),
                    SkinnyTextFormField(
                      controller: controller.email,
                      hintText: 'Email',
                      suffixIcon: Icon(
                        IconlyLight.message,
                        size: 28.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Password',
                      style: AppTypography.BodyLBold,
                    ),
                    SkinnyPasswordTextFormField(
                      controller: controller.pwd,
                      hintText: 'Password',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SimpleCheckBox(
                          checked: controller.checked,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Remember me',
                          style: AppTypography.BodyLSemiBold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    const Divider(
                      color: AppColors.kGreyScale200,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('/forgot-password');
                        },
                        child: Text(
                          'Forgot password?',
                          style: AppTypography.h6Bold.copyWith(
                            color: AppColors.kPrimary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
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
                            Get.offAndToNamed('/sign-up');
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
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.kGreyScale200,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            'or continue with',
                            style: AppTypography.h6Medium.copyWith(
                              color: AppColors.kGreyScale700,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.kGreyScale200,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 20.h,
                      width: double.maxFinite,
                      color: AppColors.kWhite,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialMediaTile(
                          onTap: () {},
                          icon: SvgPicture.asset(Images.googleLogo),
                        ),
                        SocialMediaTile(
                          onTap: () {},
                          icon: SvgPicture.asset(Images.appleLogo),
                        ),
                        SocialMediaTile(
                          onTap: () {},
                          icon: SvgPicture.asset(Images.facebookLogo),
                        ),
                        SocialMediaTile(
                          onTap: () {},
                          icon: SvgPicture.asset(Images.twitterLogo),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    RoundedButton(
                      onTap: () async {
                        await showSuccessDialog(
                          title: 'Sign in Successful!',
                          description:
                              'Please wait...\nYou will be directed to the homepage.',
                        );
                        log('signging in');
                        Get
                          ..back<void>()
                          ..find<AuthWrapperController>().signIn();
                      },
                      label: 'Sign in',
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
