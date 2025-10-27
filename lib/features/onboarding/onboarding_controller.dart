import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../core/theme/theme_controller.dart';

class OnboardingController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final RxBool isNameValid = true.obs;
  final ThemeController _themeController = Get.find<ThemeController>();

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  void startAssessment() {
    final trimmedName = nameController.text.trim();
    if (trimmedName.isEmpty) {
      isNameValid.value = false;
      return;
    }
    isNameValid.value = true;
    Get.toNamed(AppRoutes.assessment, arguments: trimmedName);
  }

  ThemeMode get themeMode => _themeController.themeMode.value;

  void toggleTheme() {
    final current = _themeController.themeMode.value;
    final nextMode =
        current == ThemeMode.dark ? AppThemeMode.light : AppThemeMode.dark;
    _themeController.setThemeMode(nextMode);
  }
}
