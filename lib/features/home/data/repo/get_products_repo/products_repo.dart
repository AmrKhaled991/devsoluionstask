import 'package:devsoluionstask/features/home/data/models/product_response.dart';

abstract class ProductsRepo {
  Future<List<ProductResponse>> getProducts();
  
}
