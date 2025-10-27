import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../results/dosha_profiles.dart';
import '../results/results_arguments.dart';
import 'controllers/assessment_state.dart';
import 'models/assessment_option.dart';
import 'models/assessment_question.dart';
import 'models/dosha_type.dart';

class AssessmentController extends GetxController {
  AssessmentController({required this.participantName});

  final String participantName;

  late final Rx<AssessmentState> _state;

  AssessmentState get state => _state.value;

  @override
  void onInit() {
    super.onInit();
    _state = AssessmentState(questions: List<AssessmentQuestion>.unmodifiable(QuestionBank.all())).obs;
  }

  AssessmentQuestion get currentQuestion => state.currentQuestion;

  int get questionCount => state.questions.length;

  int get currentIndex => state.currentIndex;

  bool get isOnFirstQuestion => currentIndex == 0;

  bool get isOnLastQuestion => currentIndex == questionCount - 1;

  String get progressLabel => '${currentIndex + 1} / $questionCount';

  AssessmentOption? get selectedOption =>
      state.responses[currentQuestion.id];

  void resetAssessment() {
    _state.value = AssessmentState(
      questions: List<AssessmentQuestion>.unmodifiable(QuestionBank.all()),
    );
  }

  void selectOption(AssessmentOption option) {
    final updatedResponses = Map<String, AssessmentOption>.from(state.responses);
    updatedResponses[currentQuestion.id] = option;
    _state.value = state.copyWith(responses: updatedResponses);
  }

  void nextQuestion() {
    if (isOnLastQuestion) {
      if (!isCompleted) {
        Get.snackbar(
          'Almost there!',
          'Please answer all questions before viewing results.',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
        return;
      }
      _navigateToResults();
      return;
    }
    final nextIndex =
        (state.currentIndex + 1).clamp(0, questionCount - 1).toInt();
    _state.value = state.copyWith(currentIndex: nextIndex);
  }

  void previousQuestion() {
    if (isOnFirstQuestion) {
      return;
    }
    final previousIndex =
        (state.currentIndex - 1).clamp(0, questionCount - 1).toInt();
    _state.value = state.copyWith(currentIndex: previousIndex);
  }

  bool get isCompleted => state.isComplete;

  Map<String, double> _normalizedScorePercentages() {
    final totals = state.cumulativeScores();
    final totalValue = totals.values.fold<double>(0, (sum, value) => sum + value);
    if (totalValue == 0) {
      return {for (final dosha in DoshaType.values) dosha.label: 0};
    }
    return {
      for (final entry in totals.entries)
        entry.key.label: (entry.value / totalValue * 100).clamp(0, 100).toDouble(),
    };
  }

  ResultsArguments _buildResultsArguments() {
    final normalized = _normalizedScorePercentages();
    final sortedEntries = normalized.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final highest = sortedEntries[0];
    final second = sortedEntries[1];
    final third = sortedEntries[2];

    DoshaInsights insights;
    if ((highest.value - third.value).abs() <= 7) {
      insights = DoshaProfiles.tridoshic();
    } else if ((highest.value - second.value).abs() <= 10) {
      final primary = DoshaType.values
          .firstWhere((element) => element.label == highest.key);
      final secondary = DoshaType.values
          .firstWhere((element) => element.label == second.key);
      insights = DoshaProfiles.dual(primary, secondary);
    } else {
      final primary = DoshaType.values
          .firstWhere((element) => element.label == highest.key);
      insights = DoshaProfiles.single(primary);
    }

    return ResultsArguments(
      participantName: participantName,
      doshaScores: normalized,
      primaryTraits: insights.traits,
      recommendations: insights.recommendations,
    );
  }

  void _navigateToResults() {
    final args = _buildResultsArguments();
    Get.offNamed(AppRoutes.results, arguments: args);
  }
}
