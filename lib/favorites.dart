import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Provider kütüphanesini ekle

import 'favorites_model.dart'; // Favori modelini ekle
import 'news_details_page.dart'; // Yeni sayfayı içe aktar

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesModel = Provider.of<FavoritesModel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite, color: Colors.white),
              SizedBox(width: 8),
              Text('Favoriler', style: TextStyle(color: Colors.white)),
            ],
          ),
          backgroundColor: Colors.black,
        ),
        body: favoritesModel.favorites.isEmpty
            ? const Center(
          child: Text(
            'Favorilerinizde bir haber bulunmuyor 📰',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          itemCount: favoritesModel.favorites.length,
          itemBuilder: (context, index) {
            final favoriteItem = favoritesModel.favorites[index]; // Favori kartın verilerini alıyoruz

            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsPage(
                        title: favoriteItem['title']!,
                        description: favoriteItem['description']!,
                      ),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  child: ListTile(
                    leading: Image.network(
                      favoriteItem['image']!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      favoriteItem['title']!,
                      style: const TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.black),
                      onPressed: () {
                        favoritesModel.toggleFavorite(favoriteItem);
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
