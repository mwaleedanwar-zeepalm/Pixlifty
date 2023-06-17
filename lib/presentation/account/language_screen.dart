import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/presentation/account/controllers/account.controller.dart';
import 'package:pixlify/theme.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});
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
            Text(
              'Suggested',
              style: AppTypography.h5SemiBold.copyWith(
                color: theme.primaryTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            ...List.generate(
              controller.recommendedLanguages.length,
              (index) => LanguageListTile(
                language: controller.recommendedLanguages[index],
                isCurrent: controller.recommendedLanguages[index] ==
                    controller.currentLanguage,
              ),
            ),
            Divider(
              height: 56.h,
              color: theme.primaryDividerColor,
            ),
            Text(
              'Suggested',
              style: AppTypography.h5SemiBold.copyWith(
                color: theme.hintTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            ...List.generate(
              controller.languages.length,
              (index) => LanguageListTile(
                language: controller.languages[index],
                isCurrent:
                    controller.languages[index] == controller.currentLanguage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageListTile extends StatelessWidget {
  final String language;
  final bool isCurrent;
  const LanguageListTile({
    required this.language,
    required this.isCurrent,
    super.key,
  });
  AccountController get controller => Get.find<AccountController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => controller.currentLanguage = language,
      title: Text(
        language,
        style: AppTypography.h5SemiBold.copyWith(
          color: theme.primaryTextColor,
        ),
      ),
      trailing: isCurrent
          ? const Icon(
              Icons.check_rounded,
              color: AppColors.kPrimary,
            )
          : null,
    );
  }
}
