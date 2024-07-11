
import 'package:route_event_task/domain/model/Product.dart';

abstract class ProductDataSource{
  Future<List<ProductModel>?> getProducts();
}