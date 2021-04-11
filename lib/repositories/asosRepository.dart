import 'package:a_2_z_store/models/categoriesList.dart';
import 'package:a_2_z_store/models/productDetails.dart';
import 'package:a_2_z_store/models/productList.dart';

class AsosRepository {
  AsosRepository _asosRepository = AsosRepository();

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
