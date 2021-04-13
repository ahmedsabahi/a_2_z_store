import 'package:a_2_z_store/models/categoriesList.dart';
import 'package:a_2_z_store/models/productDetails.dart';
import 'package:a_2_z_store/models/productList.dart';
import 'package:a_2_z_store/services/asosService.dart';

class AsosRepository {
  AsosServices _asosRepository = AsosServices();

  Future<CategoriesList> fetchCategoriesList() {
    return _asosRepository.fetchCategoriesList();
  }

  Future<ProductList> fetchProductList(int categoryId) {
    return _asosRepository.fetchProductList(categoryId);
  }

  Future<ProductDetails> fetchProductDetails(int productId) {
    return _asosRepository.fetchProductDetails(productId);
  }
}
