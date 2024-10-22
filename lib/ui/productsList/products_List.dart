import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_event_task/ui/constans/constans.dart';
import 'package:route_event_task/ui/productsList/cubit/ProductListState.dart';
import 'package:route_event_task/ui/productsList/cubit/productsListCubit.dart';
import 'package:route_event_task/ui/productsList/Widgets/product_widget.dart';

import '../../di/di.dart';
import 'Widgets/search_widget/search_widget.dart';

class ProductsListScreen extends StatelessWidget {
  ProductsListScreen({Key? key}) : super(key: key);
  var viewModel = getIt<ProductsListCubit>();
TextEditingController searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    searchController.addListener(() {
      viewModel.searchProducts(searchController.text);
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/route_logo.png'),
      ),
      body: BlocBuilder<ProductsListCubit, ProductsListState>(
        bloc: viewModel,
        builder: (context, state) {
          switch (state) {
            case ErrorState():
              {
                return Center(
                  child: Column(
                    children: [
                      Text(state.errorMessage ?? "somthing went wrong"),
                      TextButton(
                          onPressed: () {
                            viewModel.loadProductsList();
                          },
                          child: Text('Try Again'))
                    ],
                  ),
                );
              }
            case SuccessState():
              {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                     SearchWidget(controller : searchController,hintText:'what do you search for?' ,),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: state.product?.length ?? 0,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: 8 / 11.7),
                          itemBuilder: (context, index) {
                            return ProductWidget(
                                product: state.product![index]);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            case LoadingState():
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          }
        },
      ),
    );
  }
}
