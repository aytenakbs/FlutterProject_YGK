import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() => runApp(SustainabilityGameApp());

class SustainabilityGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool showStartButton = true;
  int imageIndex = 0;
  int totalClicks = 9;
  int completedTasks = 0;
  final int maxClicks = 9;
  final List<String> imagePaths = [
    'lib/assets/images/1.jpeg',
    'lib/assets/images/2.jpeg',
    'lib/assets/images/3.jpeg',
    'lib/assets/images/4.jpeg',
    'lib/assets/images/5.jpeg',
    'lib/assets/images/6.jpeg',
    'lib/assets/images/7.jpeg',
    'lib/assets/images/8.jpeg',
    'lib/assets/images/9.jpeg',
    'lib/assets/images/10.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _loadCompletedTasks();
  }

  Future<void> _loadCompletedTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      final tasksJson = json.decode(tasksString) as List;
      setState(() {
        completedTasks = tasksJson.where((task) => task['isCompleted'] == true).length;
      });
    }
  }

  void updateBackground() {
    if (totalClicks < maxClicks + completedTasks) {
      setState(() {
        imageIndex = (imageIndex + 1) % imagePaths.length;
        totalClicks++;
      });

      if (imageIndex == imagePaths.length - 1) {
        // Son tıklamadan 4 saniye sonra diyalogu göster
        Future.delayed(Duration(seconds: 4), () {
          _showCompletionDialog();
        });
      }
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tebrikler!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bugün tüm görevleri yaptınız ve çevrenin korunmasına katkı sağladınız!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Image.asset(
                'lib/assets/images/award.jpeg',
                fit: BoxFit.cover,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  showStartButton = true;
                  imageIndex = 0;
                  totalClicks = 0;
                });
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  void startGame() {
    setState(() {
      showStartButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePaths[imageIndex],
              fit: BoxFit.cover,
            ),
          ),
          if (showStartButton)
            Center(
              child: GestureDetector(
                onTap: startGame,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  transform: showStartButton
                      ? Matrix4.translationValues(0, 0, 0)
                      : Matrix4.translationValues(0, -5, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(50),
                    child: Text(
                      'OYUNA BAŞLA',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          if (!showStartButton)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildActionButton('Su', updateBackground),
                      _buildActionButton('Güneş', updateBackground),
                      _buildActionButton('Gübre', updateBackground),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Kalan Tıklama Hakkı: ${maxClicks + completedTasks - totalClicks}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: totalClicks < maxClicks + completedTasks ? onPressed : null,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: TextStyle(fontSize: 16),
        backgroundColor: totalClicks < maxClicks + completedTasks
            ? Colors.white.withOpacity(0.5)
            : Colors.grey,
        foregroundColor: Colors.black,
      ),
    );
  }
}
