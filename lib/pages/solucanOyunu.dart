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
            fit: BoxFit.cover, // Tüm ekranı kapla
            repeat: ImageRepeat.repeatY, // Yukarıdan aşağıya tekrar
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

class SeviyePaneli extends StatelessWidget {
  final int toplamSeviye = 10; // Toplam buton sayısı
  final double padding = 10; // Sayfa kenarlarından boşluk
  final double buttonSpacing = 30; // Butonlar arasındaki dikey boşluk

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double maxOffset = screenWidth - padding * 2 - 80; // Maksimum kayma mesafesi (buton boyutuyla birlikte)

    return Scaffold(
      appBar: AppBar(
        title: Text("Solucan Oyunu"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/grossback.jpeg"), // Resim yolu
            fit: BoxFit.cover, // Tüm ekranı kapla
            repeat: ImageRepeat.repeatY, // Yukarıdan aşağıya tekrar
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: ListView.builder(
            itemCount: toplamSeviye,
            itemBuilder: (context, index) {
              double offset = (index % ((maxOffset / 3).ceil() * 2)) * 80; // Kayma miktarını belirler
              bool isDecreasing = offset >= maxOffset; // Tersine dönme noktası
              if (isDecreasing) {
                offset = maxOffset - (offset - maxOffset);
              }

              return Container(
                margin: EdgeInsets.only(top: buttonSpacing),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: offset),
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Buton $index tıklandı!")),
                    );
                  },
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
