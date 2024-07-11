
import 'package:injectable/injectable.dart';
import 'package:route_event_task/domain/model/Product.dart';

import '../../domain/repositroy/ProductRepository.dart';
import '../dataSourceContract/ProductDataSource.dart';
@Injectable(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository{
  ProductDataSource onlineDataSource;
 @factoryMethod
 ProductRepositoryImpl(this.onlineDataSource);

 @override
  Future<List<ProductModel>?> getProducts() {
   return onlineDataSource.getProducts();


  }

}