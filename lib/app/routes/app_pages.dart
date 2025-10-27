import 'package:get/get.dart';

import '../../features/assessment/assessment_binding.dart';
import '../../features/assessment/assessment_view.dart';
import '../../features/history/history_binding.dart';
import '../../features/history/history_view.dart';
import '../../features/onboarding/onboarding_binding.dart';
import '../../features/onboarding/onboarding_view.dart';
import '../../features/results/results_binding.dart';
import '../../features/results/results_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = <GetPage<dynamic>>[
    GetPage<void>(
      name: AppRoutes.onboarding,
      page: OnboardingView.new,
      binding: OnboardingBinding(),
    ),
    GetPage<void>(
      name: AppRoutes.assessment,
      page: AssessmentView.new,
      binding: AssessmentBinding(),
    ),
    GetPage<void>(
      name: AppRoutes.results,
      page: ResultsView.new,
      binding: ResultsBinding(),
    ),
    GetPage<void>(
      name: AppRoutes.history,
      page: HistoryView.new,
      binding: HistoryBinding(),
    ),
  ];
}
