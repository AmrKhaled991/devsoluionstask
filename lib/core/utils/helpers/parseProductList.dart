  import 'package:devsoluionstask/features/home/data/models/product_response.dart';

List<ProductResponse> parseProductList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductResponse.fromJson(json)).toList();
  }