
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_event_task/domain/model/Product.dart';

import '../../../domain/useCase/GetProductUseCase.dart';
import 'ProductListState.dart';


@injectable
class ProductsListCubit extends Cubit<ProductsListState> {
  GetProductUseCase getProductsUseCase;

 @factoryMethod
 ProductsListCubit(this.getProductsUseCase) : super(LoadingState()) {
   loadProductsList();
  }

  void  loadProductsList()async{
    try {
      emit(LoadingState());
      var products =await getProductsUseCase.invoke();
      emit(SuccessState(products));
    } on Exception catch (e) {
      emit(ErrorState(e.toString()));
    }
  }


}

