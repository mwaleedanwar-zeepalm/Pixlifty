import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';

import 'controllers/home_view.controller.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<HomeViewController>(
      init: HomeViewController(),
      initState: (_) {},
      builder: (controller) {
        if (controller.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (controller.error) {
          return const Center(
            child: Text('Error'),
          );
        }
        return Padding(
          padding: EdgeInsets.only(
            right: 24.w,
            left: 24.w,
          ),
          child: Scaffold(
            appBar: AppBar(
              leadingWidth: 30.w,
              leading: SizedBox(
                height: 28.w,
                width: 28.w,
                child: SvgPicture.asset(Images.logo),
              ),
              title: Text(
                'Pixlify',
                style: AppTypography.h4Bold,
              ),
              centerTitle: true,
            ),
            body: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        AIToolboxBannerHome(),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Photos',
                              style: AppTypography.h4Bold,
                            ),
                            const Spacer(),
                            RoundedButtonLite(
                              onTap: () {
                                ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                              },
                              label: 'Open Gallery',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ];
              },
              body: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: controller.recentImages.length,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(6.0.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.file(
                        controller.recentImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class AIToolboxBannerHome extends StatelessWidget {
  const AIToolboxBannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: SizedBox(
        width: Get.width,
        height: 200.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                Images.boxBackground,
                height: 200.h,
              ),
            ),
            Align(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.kPrimary,
                      AppColors.kPrimary.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 250.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 24.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AI Toolbox',
                        style: AppTypography.h4Bold.copyWith(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Unleash your creativity and try our AI Toolbox now!',
                        style: AppTypography.BodyLMedium.copyWith(
                          color: AppColors.kWhite,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      RoundedButtonLite(
                        onTap: () {
                          log('Try Now');
                        },
                        label: 'Try Now',
                        color: AppColors.kWhite,
                        style: AppTypography.BodyMSemiBold.copyWith(
                          color: AppColors.kPrimary,
                        ),
                        width: 100.w,
                        height: 45.h,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
