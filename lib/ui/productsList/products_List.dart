
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_event_task/ui/productsList/cubit/ProductListState.dart';
import 'package:route_event_task/ui/productsList/cubit/productsListCubit.dart';

import '../../di/di.dart';


class ProductsListScreen extends StatelessWidget {
   ProductsListScreen({Key? key}) : super(key: key);
   var viewModel = getIt<ProductsListCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsListCubit,ProductsListState>(
        bloc: viewModel,
        builder: (context, state) {
        return Container();
      },),
    );
  }
}
