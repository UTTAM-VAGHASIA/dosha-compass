import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/app.dart';
import 'core/services/storage_service.dart';
import 'core/theme/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storageService =
      await Get.putAsync<StorageService>(() async => StorageService().init());
  Get.put(ThemeController(storageService), permanent: true);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const DoshaCompassApp(),
    ),
  );
}
