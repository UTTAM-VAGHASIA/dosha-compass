import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import 'onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dosha Compass'),
        actions: [
          IconButton(
            onPressed: controller.toggleTheme,
            icon: Icon(
              controller.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            tooltip: 'Toggle theme',
          ),
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.history),
            icon: const Icon(Icons.history),
            tooltip: 'History',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ayurvedic Prakriti Assessment',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                'Discover the dominant dosha for yourself or a loved one through a guided questionnaire rooted in traditional Ayurvedic principles.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              Obx(
                () => TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: 'Participant name',
                    hintText: 'e.g. Ananya Sharma',
                    errorText: controller.isNameValid.value
                        ? null
                        : 'Please enter a name to begin',
                    border: const OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  onChanged: (_) => controller.isNameValid.value = true,
                  onSubmitted: (_) => controller.startAssessment(),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: controller.startAssessment,
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text('Start Assessment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
