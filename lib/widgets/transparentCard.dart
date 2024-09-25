
import 'package:flutter/material.dart';
import 'package:ygk_project/constants/colors.dart';

class TransparentCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget targetPage;

  const TransparentCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.targetPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Card(
        color: Colors.white.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:20),
                child: Icon(
                    icon, size: 50, color: AppColors.greenColor),
              ),
              const SizedBox(width: 20),
              Text(
                title, // Metin
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
