class ResultsArguments {
  const ResultsArguments({
    required this.participantName,
    required this.doshaScores,
    required this.primaryTraits,
    required this.recommendations,
    this.shouldPersist = true,
  });

  final String participantName;
  final Map<String, double> doshaScores;
  final List<String> primaryTraits;
  final List<String> recommendations;
  final bool shouldPersist;

  factory ResultsArguments.mock({required String participantName}) {
    return ResultsArguments(
      participantName: participantName,
      doshaScores: const {
        'Vata': 0.36,
        'Pitta': 0.44,
        'Kapha': 0.20,
      },
      primaryTraits: const [
        'Driven and focused',
        'Enjoys warm climates',
        'Quick digestion',
      ],
      recommendations: const [
        'Prioritize cooling foods rich in sweet tastes',
        'Incorporate evening meditation to unwind',
        'Stay hydrated throughout the day',
      ],
      shouldPersist: false,
    );
  }
}
