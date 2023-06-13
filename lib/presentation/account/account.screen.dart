import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/presentation/auth_wrapper/controllers/auth_wrapper.controller.dart';

import '../../components/images/images.dart';
import 'controllers/account.controller.dart';

class AccountScreen extends GetView<AccountController> {
  const AccountScreen({Key? key}) : super(key: key);

  AccountController get controller => Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        elevation: 0,
        surfaceTintColor: AppColors.kWhite,
        leadingWidth: 50.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: SizedBox(
            height: 28.w,
            width: 28.w,
            child: SvgPicture.asset(Images.logo),
          ),
        ),
        title: Text(
          'Account',
          style: AppTypography.h4Bold,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 30.w,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=3',
                  ),
                ),
                title: Text('John Doe', style: AppTypography.h6Bold),
                subtitle: Text(
                  'firstname.lastname@yourdomain.com',
                  style: AppTypography.BodyMMedium.copyWith(
                    color: AppColors.kGreyScale700,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              UpgradeToProBanner(),
              SizedBox(
                height: 20.h,
              ),
              SubsectionDivider(subtitle: 'General'),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.generalSettings.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    SettingTile(item: controller.generalSettings[index]),
              ),
              DarkModeTile(),
              SubsectionDivider(subtitle: 'About'),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.aboutSettings.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    SettingTile(item: controller.aboutSettings[index]),
              ),
              LogOutTile(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Stateless banner to advertise pro membership.
class UpgradeToProBanner extends StatelessWidget {
  const UpgradeToProBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: Gradients.kRed,
      ),
      padding: EdgeInsets.symmetric(vertical: 19.h, horizontal: 16.w),
      child: Row(
        children: [
          SvgPicture.asset(Images.upgradeToPro),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upgrade to PRO',
                style: AppTypography.h4Bold.copyWith(color: AppColors.kWhite),
              ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                width: 200.w,
                child: Text(
                  'Enjoy all features & benefits without any restrictions',
                  maxLines: 2,
                  style: AppTypography.BodyMMedium.copyWith(
                      color: AppColors.kWhite),
                ),
              ),
            ],
          ),
          Icon(
            IconlyLight.arrow_right_2,
            color: AppColors.kWhite,
            size: 24.w,
          ),
        ],
      ),
    );
  }
}

/// Subsection divider with a subtitle and a divider separated by 16px.
class SubsectionDivider extends StatelessWidget {
  const SubsectionDivider({
    required this.subtitle,
    super.key,
  });
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          subtitle,
          style: AppTypography.BodyMSemiBold.copyWith(
            color: AppColors.kGreyScale500,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: Divider(
            color: AppColors.kGreyScale200,
            thickness: 1.w,
          ),
        ),
      ],
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    required this.item,
    super.key,
  });
  final AccountMenuItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      leading: Icon(
        item.icon,
        color: AppColors.kGreyScale900,
        size: 24.w,
      ),
      title: Text(
        item.title,
        style: AppTypography.h6Bold,
      ),
      trailing: Icon(
        IconlyLight.arrow_right_2,
        color: AppColors.kGreyScale900,
        size: 24.w,
      ),
    );
  }
}

class DarkModeTile extends StatelessWidget {
  const DarkModeTile({super.key});

  AccountController get controller => Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        leading: Icon(
          IconlyLight.show,
          color: AppColors.kGreyScale900,
          size: 24.w,
        ),
        title: Text(
          'Dark Mode',
          style: AppTypography.h6Bold,
        ),
        trailing: Switch(
          value: controller.darkMode,
          onChanged: (checked) {
            controller.darkMode = checked;
          },
          activeColor: AppColors.kPrimary,
          inactiveTrackColor: AppColors.kGreyScale300,
          inactiveThumbColor: AppColors.kWhite,
          trackOutlineColor: MaterialStatePropertyAll(
            AppColors.kGreyScale100,
          ),
        ),
      ),
    );
  }
}

class LogOutTile extends StatelessWidget {
  const LogOutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.find<AuthWrapperController>().signOut();
      },
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      leading: Icon(
        IconlyLight.logout,
        color: AppColors.kAlertError,
        size: 24.w,
      ),
      title: Text(
        'Logout',
        style: AppTypography.h6Bold,
      ),
    );
  }
}
