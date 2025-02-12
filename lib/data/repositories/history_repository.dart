import 'package:hive/hive.dart';

class HistoryRepository {
  static const String boxName = 'historyBox';

  /// Adds a new history entry.
  Future<void> addHistory(String entry) async {
    final box = Hive.box<String>(boxName);
    await box.add(entry);
  }

  /// Retrieves all history entries, with the most recent first.
  List<String> getHistory() {
    final box = Hive.box<String>(boxName);
    // Since Hive returns entries in insertion order, we reverse them to show the newest first.
    return box.values.toList().reversed.cast<String>().toList();
  }
}
