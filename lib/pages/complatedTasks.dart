import 'package:flutter/material.dart';
import 'taskListPage.dart';

class CompletedTasksPage extends StatelessWidget {
  final List<Task> tasks;

  CompletedTasksPage({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tamamlanan Görevler'),
      ),
      body: tasks.isEmpty
          ? const Center(
        child: Text(
          'Henüz tamamlanan görev yok!',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(task.icon, color: Colors.green),
              title: Text(task.title),
              subtitle: Text(task.description),
            ),
          );
        },
      ),
    );
  }
}
