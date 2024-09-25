import 'package:flutter/material.dart';
import 'package:ygk_project/constants/taskType.dart';
import 'package:ygk_project/models/task.dart';
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

  List<Task> tasks=[
    Task(type: TaskType.drop, title: "Su tasarrufu yap", description: "Diş fırçalarken veya bulaşık yıkarken suyu boşa akıtma.", isCompleted: false),
    Task(type: TaskType.power, title: "Enerji Verimliliği Sağlamak", description: "Kullanmadığın odalardaki ışıkları kapat, enerji tasarruflu ampuller kullan.",  isCompleted: false),
    Task(type: TaskType.nature, title: "Daha Az Kağıt Kullanmak", description: "Dijital faturalar ve notlar kullanarak kağıt israfını önlemek.",  isCompleted: false),

  ];

  List<Task> completedTasks = [
    Task(type: TaskType.plastic, title: "Plastik Kullanımını Azaltmak", description: "Alışverişlerde bez çanta kullanmak, plastik şişe ve torbalardan kaçınmak.",  isCompleted: false),
    Task(type: TaskType.recycle, title: "Geri Dönüşüm Yapmak", description: "Kağıt, cam, plastik ve metal atıkları ayrıştırmak.",  isCompleted: false),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

        home: Scaffold(
          appBar: AppBar(

backgroundColor: AppColors.whiteColor,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back, size: 30, color: AppColors.darkGrayColor),
            ),
            title: const Text(
              "Günlük Hedefler",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color:AppColors.darkGrayColor,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: AppColors.whiteColor,
          body: Column(
            children: [

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ToDoItem(task: tasks[index],);
                    },
                  ),
                ),
              ),


              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Tamamlananlar:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: completedTasks.length,
                    itemBuilder: (context, index) {
                      return ToDoItem(task: completedTasks[index],);
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
                  child: const Text("Yeni Görev Ekle"),
                ),
              )
            ],
          ),
        ),

    );
  }
}
