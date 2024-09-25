// task_types.dart
import 'package:flutter/material.dart';
import 'package:ygk_project/constants/colors.dart';
import 'package:ygk_project/models/category.dart';

enum TaskType {
  recycle,
  drop,
  power,
  nature,
  plastic,
}

List<Category> categories = [
  Category(name: "Geri Dönüşüm", icon: Icons.autorenew, color: AppColors.greenColor),
  Category(name: "Su Tasarrufu", icon: Icons.water_drop, color: AppColors.blueColor),
  Category(name: "Enerji Tasarrufu", icon: Icons.power, color: AppColors.purpleColor),
  Category(name: "Doğal Kaynakların Korunması", icon: Icons.park, color: AppColors.greenColor),
  Category(name: "Plastik Kullanımını Azaltma", icon: Icons.no_drinks, color: AppColors.orangeColor),
];

// TaskType ile Category eşleşmesi
Map<TaskType, Category> taskTypeToCategory = {
  TaskType.recycle: categories[0],
  TaskType.drop: categories[1],
  TaskType.power: categories[2],
  TaskType.nature: categories[3],
  TaskType.plastic: categories[4],
};
