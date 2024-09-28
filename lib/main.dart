import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Provider kütüphanesini ekle
import 'splash_screen.dart'; // SplashScreen'i içe aktar
import 'favorites_model.dart'; // Favori modeli ekle
import 'home_page.dart'; // HomePage'i içe aktar
import 'favorites.dart'; // FavoritesPage'i içe aktar

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Ana sayfa olarak MainPage'i ayarlıyoruz
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();// splash yapılması gerekiyor mu !!!!

}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0; // Geçerli sayfa indeksini tut

  final List<Widget> _pages = [
    HomePage(), // Ana sayfa
    FavoritesPage(), // Favoriler sayfası
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Geçerli sayfayı göster
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoriler',
          ),
        ],
        currentIndex: _currentIndex, // Geçerli sayfayı belirle
        selectedItemColor: Colors.white, // Seçilen ikon rengi beyaz
        unselectedItemColor: Colors.white54, // Seçilmemiş ikon rengi açık beyaz
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Geçerli sayfayı güncelle
          });
        },
      ),
    );
  }
}
