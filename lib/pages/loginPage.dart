import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ygk_project/services/auth.dart';
import 'defaultPage.dart'; // Başarılı giriş için yönlendirme yapılacak sayfa

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? errorMessage;
  bool isLogin = true;

  Future<void> createUser() async {
    try {
      await Auth().createUser(
        email: emailController.text,
        password: passwordController.text,
      );
      // Kayıt başarılı, defaultPage'e yönlendirme
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DefaultPage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> signIn() async {
    try {
      await Auth().signIn(
        email: emailController.text,
        password: passwordController.text,
      );
      print(Auth().currentUser!.uid);
      // Giriş başarılı, defaultPage'e yönlendirme
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DefaultPage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-posta',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (isLogin) {
                  signIn();
                } else {
                  createUser();
                }
              },
              child: isLogin
                  ? const Text('Giriş Yap')
                  : const Text('Kayıt Ol'),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLogin = !isLogin;
                  errorMessage = null; // Durum değiştirirken hata mesajını sıfırla
                });
              },
              child: Text(
                isLogin
                    ? 'Henüz hesabınız yok mu? Tıklayın!'
                    : 'Zaten hesabınız var mı? Giriş Yapın!',
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
