import 'package:flutter/material.dart';

class HistoryModal extends StatelessWidget {
  final List<String> history;

  const HistoryModal({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 300,
      child: history.isEmpty
          ? Center(
              child: Text(
                "No history yet.",
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
            )
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.history, color: Colors.deepPurpleAccent),
                  title: Text(
                    history[index],
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                );
              },
            ),
    );
  }
}
