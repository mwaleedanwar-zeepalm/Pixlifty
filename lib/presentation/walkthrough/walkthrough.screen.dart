import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'controllers/walkthrough.controller.dart';

class WalkthroughScreen extends StatelessWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<WalkthroughController>(
      init: WalkthroughController(),
      initState: (_) {},
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: PageView(
                            controller: controller.pageController,
                            children: const [
                              WalkthroughScreenOne(),
                              WalkthroughScreenTwo(),
                              WalkthroughScreenThree(),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.65),
                          child: SmoothPageIndicator(
                            controller: controller.pageController,
                            effect: const WormEffect(
                              activeDotColor: AppColors.kPrimary,
                              dotColor: AppColors.kGreyScale300,
                            ),
                            count: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomSheet: Container(
              width: Get.width,
              color: AppColors.kWhite,
              height: 118.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (!controller.end)
                    RoundedButtonLite(
                      onTap: () {
                        Get.offAndToNamed('/auth-wrapper');
                      },
                      label: 'Skip',
                    ),
                  RoundedButton(
                    onTap: controller.nextPage,
                    width: controller.end ? Get.width : 200.w,
                    label: controller.end ? 'Continue' : 'Next',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// First screen of the initial walkthrough
class WalkthroughScreenOne extends StatelessWidget {
  const WalkthroughScreenOne({super.key});
  WalkthroughController get controller => Get.find<WalkthroughController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(Images.welcome1),
        ),
        Align(
          alignment: Alignment(0, 0.45),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.kWhite,
                  blurRadius: 20.r,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  'Enhance your photos instantly in one click',
                  maxLines: 2,
                  style: AppTypography.h3Bold,
                  textAlign: TextAlign.center,
                ),
                DecoratedBox(
                  decoration: const BoxDecoration(color: AppColors.kWhite),
                  child: Column(
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                        maxLines: 2,
                        style: AppTypography.BodyXlRegular,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WalkthroughScreenTwo extends StatelessWidget {
  const WalkthroughScreenTwo({super.key});
  WalkthroughController get controller => Get.find<WalkthroughController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(Images.welcome2),
        ),
        Align(
          alignment: Alignment(0, 0.45),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.kWhite,
                  blurRadius: 20.r,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  'Unleash your creativity with AI toolbox',
                  maxLines: 2,
                  style: AppTypography.h3Bold,
                  textAlign: TextAlign.center,
                ),
                DecoratedBox(
                  decoration: const BoxDecoration(color: AppColors.kWhite),
                  child: Column(
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                        maxLines: 2,
                        style: AppTypography.BodyXlRegular,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WalkthroughScreenThree extends StatelessWidget {
  const WalkthroughScreenThree({super.key});
  WalkthroughController get controller => Get.find<WalkthroughController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(Images.welcome3),
        ),
        Align(
          alignment: Alignment(0, 0.45),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.kWhite,
                  blurRadius: 20.r,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  'Enjoy all the benefits with pro subscriptions',
                  maxLines: 2,
                  style: AppTypography.h3Bold,
                  textAlign: TextAlign.center,
                ),
                DecoratedBox(
                  decoration: const BoxDecoration(color: AppColors.kWhite),
                  child: Column(
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                        maxLines: 2,
                        style: AppTypography.BodyXlRegular,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
