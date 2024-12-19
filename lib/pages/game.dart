import 'package:flutter/material.dart';

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

  void updateBackground() {
    setState(() {
      imageIndex = (imageIndex + 1) % imagePaths.length;
    });
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
                          color: Colors.black38,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionButton('Su', updateBackground),
                  _buildActionButton('Güneş', updateBackground),
                  _buildActionButton('Gübre', updateBackground),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: TextStyle(fontSize: 16),
        backgroundColor: Colors.white.withOpacity(0.5),
        foregroundColor: Colors.black,
      ),
    );
  }
}
