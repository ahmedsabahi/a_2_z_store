import 'package:a_2_z_store/models/categoriesList.dart';
import 'package:a_2_z_store/repositories/asosRepository.dart';
import 'package:flutter/material.dart';

class BrandsCategoryProvider extends ChangeNotifier {
  CategoriesList list;

  AsosRepository _asosRepository = AsosRepository();

  BrandsCategoryProvider() {
    getCategories();
  }

  void getCategories() {
    _asosRepository.fetchCategoriesList().then((newList) {
      list = newList;
      notifyListeners();
    });
  }
}
