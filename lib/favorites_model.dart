import 'package:flutter/material.dart';

class FavoritesModel extends ChangeNotifier {
  // Favorilere eklenen kartları tutacak liste (her kartın bilgileri başlık, resim, açıklama)
  final List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  // Favorilere kart ekleme/çıkarma işlemi
  void toggleFavorite(Map<String, String> item) {
    if (_favorites.contains(item)) {
      _favorites.remove(item);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }

  // Bir kartın favori olup olmadığını kontrol etme
  bool isFavorite(Map<String, String> item) {
    return _favorites.contains(item);
  }
}
