import 'package:route_event_task/domain/model/Product.dart';

abstract class ProductRepository {
  Future<List<ProductModel>?> getProducts();
}
