import 'package:flutter/material.dart';
import 'package:ygk_project/constants/colors.dart';
import 'package:ygk_project/constants/taskType.dart';

import 'package:ygk_project/widgets/dateFieldExpanded.dart';


class InsertTaskPage extends StatelessWidget {
  const InsertTaskPage({super.key});

  @override
  Widget build(BuildContext context) {

    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          toolbarHeight: deviceHeight / 10,
          backgroundColor: AppColors.greenColor,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
          ),
          title: const Text(
            "Yeni Görev Oluştur",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(13),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Başlık:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const Text(
                  "Kategori:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: categories.map((category) {
                      return GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(milliseconds: 400),
                              content: Text("${category.name} kategorisi seçildi."),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15, bottom: 7),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: category.color,
                          ),
                          child: Icon(
                            category.icon,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const Row(
                  children: [
                    DateFieldExpanded(text: "Tarih:"),
                    DateFieldExpanded(text: "Zaman:"),
                  ],
                ),
                const SizedBox(height: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notlar:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 10),
                      child: SizedBox(
                        height: 150,
                        child: TextField(
                          expands: true,
                          maxLines: null,
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      "Kaydet",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );

  }
}
