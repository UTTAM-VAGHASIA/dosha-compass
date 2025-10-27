import 'dart:convert';

class AssessmentResult {
  AssessmentResult({
    required this.participantName,
    required this.timestamp,
    required this.doshaPercentages,
    required this.primaryTraits,
    required this.recommendations,
  });

  final String participantName;
  final DateTime timestamp;
  final Map<String, double> doshaPercentages;
  final List<String> primaryTraits;
  final List<String> recommendations;

  Map<String, dynamic> toJson() {
    return {
      'participantName': participantName,
      'timestamp': timestamp.toIso8601String(),
      'doshaPercentages': doshaPercentages,
      'primaryTraits': primaryTraits,
      'recommendations': recommendations,
    };
  }

  factory AssessmentResult.fromJson(Map<String, dynamic> json) {
    final rawPercentages = json['doshaPercentages'] as Map<String, dynamic>;
    return AssessmentResult(
      participantName: json['participantName'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      doshaPercentages: rawPercentages.map(
        (key, value) => MapEntry(key, (value as num).toDouble()),
      ),
      primaryTraits: List<String>.from(json['primaryTraits'] as List<dynamic>),
      recommendations:
          List<String>.from(json['recommendations'] as List<dynamic>),
    );
  }

  String toEncoded() => jsonEncode(toJson());

  factory AssessmentResult.fromEncoded(String encoded) =>
      AssessmentResult.fromJson(jsonDecode(encoded) as Map<String, dynamic>);

  String dominantDosha() {
    final sortedEntries = doshaPercentages.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sortedEntries.isEmpty ? 'Unknown' : sortedEntries.first.key;
  }
}
