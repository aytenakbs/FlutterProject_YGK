import 'package:flutter/material.dart';
import 'profilUpdate.dart'; // Güncelleme sayfasının dosyası

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final String name = "Ayşe Fatma";
  final String email = "ayfat@gmail.com";
  final String phoneNumber = "5396137980";
  final String birthDate = "07/03/1991";
  final String address = "Adana, Türkiye";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilim'),
        centerTitle: true,
        backgroundColor: const Color(0xFF8EB486),
      ),
      body: Stack(
        children: [
          // Arka plan resmi
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
            padding: const EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCard('Ad Soyad: $name'), // Ad Soyad kartı
                const SizedBox(height: 16),
                _buildCard('Email: $email'), // Email kartı
                const SizedBox(height: 16),
                _buildCard('Telefon: $phoneNumber'), // Telefon kartı
                const SizedBox(height: 16),
                _buildCard('Doğum Tarihi: $birthDate'), // Doğum Tarihi kartı
                const SizedBox(height: 16),
                _buildCard('Adres: $address'), // Adres kartı
                const Spacer(), // Kalan alanı doldurur
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdateProfilePage()), // const ifadesi kaldırıldı

                      ); // Güncelleme sayfasına geçiş
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F4529),
                    ),
                    child: const Text(
                      'Profil Güncelle',
                      style: TextStyle(color: Colors.white),
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