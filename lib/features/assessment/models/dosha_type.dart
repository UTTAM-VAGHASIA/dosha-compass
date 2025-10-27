import 'package:flutter/material.dart';

enum DoshaType { vata, pitta, kapha }

extension DoshaTypeX on DoshaType {
  String get label {
    switch (this) {
      case DoshaType.vata:
        return 'Vata';
      case DoshaType.pitta:
        return 'Pitta';
      case DoshaType.kapha:
        return 'Kapha';
    }
  }

  Color get accentColor {
    switch (this) {
      case DoshaType.vata:
        return const Color(0xFF6C63FF);
      case DoshaType.pitta:
        return const Color(0xFFFF7043);
      case DoshaType.kapha:
        return const Color(0xFF4CAF50);
    }
  }
}
