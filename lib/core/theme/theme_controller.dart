import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/storage_service.dart';

enum AppThemeMode { light, dark, system }

class ThemeController extends GetxController {
  ThemeController(this._storageService);

  final StorageService _storageService;

  final themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    final storedMode = _storageService.readThemeMode();
    if (storedMode == null) {
      themeMode.value = ThemeMode.system;
    } else {
      themeMode.value = _mapStringToThemeMode(storedMode);
    }
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    final resolvedMode = _mapAppThemeMode(mode);
    themeMode.value = resolvedMode;
    await _storageService.writeThemeMode(mode.name);
  }

  ThemeMode _mapAppThemeMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  ThemeMode _mapStringToThemeMode(String value) {
    return _mapAppThemeMode(
      AppThemeMode.values.firstWhere(
        (element) => element.name == value,
        orElse: () => AppThemeMode.system,
      ),
    );
  }
}
