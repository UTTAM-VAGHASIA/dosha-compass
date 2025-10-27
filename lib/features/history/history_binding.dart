import 'package:get/get.dart';

import '../../core/services/storage_service.dart';
import 'data/history_repository.dart';
import 'history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryRepository(Get.find<StorageService>()));
    Get.put(HistoryController(repository: Get.find<HistoryRepository>()));
  }
}
