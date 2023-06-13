import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalkthroughController extends GetxController {
  bool get end => _end.value;
  PageController get pageController => _pageController;
  RxBool _end = false.obs;

  final _pageController = PageController();
  @override
  void onInit() {
    super.onInit();
  }

  /// next page
  void nextPage() async {
    if (pageController.page == 2) {
      Get.offAndToNamed('/auth-wrapper');
      return;
    }
    await pageController.nextPage(
      duration: 150.milliseconds,
      curve: Curves.easeIn,
    );
    _end.value = pageController.page == 2;
  }
}
