import 'dart:convert';

import 'package:a_2_z_store/models/categoriesList.dart';
import 'package:a_2_z_store/models/productDetails.dart';
import 'package:a_2_z_store/models/productList.dart';
import 'package:http/http.dart' as http;

class AsosServices {
  Future<CategoriesList> fetchCategoriesList() async {
    var url = Uri.parse(
        'https://asos2.p.rapidapi.com/categories/list?rapidapi-key=c7bb81a895mshfca17afdaccc124p11c2cbjsn1dcd84ba9c77&country=US&lang=en-US');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return categoriesListFromJson(response.body);
    } else {
      throw Exception(
          'Request (Categories List) failed with status: ${response.statusCode}. ');
    }
  }

  //categoryId : from CategoriesList API
  //offset : infinite scroll
  Future<List<Product>> fetchProductList(int offset, int categoryId) async {
    var url = Uri.parse(
        'https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=c7bb81a895mshfca17afdaccc124p11c2cbjsn1dcd84ba9c77&offset=$offset&categoryId=$categoryId&limit=48&store=US&country=US&currency=USD&sort=freshness&lang=en-US&sizeSchema=US');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return List<Product>.from((json.decode(response.body)["products"] as List)
          .map((x) => Product.fromJson(x))).toList();
    } else {
      throw Exception(
          'Request (Product List) failed with status: ${response.statusCode}. ');
    }
  }

  //productId : from ProductList API
  Future<ProductDetails> fetchProductDetails(int productId) async {
    var url = Uri.parse(
        'https://asos2.p.rapidapi.com/products/v3/detail?rapidapi-key=c7bb81a895mshfca17afdaccc124p11c2cbjsn1dcd84ba9c77&id=$productId&store=US&sizeSchema=US&lang=en-US&currency=USD');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return productDetailsFromJson(response.body);
    } else {
      throw Exception(
          'Request (Product Details) failed with status: ${response.statusCode}. ');
    }
  }
}
