import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

void main() {
  runApp(SustainabilityGameApp());
}

class SustainabilityGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool _isGameStarted = false;
  int _tapCount = 0;
  DateTime? _lastPlayDate;
  List<String> _treeImages = [
    'assets/tree1.png',
    'assets/tree2.png',
    'assets/tree3.png',
    'assets/tree4.png',
    'assets/tree5.png',
    'assets/tree6.png',
    'assets/tree7.png',
    'assets/tree8.png',
    'assets/tree9.png',
    'assets/tree10.png',
  ];
  int _currentTreeIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadGameData();
  }

  Future<void> _loadGameData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastPlayDateString = prefs.getString('lastPlayDate');
    int? tapCount = prefs.getInt('tapCount');

    if (lastPlayDateString != null) {
      _lastPlayDate = DateTime.parse(lastPlayDateString);
    }

    if (_lastPlayDate != null &&
        _lastPlayDate!.day == DateTime.now().day &&
        tapCount != null) {
      _tapCount = tapCount;
    } else {
      _resetGame();
    }

    setState(() {});
  }

  Future<void> _saveGameData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastPlayDate', DateTime.now().toIso8601String());
    await prefs.setInt('tapCount', _tapCount);
  }

  void _resetGame() {
    _tapCount = 0;
    _currentTreeIndex = 0;
    _lastPlayDate = DateTime.now();
  }

  void _onButtonTap() {
    if (_tapCount < 10) {
      setState(() {
        _tapCount++;
        _currentTreeIndex = (_currentTreeIndex + 1) % _treeImages.length;
      });
      _saveGameData();
    }

    if (_tapCount == 10) {
      _showGameCompleteDialog();
    }
  }

  void _showGameCompleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Oyun Tamamlandı'),
        content: Text('Bugün için maksimum tıklama hakkına ulaştınız.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Tamam'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (!_isGameStarted)
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(50),
                  backgroundColor: Colors.blue,
                  elevation: 8,
                ),
                onPressed: () {
                  setState(() {
                    _isGameStarted = true;
                  });
                },
                child: Text(
                  'OYUNA BAŞLA',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (_isGameStarted)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'), // Arka plan resmi
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      _treeImages[_currentTreeIndex],
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _onButtonTap,
                        child: Text('Su'),
                      ),
                      ElevatedButton(
                        onPressed: _onButtonTap,
                        child: Text('Güneş'),
                      ),
                      ElevatedButton(
                        onPressed: _onButtonTap,
                        child: Text('Gübre'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
