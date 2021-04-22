import 'package:a_2_z_store/models/productDetails.dart';
import 'package:a_2_z_store/repositories/asosRepository.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  final int id;
  ProductDetails data;
  var dropDownValue;

  AsosRepository _asosRepository = AsosRepository();

  ProductDetailsProvider(this.id) {
    getProductDetails();
  }

  void getProductDetails() {
    _asosRepository.fetchProductDetails(id).then((newData) {
      data = newData;
      notifyListeners();
    });
  }

  void dropDown(String newval) {
    dropDownValue = newval;
    notifyListeners();
  }
}
