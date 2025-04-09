
import 'package:dio/dio.dart';

class ApiServess {
  static const url = "https://fakestoreapi.com/products";
  

  ApiServess(this.dio);
  Dio dio;

  // Future<Getallpackagesrepsonse> getavailableBundles() async {
  //   dio.interceptors.add(PrettyDioLogger());
  //   final response = await dio.get(availableBundles,
        
  //   final res = Getallpackagesrepsonse.fromJson(response.data);
  //   return res;
  // }

}
