import 'package:devsoluionstask/core/api/api_servieses.dart';
import 'package:devsoluionstask/features/home/data/repo/get_products_repo/imp_prodcuts_repo.dart';
import 'package:devsoluionstask/features/home/data/repo/get_products_repo/products_repo.dart';
import 'package:devsoluionstask/features/home/data/repo/remote_repo/imp_remote_products_repo.dart';
import 'package:devsoluionstask/features/product/data/repo/favorite_product_repo/favorite_product_repo.dart';
import 'package:devsoluionstask/features/product/data/repo/favorite_product_repo/imp_favorite_product_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setupGitItLocator() {
  getit.registerSingleton<ApiServices>(ApiServices(Dio()));
  getit.registerSingleton<ProductsRepo>(
    ImpProductsRepo(ImpRemoteProductsRepo(apiServices: getit.get())),
  );
  getit.registerSingleton<FavoriteProductRepo>(FavoriteProductRepoImp()); 
}
