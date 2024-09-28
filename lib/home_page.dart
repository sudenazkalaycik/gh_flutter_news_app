import 'package:flutter/material.dart';
import 'news_details_page.dart'; // Yeni sayfayı içe aktar
import 'favorites_model.dart'; // Favori modelini ekle
import 'package:provider/provider.dart'; // Provider kütüphanesini ekle

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(
            child: Text('HABERLER',
            style: TextStyle(color: Colors.white),),
          ),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<Map<String, String>> items = List.generate(
    20,
        (index) => {
      'title': 'Kart ${index + 1}',
      'image': 'https://via.placeholder.com/150',
      'description': 'Bu, Kart ${index + 1}\'in açıklaması.'
    },
  );

  @override
  Widget build(BuildContext context) {
    final favoritesModel = Provider.of<FavoritesModel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailsPage(
                      title: item['title']!,
                      description: item['description']!,
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Card(
                    elevation: 4,
                    child: Container(
                      width: screenWidth - 32,
                      height: screenHeight * 0.4,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              item['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item['title']!,
                              style: const TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
                        favoritesModel.isFavorite(item)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        favoritesModel.toggleFavorite(item); // Kartın tüm verilerini gönderiyoruz
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
