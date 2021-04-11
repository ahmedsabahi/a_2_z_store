import 'package:a_2_z_store/models/categoriesList.dart';
import 'package:a_2_z_store/models/productDetails.dart';
import 'package:a_2_z_store/models/productList.dart';
import 'package:http/http.dart' as http;

class AsosServices {
  Future<CategoriesList> fetchCategoriesList() async {
    var url = Uri.parse(
        'https://asos2.p.rapidapi.com/categories/list?rapidapi-key=7a5b8ea623mshfcb41408397c09ap18e240jsn6e3f3fb908fd&country=US&lang=en-US');
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
  Future<ProductList> fetchProductList(int categoryId) async {
    var url = Uri.parse(
        'https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=7a5b8ea623mshfcb41408397c09ap18e240jsn6e3f3fb908fd&offset=0&categoryId=$categoryId&limit=48&store=US&country=US&currency=USD&sort=freshness&lang=en-US&sizeSchema=US');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return productListFromJson(response.body);
    } else {
      throw Exception(
          'Request (Product List) failed with status: ${response.statusCode}. ');
    }
  }

  //productId : from ProductList API
  Future<ProductDetails> fetchProductDetails(int productId) async {
    var url = Uri.parse(
        'https://asos2.p.rapidapi.com/products/v3/detail?rapidapi-key=7a5b8ea623mshfcb41408397c09ap18e240jsn6e3f3fb908fd&id=$productId&store=US&sizeSchema=US&lang=en-US&currency=USD');
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
