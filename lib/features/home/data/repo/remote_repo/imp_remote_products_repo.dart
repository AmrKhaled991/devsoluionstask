import 'package:devsoluionstask/core/api/api_servieses.dart';
import 'package:devsoluionstask/features/home/data/models/product_response.dart';
import 'package:devsoluionstask/features/home/data/repo/remote_repo/remote_products_repo%20copy.dart';

class ImpRemoteProductsRepo extends RemoteProductsRepo {
  ApiServices apiServices;

  ImpRemoteProductsRepo({required this.apiServices});
  
  @override
  Future<List<ProductResponse>> getProducts() {
    return apiServices.getProducts();
  }
}
