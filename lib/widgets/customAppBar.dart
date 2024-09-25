import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    DateTime now = DateTime.now();
    String formattedDate = "${now.day}.${now.month}.${now.year}";

    return Container(
      width: deviceWidth,
      height: deviceHeight / 3,
      child: Stack(
        fit: StackFit.expand,
        children: [

          Opacity(
            opacity: 0.7, // Burada opaklık seviyesini belirliyorsun
            child: const Image(
              image: AssetImage("lib/assets/images/foto1.jpeg"),
              fit: BoxFit.cover,
            ),
          ),

          Container(
            color: AppColors.lightGrayColor.withOpacity(0.7), // Arka planda renk ve opaklık
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    "Hedefler",
                    style: TextStyle(
                        color: AppColors.darkGrayColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    formattedDate,
                    style: const TextStyle(
                      color: AppColors.darkGrayColor,
                      fontSize: 22,
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
}
