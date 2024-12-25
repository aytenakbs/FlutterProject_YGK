import 'package:flutter/material.dart';

void main() => runApp(SolucanOyunu());

class SolucanOyunu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/grossback.jpeg"), // Resim yolu
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeatY,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeviyePaneli(),
                ),
              );
            },
            child: Text("Oyuna Başla", style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
}

class SeviyePaneli extends StatefulWidget {
  @override
  _SeviyePaneliState createState() => _SeviyePaneliState();
}

class _SeviyePaneliState extends State<SeviyePaneli> {
  final int toplamSeviye = 10;
  final double padding = 10;
  final double buttonSpacing = 30;
  int toplamPuan = 0;

  void _butonTiklandi(int index) {
    // Görev açıklamaları ve resimler
    List<String> gorevler = [
      "Görev 1: Bir ağacı sula!",
      "Görev 2: Çöp kutusunu boşalt!",
      "Görev 3: Plastik atıkları ayrıştır!",
      "Görev 4: Kompost yap!",
      "Görev 5: Toplu taşıma kullan!",
      "Görev 6: Elektrik tasarrufu yap!",
      "Görev 7: Kağıt geri dönüşümü başlat!",
      "Görev 8: Su kullanımını azalt!",
      "Görev 9: Yerel ürünler kullan !",
      "Görev 10: Yeni bir bitki ek!",
    ];

    // Popup göster
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Görev ${index + 1}"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("lib/assets/images/${index + 1}a.jfif"), // Resim yolu
              SizedBox(height: 10),
              Text(gorevler[index]),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  toplamPuan += 10; // Her görev tamamlandığında 10 puan ekle
                });
                Navigator.of(context).pop();
              },
              child: Text("Görevi Tamamla"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double maxOffset = screenWidth - padding * 2 - 80;

    return Scaffold(
      appBar: AppBar(
        title: Text("Solucan Oyunu - Puan: $toplamPuan"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/grossback.jpeg"),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeatY,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: ListView.builder(
            itemCount: toplamSeviye,
            itemBuilder: (context, index) {
              double offset = (index % ((maxOffset / 3).ceil() * 2)) * 80;
              bool isDecreasing = offset >= maxOffset;
              if (isDecreasing) {
                offset = maxOffset - (offset - maxOffset);
              }

              return Container(
                margin: EdgeInsets.only(top: buttonSpacing),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: offset),
                child: GestureDetector(
                  onTap: () => _butonTiklandi(index),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}