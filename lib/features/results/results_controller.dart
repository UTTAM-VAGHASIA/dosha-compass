import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../history/data/history_repository.dart';
import '../history/models/assessment_result.dart';
import 'results_arguments.dart';
import '../../core/theme/theme_controller.dart';

class ResultsController extends GetxController {
  ResultsController({
    required this.arguments,
    required this.historyRepository,
  });

  final ResultsArguments arguments;
  final HistoryRepository historyRepository;
  final ThemeController _themeController = Get.find<ThemeController>();

  late final List<PieChartSectionData> sections;
  late final List<String> topTraits;
  late final List<String> recommendations;

  ThemeMode get themeMode => _themeController.themeMode.value;

  String get participantName => arguments.participantName;

  String get primaryDoshaLabel {
    final sorted = _sortedScores();
    return sorted.isEmpty ? 'Unknown' : sorted.first.key;
  }

  String get dominantDoshaSummary =>
      '$primaryDoshaLabel dominant constitution';

  Map<String, double> get doshaScores => arguments.doshaScores;

  double get totalScore =>
      doshaScores.values.fold<double>(0, (sum, value) => sum + value);

  List<MapEntry<String, double>> _sortedScores() {
    final entries = doshaScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return entries;
  }

  List<MapEntry<String, double>> get sortedScores => _sortedScores();

  @override
  void onInit() {
    super.onInit();
    sections = _buildSections();
    topTraits = List<String>.unmodifiable(arguments.primaryTraits);
    recommendations = List<String>.unmodifiable(arguments.recommendations);
    if (arguments.shouldPersist) {
      _persistResult();
    }
  }

  List<PieChartSectionData> _buildSections() {
    const palette = {
      'Vata': Color(0xFF6C63FF),
      'Pitta': Color(0xFFFF7043),
      'Kapha': Color(0xFF4CAF50),
    };

    return doshaScores.entries.map((entry) {
      final color = palette[entry.key] ?? Colors.blueGrey;
      return PieChartSectionData(
        color: color,
        value: entry.value,
        title: '${entry.value.toStringAsFixed(0)}%',
        radius: 80,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        showTitle: true,
      );
    }).toList(growable: false);
  }

  Future<void> _persistResult() async {
    final result = AssessmentResult(
      participantName: participantName,
      timestamp: DateTime.now(),
      doshaPercentages: doshaScores,
      primaryTraits: arguments.primaryTraits,
      recommendations: arguments.recommendations,
    );
    await historyRepository.saveResult(result);
  }

  void viewHistory() {
    Get.toNamed(AppRoutes.history);
  }

  void retakeAssessment() {
    Get.offAllNamed(AppRoutes.onboarding);
  }

  void toggleTheme() {
    final current = _themeController.themeMode.value;
    final nextMode =
        current == ThemeMode.dark ? AppThemeMode.light : AppThemeMode.dark;
    _themeController.setThemeMode(nextMode);
  }
}
