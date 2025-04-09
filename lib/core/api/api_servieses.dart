import 'package:devsoluionstask/core/utils/helpers/parseProductList.dart';
import 'package:devsoluionstask/features/home/data/models/product_response.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static const url = "https://fakestoreapi.com/products";

  ApiServices(this.dio);
  Dio dio;

  Future<List<ProductResponse>> getProducts() async {
    final response = await dio.get(url);
    return parseProductList(response.data);
  }
}
