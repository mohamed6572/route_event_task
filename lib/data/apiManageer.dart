import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'model/productsResponce/ProductsResponce.dart';

@singleton
@injectable
class ApiManager {
  static const String baseUrl = 'dummyjson.com';

  Future<ProductsResponce>  getProducts() async {
    var url = Uri.https(baseUrl, '/products');
    var response = await http.get(url);
    var productsResponse  = ProductsResponce.fromJson(jsonDecode(response.body));
    return productsResponse ;
  }
}
