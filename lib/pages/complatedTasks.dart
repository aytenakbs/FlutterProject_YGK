import 'package:flutter/material.dart';
import 'taskListPage.dart';

class CompletedTasksPage extends StatelessWidget {
  final List<Task> tasks;

  const CompletedTasksPage({required this.tasks});

  @override
  Widget build(BuildContext context) {
    final completedTaskCount = tasks.length; // Tamamlanan görev sayısı

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        elevation: 0,
        title: const Text(
          'Tamamlanan Görevler',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/grass-6783054_1920.jpg',
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 80), // AppBar'ın altındaki boşluk
              Expanded(
                child: tasks.isEmpty
                    ? const Center(
                  child: Text(
                    'Henüz tamamlanan görev yok!',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
                    : ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return Card(
                      color: Colors.white.withOpacity(0.9),
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            task.icon,
                            color: Colors.green,
                          ),
                        ),
                        title: Text(task.title),
                        subtitle: Text(task.description),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Tamamlanan Görev Sayısı: $completedTaskCount',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
