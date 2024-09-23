import 'package:flutter/material.dart';
import 'package:ygk_project/pages/insertTask.dart';
import '../widgets/customAppBar.dart';
import '../constants/colors.dart';
import '../widgets/todoitem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> todo = [
    "Study lessons",
    "Read a book",
    "Go for a walk",
    "Work out for 1 hour",
    "Ride a bike"
  ];

  List<String> completedTasks = [
    "Drink 2L water",
    "Sort garbage",
    "Solve a puzzle",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.secondColor,
          body: Column(
            children: [

              const CustomAppBar(),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      return ToDoItem(title: todo[index]);
                    },
                  ),
                ),
              ),


              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Completed",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: completedTasks.length,
                    itemBuilder: (context, index) {
                      return ToDoItem(title: completedTasks[index]);
                    },
                  ),
                ),
              ),

              // Add New Task Button
              Padding(
                padding: const EdgeInsets.only(bottom:10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const InsertTaskPage(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("Add A New Task"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
