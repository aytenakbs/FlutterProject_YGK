import 'package:flutter/material.dart';

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
    Task(title: 'Yerel Ürün Satın Al', description: 'Yerel pazarlardan veya çiftçilerden alışveriş yap.', icon: Icons.shopping_cart_outlined),
    Task(title: 'Kağıt İsrafını Azalt', description: 'Çift taraflı yazdırma seçeneğini kullan veya dijital notlar al.', icon: Icons.document_scanner),
  ];

  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Günlük Görevler',
          style: TextStyle(color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompletedTasksPage(
                      tasks: tasks.where((task) => task.isCompleted).toList(),
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.green,
                child: const Icon(Icons.check, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/grass-6783054_1920.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Task list content
          ListView.builder(
            padding: const EdgeInsets.only(top: 100),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                      onChanged: (value) {
                        toggleTaskCompletion(index);
                      },
                    ),
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

class CompletedTasksPage extends StatelessWidget {
  final List<Task> tasks;

  const CompletedTasksPage({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tamamlanmış Görevler'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            leading: Icon(Icons.check, color: Colors.green),
            title: Text(task.title),
            subtitle: Text(task.description),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.green),
    home: TaskListPage(),
  ));
}
