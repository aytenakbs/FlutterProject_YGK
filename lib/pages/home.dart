import 'package:flutter/material.dart';
import 'package:ygk_project/models/task.dart';

class HomePage extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) onComplete;

  const HomePage({
    super.key,
    required this.tasks,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Günlük Hedefler',
          style: TextStyle(color: Colors.black87, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand, // Stack'in tüm alanı kaplaması için
        children: [
          // Arka plan resmi
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/gorevler.jpg'), // Resminizin yolu
                fit: BoxFit.cover, // Resmi ekran boyutuna uyumlu hale getirir
              ),
            ),
          ),
          // Mevcut içerik
          ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(
                    task.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(task.description),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      if (value == true) {
                        onComplete(task);
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}