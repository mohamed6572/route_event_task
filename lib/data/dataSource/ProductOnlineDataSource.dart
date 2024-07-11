
import 'package:injectable/injectable.dart';
import 'package:route_event_task/domain/model/Product.dart';

import '../apiManageer.dart';
import '../dataSourceContract/ProductDataSource.dart';


@Injectable(as: ProductDataSource)
class ProductOnlineDataSource extends ProductDataSource {
  ApiManager apiManager;

  @factoryMethod
  ProductOnlineDataSource(this.apiManager);

  @override
  Future<List<ProductModel>?> getProducts() async {
    var response = await apiManager.getProducts();
    return response.products?.map((productDto) => productDto.toProduct()).toList();
  }
}
