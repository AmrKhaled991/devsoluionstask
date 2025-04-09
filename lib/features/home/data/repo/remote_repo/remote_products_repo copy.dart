import 'package:devsoluionstask/features/home/data/models/product_response.dart';

abstract class RemoteProductsRepo {
  Future<List<ProductResponse>> getProducts();
}
