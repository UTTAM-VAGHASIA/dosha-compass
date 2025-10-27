import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../results/results_arguments.dart';
import 'data/history_repository.dart';
import 'models/assessment_result.dart';

class HistoryController extends GetxController {
  HistoryController({required this.repository});

  final HistoryRepository repository;

  final history = <AssessmentResult>[].obs;
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    loading.value = true;
    final results = await repository.loadHistory();
    history.assignAll(results);
    loading.value = false;
  }

  Future<void> refreshHistory() => _loadHistory();

  Future<void> clearHistory() async {
    await repository.clearHistory();
    history.clear();
  }

  void openResult(AssessmentResult result) {
    final args = ResultsArguments(
      participantName: result.participantName,
      doshaScores: Map<String, double>.from(result.doshaPercentages),
      primaryTraits: List<String>.from(result.primaryTraits),
      recommendations: List<String>.from(result.recommendations),
      shouldPersist: false,
    );
    Get.toNamed(AppRoutes.results, arguments: args);
  }

  String formattedTimestamp(DateTime timestamp) {
    final date = '${timestamp.day.toString().padLeft(2, '0')}/'
        '${timestamp.month.toString().padLeft(2, '0')}/'
        '${timestamp.year}';
    final time = '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}';
    return '$date $time';
  }
}
