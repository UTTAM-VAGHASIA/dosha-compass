import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'assessment_controller.dart';
import 'models/assessment_option.dart';
import 'models/assessment_question.dart';

class AssessmentView extends GetView<AssessmentController> {
  const AssessmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assessment • ${controller.participantName}'),
        actions: [
          IconButton(
            tooltip: 'Restart assessment',
            onPressed: controller.resetAssessment,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          final question = controller.currentQuestion;
          final selectedOption = controller.selectedOption;
          final progressValue =
              (controller.currentIndex + 1) / controller.questionCount;

          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${controller.progressLabel}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progressValue,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(999),
                ),
                const SizedBox(height: 24),
                Text(
                  question.category.label,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  question.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                if (question.helper != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    question.helper!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                Expanded(
                  child: ListView.separated(
                    itemCount: question.options.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final option = question.options[index];
                      return RadioGroup(
                        groupValue: selectedOption,
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectOption(value);
                          }
                        },
                        child: RadioListTile<AssessmentOption>(
                          value: option,

                          title: Text(option.label),
                          subtitle: option.description == null
                              ? null
                              : Text(option.description!),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: controller.isOnFirstQuestion
                          ? null
                          : controller.previousQuestion,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Previous'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: selectedOption == null
                            ? null
                            : controller.nextQuestion,
                        icon: Icon(
                          controller.isOnLastQuestion
                              ? Icons.insights
                              : Icons.arrow_forward,
                        ),
                        label: Text(
                          controller.isOnLastQuestion
                              ? 'View Results'
                              : 'Next Question',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
