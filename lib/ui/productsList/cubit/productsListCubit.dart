import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_event_task/domain/model/Product.dart';
import '../../../domain/useCase/GetProductUseCase.dart';
import 'ProductListState.dart';

@injectable
class ProductsListCubit extends Cubit<ProductsListState> {
  final GetProductUseCase getProductsUseCase;
  List<ProductModel>? _allProducts = [];

  @factoryMethod
  ProductsListCubit(this.getProductsUseCase) : super(LoadingState()) {
    loadProductsList();
  }

  void loadProductsList() async {
    try {
      emit(LoadingState());
      _allProducts = await getProductsUseCase.invoke();
      emit(SuccessState(_allProducts));
    } on Exception catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(SuccessState(_allProducts));
    } else {
      final filteredProducts = _allProducts?.where((product) {
        final titleLower = product.title?.toLowerCase() ?? '';
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList();
      emit(SuccessState(filteredProducts));
    }
  }
}
