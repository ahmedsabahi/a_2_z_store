import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteList with ChangeNotifier {
  List<String> _favoriteIds = [];
  List<String> get ids => _favoriteIds;

  FavoriteList() {
    load();
  }

  void load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _favoriteIds = prefs.getStringList('my_favorite_list') ?? [];
    notifyListeners();
  }

  void save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('my_favorite_list', _favoriteIds);
  }

  void clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  bool isFavorite(String id) {
    return _favoriteIds.contains(id);
  }

  void toggle(String id) {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    save();
    notifyListeners();
  }
}