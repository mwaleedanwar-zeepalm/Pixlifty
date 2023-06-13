import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AccountController extends GetxController {
  // TODO: ADD PATHS
  final generalSettings = <AccountMenuItem>[
    AccountMenuItem(
      title: 'Personal Info',
      icon: IconlyLight.profile,
      path: '',
    ),
    AccountMenuItem(
      title: 'Payment Methods',
      icon: CupertinoIcons.creditcard,
      path: '',
    ),
    AccountMenuItem(
      title: 'Security',
      icon: IconlyLight.shield_done,
      path: '',
    ),
    AccountMenuItem(
      title: 'Language',
      icon: IconlyLight.document,
      path: '',
    ),
  ];
  final aboutSettings = <AccountMenuItem>[
    AccountMenuItem(
      title: 'Follow us on Social Media',
      icon: IconlyLight.paper,
      path: '',
    ),
    AccountMenuItem(
      title: 'Privacy Policy',
      icon: IconlyLight.lock,
      path: '',
    ),
    AccountMenuItem(
      title: 'About Pixlify',
      icon: IconlyLight.info_square,
      path: '',
    ),
  ];

  bool get darkMode => _darkMode.value;
  set darkMode(bool value) => _darkMode.value = value;
  RxBool _darkMode = false.obs;
}

class AccountMenuItem {
  final String title;
  final IconData icon;
  final String path;

  AccountMenuItem({
    required this.title,
    required this.icon,
    required this.path,
  });
}
