import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:ygk_project/pages/complatedTasks.dart';

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

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'icon': icon.codePoint,
    'isCompleted': isCompleted,
  };

  static Task fromJson(Map<String, dynamic> json) => Task(
    title: json['title'],
    description: json['description'],
    icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
    isCompleted: json['isCompleted'],
  );
}

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> tasks = [
    Task(title: 'Işıkları Kapat', description: 'Kullanılmayan ışıkları kapat.', icon: Icons.lightbulb_outline),
    Task(title: 'Geri Dönüşüm Kutusu Kullan', description: 'Plastik, kağıt ve cam atıkları geri dönüşüm kutusuna at.', icon: Icons.recycling),
    Task(title: 'Bez Çanta Kullan', description: 'Alışveriş yaparken plastik poşet yerine bez çanta kullan.', icon: Icons.shopping_bag_outlined),
    Task(title: 'Su Tasarrufu Yap', description: 'Dişlerini fırçalarken musluğu kapat.', icon: Icons.water_drop_outlined),
    Task(title: 'Toplu Taşıma Kullan', description: 'Araç yerine toplu taşıma kullan veya yürüyüş yap.', icon: Icons.directions_bus_filled),
    Task(title: 'Enerji Tasarruflu Ampuller Kullan', description: 'LED ampulleri tercih et.', icon: Icons.lightbulb),
    Task(title: 'Plastik Şişe Yerine Matara Kullan', description: 'Dışarıda içme suyu için yeniden kullanılabilir matara kullan.', icon: Icons.local_drink),
    Task(title: 'Elektronikleri Prizden Çek', description: 'Kullanılmayan elektronik cihazların fişini çek.', icon: Icons.power_off),
    Task(title: 'Kağıt İsrafını Azalt', description: 'Çift taraflı yazdırma seçeneğini kullan veya dijital notlar al.', icon: Icons.document_scanner),
  ];

  @override
  void initState() {
    super.initState();
    _loadTaskCompletionStatus();
  }

  Future<void> _saveTaskCompletionStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = tasks.map((task) => task.toJson()).toList();
    await prefs.setString('tasks', json.encode(tasksJson));
  }

  Future<void> _loadTaskCompletionStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      final tasksJson = json.decode(tasksString) as List;
      setState(() {
        tasks = tasksJson.map((task) => Task.fromJson(task)).toList();
      });
    }
  }

  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
    _saveTaskCompletionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Günlük Görevler',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompletedTasksPage(
                    tasks: tasks.where((task) => task.isCompleted).toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Arka plan resmi
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/grass-6783054_1920.jpg', // Arka plan görsel yolu
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 80),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: Colors.white.withOpacity(0.9),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: Icon(
                    task.icon,
                    color: task.isCompleted ? Colors.green : Colors.grey,
                    size: 32,
                  ),
                  title: Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(task.description),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    activeColor: Colors.green,
                    onChanged: (value) => toggleTaskCompletion(index),
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
