import 'package:get/get.dart';

import '../../core/services/storage_service.dart';
import '../history/data/history_repository.dart';
import 'results_controller.dart';

class ResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryRepository(Get.find<StorageService>()));
    final args = Get.arguments;
    Get.put(ResultsController(
      arguments: args,
      historyRepository: Get.find<HistoryRepository>(),
    ));
  }
}
