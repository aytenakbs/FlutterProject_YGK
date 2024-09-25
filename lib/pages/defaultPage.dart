import 'package:flutter/material.dart';
import 'package:ygk_project/constants/colors.dart';
import 'package:ygk_project/pages/chainPage.dart';
import 'package:ygk_project/pages/home.dart';
import 'package:ygk_project/pages/informingPage.dart';
import 'package:ygk_project/widgets/transparentCard.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/images/plant-5740098_1920.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  color: AppColors.lightGrayColor,
                ),
              ),
            ),
            // 2. Sayfa İçeriği
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // İlk Card
                    TransparentCard(
                      icon: Icons.task_alt,
                      title: 'Hedefler',
                      targetPage: HomePage(),
                    ),
                    SizedBox(height: 20),
                    // İkinci Card
                    TransparentCard(
                      icon: Icons.energy_savings_leaf,
                      title: 'Neler Yapabilirim?',
                      targetPage: InformingPage(),
                    ),
                    SizedBox(height: 20),
                    // Üçüncü Card
                    TransparentCard(
                      icon: Icons.pattern,
                      title: 'Hedef Zincirleri',
                      targetPage: ChainPage(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
