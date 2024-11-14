import 'package:delivery/data/categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<FoodCategory> _favorites = [];
  List<FoodCategory> get favorites => _favorites;

  void toggleFavorite(FoodCategory product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isExist(FoodCategory product) {
    final isExist = _favorites.contains(product);
    return isExist;
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
