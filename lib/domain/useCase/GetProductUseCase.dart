import 'package:route_event_task/domain/model/Product.dart';
import 'package:route_event_task/domain/repositroy/ProductRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductUseCase {
  ProductRepository productRepository;

  @factoryMethod
  GetProductUseCase(this.productRepository);

  Future<List<ProductModel>?> invoke(){
    return productRepository.getProducts();
  }
}
