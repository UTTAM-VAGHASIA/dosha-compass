import '../models/assessment_option.dart';
import '../models/assessment_question.dart';
import '../models/dosha_type.dart';

class AssessmentState {
  AssessmentState({
    required this.questions,
    this.currentIndex = 0,
    Map<String, AssessmentOption>? responses,
  }) : responses = responses ?? {};

  final List<AssessmentQuestion> questions;
  final int currentIndex;
  final Map<String, AssessmentOption> responses;

  AssessmentQuestion get currentQuestion => questions[currentIndex];

  AssessmentState copyWith({
    int? currentIndex,
    Map<String, AssessmentOption>? responses,
  }) {
    return AssessmentState(
      questions: questions,
      currentIndex: currentIndex ?? this.currentIndex,
      responses: responses ?? this.responses,
    );
  }

  bool get isComplete => responses.length == questions.length;

  Map<DoshaType, double> cumulativeScores() {
    final totals = <DoshaType, double>{
      for (final dosha in DoshaType.values) dosha: 0,
    };

    for (final option in responses.values) {
      option.weights.forEach((dosha, weight) {
        totals[dosha] = (totals[dosha] ?? 0) + weight;
      });
    }

    return totals;
  }
}
