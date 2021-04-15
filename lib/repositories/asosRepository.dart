import 'package:a_2_z_store/models/categoriesList.dart';
import 'package:a_2_z_store/models/productDetails.dart';
import 'package:a_2_z_store/models/productList.dart';
import 'package:a_2_z_store/services/asosService.dart';

class AsosRepository {
  AsosServices _asosRepository = AsosServices();

  Future<CategoriesList> fetchCategoriesList() {
    return _asosRepository.fetchCategoriesList();
  }

  Future<List<Product>> fetchProductList(int offset, int categoryId) {
    return _asosRepository.fetchProductList(offset, categoryId);
  }

  Future<ProductDetails> fetchProductDetails(int productId) {
    return _asosRepository.fetchProductDetails(productId);
  }
}
