import 'package:flutter/material.dart';

class DateFieldExpanded extends StatefulWidget {
  const DateFieldExpanded({super.key, required this.text});

  final String text;

  @override
  State<DateFieldExpanded> createState() => _DateFieldExpandedState();
}

class _DateFieldExpandedState extends State<DateFieldExpanded> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
