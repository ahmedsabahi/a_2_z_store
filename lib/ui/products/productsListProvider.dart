import 'package:a_2_z_store/models/productList.dart';
import 'package:a_2_z_store/repositories/asosRepository.dart';
import 'package:flutter/material.dart';

class ProductsListProvider extends ChangeNotifier {
  final int id;
  // ProductList list;
  int offset = 0;
  List<Product> list = [];

  final ScrollController scrollController = ScrollController();

  AsosRepository _asosRepository = AsosRepository();

  ProductsListProvider(this.id) {
    scrollController
      ..addListener(() {
        var triggerFetchMoreSize =
            0.7 * scrollController.position.maxScrollExtent;
        if (scrollController.position.pixels > triggerFetchMoreSize) {
          getProductsList();
        }
      });
    getProductsList();
  }

  void getProductsList() async {
    List<Product> newList = await _asosRepository.fetchProductList(offset, id);
    list = [...list, ...newList];
    notifyListeners();
    offset++;
  }
}
