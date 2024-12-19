import 'package:flutter/material.dart';
import 'package:ygk_project/models/task.dart';

class ChainPage extends StatelessWidget {
  final List<Task> completedTasks;

  const ChainPage({
    super.key,
    required this.completedTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hedef Zincirleri',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: completedTasks.isNotEmpty
          ? ListView.builder(
        itemCount: completedTasks.length,
        itemBuilder: (context, index) {
          final task = completedTasks[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                task.title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(task.description),
            ),
          );
        },
      )
          : const Center(
        child: Text(
          'Henüz tamamlanmış bir hedef yok!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}