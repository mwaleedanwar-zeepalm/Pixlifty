import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';

class HomeViewController extends GetxController {
  List<File> get recentImages => _recentImages.value;
  bool get loading => _loading.value;
  bool get error => _error.value;
  Rx<List<File>> _recentImages = Rx<List<File>>([]);
  RxBool _loading = true.obs;
  RxBool _error = false.obs;
  final scrollController = ScrollController();

  @override
  void onInit() {
    getImagesFromPhone();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getImagesFromPhone() async {
    final permissions = await _promptPermissionSetting();
    if (!permissions) {
      _loading.value = false;
      _error.value = true;
      return;
    }
    final albums = await PhotoGallery.listAlbums(mediumType: MediumType.image);
    final imagePage = await albums.first.listMedia(
      take: 30,
    );
    final images = imagePage.items;
    for (var image in images) {
      final file = await image.getFile();
      _recentImages.value.add(file);
    }
    _loading.value = false;
  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS) {
      if (await Permission.storage.request().isGranted) {
        return true;
      }
    }
    if (Platform.isAndroid) {
      if (await Permission.storage.request().isGranted ||
          await Permission.photos.request().isGranted &&
              await Permission.videos.request().isGranted) {
        return true;
      }
    }
    return false;
  }
}
