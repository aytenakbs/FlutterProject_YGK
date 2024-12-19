import 'package:flutter/material.dart';

class TreeGame extends StatefulWidget {
  @override
  _TreeGameState createState() => _TreeGameState();
}

class _TreeGameState extends State<TreeGame> {
  int score = 0; // Oyuncunun puanı
  int leaves = 5; // Kalan yaprak sayısı

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doğa Kurtarma Oyunu'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Üst kısım: Puan ve Yaprak sayısı
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Puan: $score',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Yapraklar: $leaves',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // Orta kısım: Ağaç görseli
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/tree.png', // Ağacın görseli
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Alt kısım: Aksiyon butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionButton('Su Ver', Colors.blue, 'water'),
                _actionButton('Güneş Ver', Colors.orange, 'sun'),
                _actionButton('Gübre Ver', Colors.brown, 'fertilizer'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Aksiyon butonu için bir yardımcı widget
  Widget _actionButton(String label, Color color, String action) {
    return ElevatedButton(
      onPressed: () => performAction(action),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Aksiyon butonuna basıldığında yapılacaklar
  void performAction(String action) {
    // Şimdilik sadece aksiyonun adı yazdırılıyor
    print('$action butonuna basıldı!');
  }
}