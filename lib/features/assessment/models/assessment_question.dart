import 'assessment_option.dart';
import 'dosha_type.dart';

enum QuestionCategory { physical, mental, lifestyle, environmental }

extension QuestionCategoryX on QuestionCategory {
  String get label {
    switch (this) {
      case QuestionCategory.physical:
        return 'Physical';
      case QuestionCategory.mental:
        return 'Mental';
      case QuestionCategory.lifestyle:
        return 'Lifestyle';
      case QuestionCategory.environmental:
        return 'Environmental';
    }
  }
}

class AssessmentQuestion {
  const AssessmentQuestion({
    required this.id,
    required this.title,
    required this.category,
    required this.options,
    this.helper,
  });

  final String id;
  final String title;
  final QuestionCategory category;
  final List<AssessmentOption> options;
  final String? helper;
}

class QuestionBank {
  const QuestionBank._();

  static List<AssessmentQuestion> all() =>
      List<AssessmentQuestion>.unmodifiable(_questions);

  static final List<AssessmentQuestion> _questions = [
    const AssessmentQuestion(
      id: 'phys_skin',
      title: "How would you describe your skin's natural tendency?",
      category: QuestionCategory.physical,
      helper:
          'Observe your skin without products—its texture, temperature, and moisture through the day.',
      options: [
        AssessmentOption(
          label: 'Dry, cool, or rough',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Warm, sensitive, or slightly oily',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Balanced, soft, and naturally moisturised',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'phys_body_build',
      title: 'What best reflects your natural body build?',
      category: QuestionCategory.physical,
      helper: 'Consider your frame and how easily you gain or lose weight.',
      options: [
        AssessmentOption(
          label: 'Light or thin build, finds it hard to gain weight',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Medium, athletic build with clear muscle tone',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Sturdy or heavier build that gains easily',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'phys_hair',
      title: 'How would you describe your hair?',
      category: QuestionCategory.physical,
      helper: 'Notice natural texture, thickness, and overall condition.',
      options: [
        AssessmentOption(
          label: 'Dry, light, or frizzy with split ends',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Fine, silky, or prone to early greying',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Thick, lustrous, and naturally conditioned',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'phys_eyes',
      title: 'What best describes your eyes?',
      category: QuestionCategory.physical,
      helper:
          'Look at natural size, brightness, and moisture during a typical day.',
      options: [
        AssessmentOption(
          label: 'Small, quick-moving, or often feel dry',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Medium, sharp gaze that can feel intense',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Large, soft, calm, and luminous',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'phys_sleep_quality',
      title: 'How would you describe your natural sleep pattern?',
      category: QuestionCategory.physical,
      helper:
          'Reflect on how easily you fall asleep, stay asleep, and feel on waking.',
      options: [
        AssessmentOption(
          label: 'Light sleeper, wakes easily',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Falls asleep quickly with moderate rest',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Sleeps deeply and prefers long rest',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'phys_digestion',
      title: 'How does your digestion typically feel?',
      category: QuestionCategory.physical,
      helper:
          'Think about how your body handles meals and how you feel afterward.',
      options: [
        AssessmentOption(
          label: 'Irregular, prone to bloating or gas',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Strong digestion, hungry soon after eating',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Slow, feels heavy or sluggish after meals',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'mental_mindset',
      title: 'How would you describe your usual mindset?',
      category: QuestionCategory.mental,
      helper: 'Think about the pace and tone of your thoughts most days.',
      options: [
        AssessmentOption(
          label: 'Restless, imaginative, and juggling many ideas',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Intense, goal-focused, and decisive',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Calm, steady, and content',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'mental_memory',
      title: 'How does your memory usually behave?',
      category: QuestionCategory.mental,
      helper: 'Consider how you retain everyday names, plans, and details.',
      options: [
        AssessmentOption(
          label: 'Learns quickly but forgets just as fast',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Sharp recall with precise details',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Learns steadily and remembers for a long time',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'mental_emotions',
      title: 'How do emotions usually show up for you?',
      category: QuestionCategory.mental,
      helper:
          'Notice your first emotional response when something unexpected happens.',
      options: [
        AssessmentOption(
          label: 'Feel anxious, worried, or unsettled easily',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'React with intensity, irritation, or impatience',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Remain calm, compassionate, and steady',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'mental_focus',
      title: 'How do you usually make decisions?',
      category: QuestionCategory.mental,
      helper: 'Think about the balance between intuition, drive, and patience.',
      options: [
        AssessmentOption(
          label: 'Decide quickly then often change course',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Direct, analytical, and fast',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Deliberate, consults others, prefers consensus',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'mental_resilience',
      title: 'How do you tend to recover from setbacks?',
      category: QuestionCategory.mental,
      helper: 'Consider your emotional recovery when challenges arise.',
      options: [
        AssessmentOption(
          label: 'Anxious or unsettled until routines return',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Fires up, tackles the problem head-on',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Steps back, slows down, waits for clarity',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'habit_diet',
      title: 'Which foods or flavours do you gravitate towards?',
      category: QuestionCategory.lifestyle,
      helper:
          'Think about the tastes and temperatures you find most balancing or comforting.',
      options: [
        AssessmentOption(
          label: 'Warm, sweet, or comfort foods',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Cooling, fresh, or lightly spiced dishes',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Light, dry, or easy-to-digest meals',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'habit_routine',
      title: 'How structured is your daily routine?',
      category: QuestionCategory.lifestyle,
      helper: 'Consider how predictable your day feels.',
      options: [
        AssessmentOption(
          label: 'Varies each day, thrives on spontaneity',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Highly organised with a clear plan',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Prefers slow, familiar routines',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'habit_energy',
      title: 'How do your daily energy levels flow?',
      category: QuestionCategory.lifestyle,
      helper: 'Track how energy rises and falls from morning to night.',
      options: [
        AssessmentOption(
          label: 'Bursts of energy followed by noticeable dips',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Strong, driven energy most of the day',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Steady, calm endurance with a slower pace',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'habit_activity',
      title: 'Which activity style feels most natural?',
      category: QuestionCategory.lifestyle,
      helper: 'Think about how you enjoy moving your body.',
      options: [
        AssessmentOption(
          label: 'Creative, changing activities keep me engaged',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Competitive or intense workouts motivate me',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Gentle, grounding movement suits me best',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'habit_restoration',
      title: 'How do you prefer to unwind or recover?',
      category: QuestionCategory.lifestyle,
      helper: 'Consider what restores you after a long day.',
      options: [
        AssessmentOption(
          label: 'Exploring new hobbies or stimulation',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Setting goals and optimising routines',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Quiet rest, warm baths, or gentle comfort',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'env_weather_preference',
      title: 'Which climate feels most comfortable to you?',
      category: QuestionCategory.environmental,
      helper:
          'Think about the weather or seasons where you feel most balanced.',
      options: [
        AssessmentOption(
          label: 'Warm, dry climates feel best; cold unsettles me',
          weights: {
            DoshaType.vata: 0.75,
            DoshaType.pitta: 0.15,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Cool, crisp air keeps me comfortable',
          weights: {
            DoshaType.vata: 0.15,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.15,
          },
        ),
        AssessmentOption(
          label: 'Mild warmth with gentle humidity suits me',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'env_temperature_response',
      title: 'How do you respond to temperature changes?',
      category: QuestionCategory.environmental,
      helper: 'Notice how your body reacts when it gets hot or cold.',
      options: [
        AssessmentOption(
          label: 'Hands and feet get cold easily; prefer warmth',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Overheat quickly and seek cooler air',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Stay comfortable but dislike damp cold',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'env_noise_sensitivity',
      title: 'How do you feel in noisy or busy environments?',
      category: QuestionCategory.environmental,
      helper: 'Think about sound levels and stimulation.',
      options: [
        AssessmentOption(
          label: 'Easily overstimulated by noise and bustle',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Enjoy lively spaces if I can guide the pace',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Comfortable with steady background noise',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'env_change_adaptation',
      title: 'How do you adapt to change or travel?',
      category: QuestionCategory.environmental,
      helper:
          'Notice how you feel when routines shift or you move environments.',
      options: [
        AssessmentOption(
          label: 'Feel unsettled and need time to re-establish routine',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Adapt quickly but manage every detail closely',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Adjust slowly but remain calm and grounded',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
    const AssessmentQuestion(
      id: 'env_stress_response',
      title: 'How do you typically respond to stress or pressure?',
      category: QuestionCategory.environmental,
      helper: 'Think about your immediate reaction when demands increase.',
      options: [
        AssessmentOption(
          label: 'Anxious, scattered, or overwhelmed',
          weights: {
            DoshaType.vata: 0.7,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Intense, driven, or confrontational',
          weights: {
            DoshaType.vata: 0.2,
            DoshaType.pitta: 0.7,
            DoshaType.kapha: 0.1,
          },
        ),
        AssessmentOption(
          label: 'Slow down, withdraw, or seek comfort',
          weights: {
            DoshaType.vata: 0.1,
            DoshaType.pitta: 0.2,
            DoshaType.kapha: 0.7,
          },
        ),
      ],
    ),
  ];
}
