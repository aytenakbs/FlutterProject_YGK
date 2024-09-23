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
      color: AppColors.firstColor,
      width: deviceWidth,
      height: deviceHeight / 5,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              "Habit Chain App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              formattedDate,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
