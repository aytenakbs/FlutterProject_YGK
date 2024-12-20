import 'package:flutter/material.dart';

class CompletedTasksPage extends StatelessWidget {
  final List<Task> tasks;

  CompletedTasksPage({required this.tasks});

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
          // Tüm sayfayı kapsayan arka plan
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/grass-6783054_1920.jpg'), // Resim yolu
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // İçerik
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
              // Alt butonlar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCircularButton(
                      icon: Icons.water_drop,
                      color: Colors.blue.withOpacity(0.7),
                      onTap: () {
                        // Su butonuna tıklanınca yapılacaklar
                      },
                    ),
                    _buildCircularButton(
                      icon: Icons.wb_sunny,
                      color: Colors.orange.withOpacity(0.7),
                      onTap: () {
                        // Güneş butonuna tıklanınca yapılacaklar
                      },
                    ),
                    _buildCircularButton(
                      icon: Icons.grass,
                      color: Colors.green.withOpacity(0.7),
                      onTap: () {
                        // Gübre butonuna tıklanınca yapılacaklar
                      },
                    ),
                  ],
                ),
              ),
              // Tamamlanan görev sayısı
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

  Widget _buildCircularButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }
}

class Task {
  final String title;
  final String description;
  final IconData icon;

  Task({required this.title, required this.description, required this.icon});
}
