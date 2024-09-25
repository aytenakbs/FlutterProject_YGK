import 'package:flutter/material.dart';
import 'package:ygk_project/constants/taskType.dart';
import 'package:ygk_project/models/task.dart';
import '../constants/colors.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({super.key, required this.task});

  final Task task;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final category = taskTypeToCategory[widget.task.type]!;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              category.icon,
              size: 40,
              color: category.color,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.title,
                    style: const TextStyle(
                      color: AppColors.darkGrayColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  Text(widget.task.description,
                      style: const TextStyle(
                          color: AppColors.darkGrayColor, fontSize: 20)),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(() {
                  widget.task.isCompleted = !widget.task.isCompleted;
                  isChecked = val!;
                })
              },
            ),
          ],
        ),
      ),
    );
  }
}
