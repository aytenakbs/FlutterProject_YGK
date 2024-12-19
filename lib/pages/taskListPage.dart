import 'package:flutter/material.dart';
import 'complatedTasks.dart';

class Task {
  final String title;
  final String description;
  final IconData icon;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.icon,
    this.isCompleted = false,
  });
}

class TaskListPage extends StatefulWidget {
  final List<Task> tasks;

  TaskListPage({required this.tasks});

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  void toggleTaskCompletion(int index) {
    setState(() {
      widget.tasks[index].isCompleted = !widget.tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Görevler'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompletedTasksPage(
                    tasks: widget.tasks.where((task) => task.isCompleted).toList(),
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          final task = widget.tasks[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                task.icon,
                color: task.isCompleted ? Colors.green : Colors.grey,
              ),
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: Checkbox(
                value: task.isCompleted,
                onChanged: (value) {
                  toggleTaskCompletion(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
