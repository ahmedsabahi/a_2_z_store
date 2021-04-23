import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartList with ChangeNotifier {
  List<String> _cartIds = [];
  List<String> get ids => _cartIds;
  final ScrollController scrollController = ScrollController();

  CartList() {
    scrollController
      ..addListener(() {
        var triggerFetchMoreSize =
            0.7 * scrollController.position.maxScrollExtent;
        if (scrollController.position.pixels > triggerFetchMoreSize) {
          load();
        }
      });
    load();
  }

  void load() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    _cartIds = pref.getStringList('my_cart_list') ?? [];
    notifyListeners();
  }

  void save() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('my_cart_list', _cartIds);
  }

  void clear() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  void addToCart(String id) {
    _cartIds.add(id);
    save();
    notifyListeners();
  }
}

