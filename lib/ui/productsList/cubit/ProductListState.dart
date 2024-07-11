import '../../../domain/model/Product.dart';

sealed class ProductsListState {}

class LoadingState extends ProductsListState {}

class SuccessState extends ProductsListState {
  List<ProductModel>? product;

  SuccessState(this.product);
}

class ErrorState extends ProductsListState {
  String? errorMessage;

  ErrorState(this.errorMessage);
}
