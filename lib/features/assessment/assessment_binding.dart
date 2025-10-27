import 'package:get/get.dart';

import 'assessment_controller.dart';

class AssessmentBinding extends Bindings {
  @override
  void dependencies() {
    final participantName = Get.arguments as String? ?? 'Guest';
    Get.put(AssessmentController(participantName: participantName));
  }
}
