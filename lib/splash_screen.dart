import 'package:flutter/material.dart';
import 'dart:async'; // Timer için gerekli
import 'main.dart'; // MainPage'i içe aktar

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 2 saniye sonra MainPage'e yönlendirme
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainPage(), // MainPage'e yönlendirme yapıyoruz
        ),
      );
    });
  }

  // Karşılama ekranı
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/news_app_splash.png"), // Resmi yüklüyoruz
              fit: BoxFit.cover, // Ekrana tam sığdırıyoruz
            ),
          ),
        ),
      ),
    );
  }
}
