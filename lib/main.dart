import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';

import 'package:pixlify/infrastructure/navigation/navigation.dart';
import 'package:pixlify/infrastructure/navigation/routes.dart';
import 'package:pixlify/intial_binding.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget for the entire app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      useInheritedMediaQuery: true,
      builder: (context, _) => GetMaterialApp(
        title: 'Pixlify',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.kWhite,
        ),
        initialRoute: Routes.SPLASH,
        getPages: Nav.routes,
        initialBinding: InitialBindings(),
      ),
    );
  }
}
