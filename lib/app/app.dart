import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/theme/app_theme.dart';
import '../core/theme/theme_controller.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class DoshaCompassApp extends StatelessWidget {
  const DoshaCompassApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(
      () => GetMaterialApp(
        title: 'Dosha Compass',
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: themeController.themeMode.value,
        initialRoute: AppRoutes.onboarding,
        getPages: AppPages.routes,
      ),
    );
  }
}
