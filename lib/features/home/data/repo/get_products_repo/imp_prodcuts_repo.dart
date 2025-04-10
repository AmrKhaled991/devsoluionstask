import 'package:devsoluionstask/core/errors/cust0m_errors.dart';
import 'package:devsoluionstask/features/home/data/models/product_response.dart';
import 'package:devsoluionstask/features/home/data/repo/get_products_repo/products_repo.dart';
import 'package:devsoluionstask/features/home/data/repo/remote_repo/remote_products_repo%20copy.dart';
import 'package:dio/dio.dart';

class ImpProductsRepo extends ProductsRepo {
  final RemoteProductsRepo remoteProductsRepo;
  ImpProductsRepo(this.remoteProductsRepo);
  @override
  Future<List<ProductResponse>> getProducts() async {
    try {
      var res = await remoteProductsRepo.getProducts();
      return res;
    } on Exception catch (e) {
       
      if (e is DioException) {
       throw e;
      }
      throw (ServerError('sorry for this error,please try again later'));
    }
  }
}
