import 'package:flutter/material.dart';
import 'package:ygk_project/constants/colors.dart';
import 'package:ygk_project/models/task.dart';
import 'package:ygk_project/constants/taskType.dart';
import 'package:ygk_project/pages/chainPage.dart';
import 'package:ygk_project/pages/home.dart';
import 'package:ygk_project/pages/informingPage.dart';
import 'package:ygk_project/pages/profilPage.dart';
import 'package:ygk_project/pages/solucanOyunu.dart';
import 'package:ygk_project/widgets/transparentCard.dart';
import 'package:ygk_project/pages/game.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  // Görevler ve tamamlanan görevler listesi
  List<Task> tasks = [
    Task(
      type: TaskType.drop,
      title: "Su tasarrufu yap",
      description: "Diş fırçalarken veya bulaşık yıkarken suyu boşa akıtma.",
      isCompleted: false,
    ),
    Task(
      type: TaskType.power,
      title: "Enerji Verimliliği Sağlamak",
      description:
      "Kullanmadığın odalardaki ışıkları kapat, enerji tasarruflu ampuller kullan.",
      isCompleted: false,
    ),
    Task(
      type: TaskType.nature,
      title: "Daha Az Kağıt Kullanmak",
      description:
      "Dijital faturalar ve notlar kullanarak kağıt israfını önlemek.",
      isCompleted: false,
    ),
    Task(
      type: TaskType.plastic,
      title: "Plastik Kullanımını Azaltmak",
      description:
      "Alışverişlerde bez çanta kullanmak, plastik şişe ve torbalardan kaçınmak.",
      isCompleted: false,
    ),
    Task(
      type: TaskType.recycle,
      title: "Geri Dönüşüm Yapmak",
      description: "Kağıt, cam, plastik ve metal atıkları ayrıştırmak.",
      isCompleted: false,
    ),
  ];

  List<Task> completedTasks = [];

  // Görevi tamamlama işlevi
  void completeTask(Task task) {
    setState(() {
      task.isCompleted = true;
      completedTasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.1),
          elevation: 0, // Gölgeyi kaldırır
          title: const Text(
            '                             uygulama adı ',
            style: TextStyle(color: Colors.black54),
          ),
          iconTheme: const IconThemeData(color: Colors.pink, size: 40),
          leading: IconButton(
            icon: const Icon(Icons.gamepad, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  GameScreen()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.manage_accounts),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                    const ProfilPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0); // Yüksekten aşağıya kayma animasyonu
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow, color: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SolucanOyunu()),
                );
              },
            ),
          ],
        ),
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
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TransparentCard(
                      icon: Icons.task_alt,
                      title: 'Hedefler',
                      targetPage: HomePage(
                        tasks: tasks,
                        onComplete: completeTask,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TransparentCard(
                      icon: Icons.energy_savings_leaf,
                      title: 'Neler Yapabilirim?',
                      targetPage: const InformingPage(),
                    ),
                    const SizedBox(height: 20),
                    TransparentCard(
                      icon: Icons.pattern,
                      title: 'Hedef Zincirleri',
                      targetPage: ChainPage(
                        completedTasks: completedTasks,
                      ),
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
