import 'package:flutter/material.dart';
import 'profilUpdate.dart'; // Güncelleme sayfasının dosyası
import 'defaultPage.dart';
class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {

  final String email = "ayfat@gmail.com";
  final String password = "ayfat@gmail.com";

  @override
  Widget build(BuildContext context) {
    return WillPopScope( // Bu widget, geri tuşuna basıldığında özelleştirilmiş bir işlem yapılmasını sağlar
      onWillPop: () async {
        // Burada geri tuşuna basıldığında yapılacak işlemi belirtiyoruz
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DefaultPage()), // DefaultPage, ana sayfanız olmalı
              (route) => false, // Yönlendirmeyi yığının en başına yapıyoruz
        );
        return Future.value(false); // Bu, geri tuşunun normal işleyişini engeller
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profilim'),
          centerTitle: true,
          backgroundColor: const Color(0x803C883C),
        ),
        body: Stack(
          children: [
            // Arka plan resmi
            // Arka plana opak resim ekleniyor
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/woman.jpeg'), // Resim dosyasının yolu
                  fit: BoxFit.cover, // Resmi tam ekrana yayar
                ),
              ),
              child: Container(
                color: Colors.lightGreen.withOpacity(0.4), // Opaklık eklemek için renk ve şeffaflık
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/woman.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Kartlar ve buton
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  _buildCard('Email: $email'), // Email kartı
                  const SizedBox(height: 14),
                  _buildCard('Şifre: $password'), // Şifre kartı
                  const SizedBox(height: 14),

                  const Spacer(), // Kalan alanı doldurur
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UpdateProfilePage()), // Güncelleme sayfasına geçiş
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF1F8E9),
                      ),
                      child: const Text(
                        'Profil Güncelle',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Kart oluşturma fonksiyonu
  Widget _buildCard(String text) {
    return Card(
      color: Colors.white.withOpacity(0.7), // Kartın arka planı yarı saydam beyaz
      elevation: 4, // Kartın gölgelendirme yüksekliği
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Kartın köşelerini yuvarlatır
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Kart içeriği için boşluk
        child: Text(
          text, // Kart üzerinde gösterilecek metin
          style: const TextStyle(
            fontSize: 16, // Metin boyutu
            fontWeight: FontWeight.bold, // Metin kalınlığı
            color: Colors.black, // Metin rengi
          ),
        ),
      ),
    );
  }
}