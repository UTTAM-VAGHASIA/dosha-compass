import '../../../core/services/storage_service.dart';
import '../models/assessment_result.dart';

class HistoryRepository {
  HistoryRepository(this._storageService);

  static const _historyKey = 'assessment_history';

  final StorageService _storageService;

  Future<List<AssessmentResult>> loadHistory() async {
    final stored = _storageService.readStringList(_historyKey);
    if (stored == null) {
      return <AssessmentResult>[];
    }
    return stored
        .map(AssessmentResult.fromEncoded)
        .toList(growable: false);
  }

  Future<void> saveResult(AssessmentResult result) async {
    final existing = await loadHistory();
    final updated = <AssessmentResult>[result, ...existing];
    final encoded = updated.map((e) => e.toEncoded()).toList(growable: false);
    await _storageService.writeStringList(_historyKey, encoded);
  }

  Future<void> clearHistory() async {
    await _storageService.remove(_historyKey);
  }
}
