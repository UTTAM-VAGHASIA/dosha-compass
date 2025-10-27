import '../assessment/models/dosha_type.dart';

class DoshaInsights {
  const DoshaInsights({
    required this.title,
    required this.traits,
    required this.recommendations,
  });

  final String title;
  final List<String> traits;
  final List<String> recommendations;
}

class DoshaProfiles {
  DoshaProfiles._();

  static DoshaInsights single(DoshaType type) {
    return DoshaInsights(
      title: '${type.label} Dominant',
      traits: List<String>.unmodifiable(_singleTraits[type]!),
      recommendations: List<String>.unmodifiable(
        _singleRecommendations[type]!,
      ),
    );
  }

  static DoshaInsights dual(DoshaType primary, DoshaType secondary) {
    final traits = <String>{
      ..._singleTraits[primary]!,
      ..._singleTraits[secondary]!,
    }.toList(growable: false);

    final recommendations = <String>{
      ..._singleRecommendations[primary]!,
      ..._singleRecommendations[secondary]!,
    }.toList(growable: false);

    return DoshaInsights(
      title: '${primary.label}-${secondary.label} Dual',
      traits: traits.take(6).toList(growable: false),
      recommendations: recommendations.take(6).toList(growable: false),
    );
  }

  static DoshaInsights tridoshic() {
    return const DoshaInsights(
      title: 'Balanced Tridoshic',
      traits: [
        'Maintains equilibrium across mind and body',
        'Adapts well to varied environments',
        'Naturally resilient digestion and sleep cycles',
        'Balanced emotional expression',
      ],
      recommendations: [
        'Preserve variety in foods with seasonal alignment',
        'Rotate movement styles to keep each dosha engaged',
        'Practice gratitude journaling to honor balance',
        'Maintain a consistent sleep-and-wake rhythm',
      ],
    );
  }

  static const Map<DoshaType, List<String>> _singleTraits = {
    DoshaType.vata: [
      'Creative and imaginative thinking',
      'Quick to adapt and explore',
      'Light frame with delicate digestion',
      'High energy bursts with alternating rest',
    ],
    DoshaType.pitta: [
      'Focused, driven, and purposeful',
      'Strong digestion and metabolic fire',
      'Naturally warm and charismatic',
      'Prefers structure with clear goals',
    ],
    DoshaType.kapha: [
      'Grounded, calm, and patient',
      'Steady energy with enduring stamina',
      'Smooth, resilient skin and hair',
      'Deep capacity for empathy and support',
    ],
  };

  static const Map<DoshaType, List<String>> _singleRecommendations = {
    DoshaType.vata: [
      'Prioritize warm, nourishing meals',
      'Create calming evening wind-down rituals',
      'Incorporate grounding breathwork daily',
      'Maintain steady routines with gentle reminders',
    ],
    DoshaType.pitta: [
      'Opt for cooling, hydrating foods and herbs',
      'Schedule regular breaks to reset focus',
      'Practice moderate exercise over extreme heat',
      'Integrate mindfulness to soften intensity',
    ],
    DoshaType.kapha: [
      'Energize mornings with invigorating movement',
      'Favor light, warming spices in meals',
      'Declutter environments to inspire action',
      'Engage in stimulating hobbies and community',
    ],
  };
}
