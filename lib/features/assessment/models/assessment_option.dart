import 'package:flutter/material.dart';

import 'dosha_type.dart';

class AssessmentOption {
  const AssessmentOption({
    required this.label,
    this.description,
    required this.weights,
    this.icon,
  });

  final String label;
  final String? description;
  final Map<DoshaType, double> weights;
  final IconData? icon;
}
