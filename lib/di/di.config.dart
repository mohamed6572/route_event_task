// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/apiManageer.dart' as _i3;
import '../data/dataSource/ProductOnlineDataSource.dart' as _i5;
import '../data/dataSourceContract/ProductDataSource.dart' as _i4;
import '../data/repository/ProductRepositoryImpl.dart' as _i7;
import '../domain/repositroy/ProductRepository.dart' as _i6;
import '../domain/useCase/GetProductUseCase.dart' as _i8;
import '../ui/productsList/cubit/productsListCubit.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.ProductDataSource>(
        () => _i5.ProductOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductRepository>(
        () => _i7.ProductRepositoryImpl(gh<_i4.ProductDataSource>()));
    gh.factory<_i8.GetProductUseCase>(
        () => _i8.GetProductUseCase(gh<_i6.ProductRepository>()));
    gh.factory<_i9.ProductsListCubit>(
        () => _i9.ProductsListCubit(gh<_i8.GetProductUseCase>()));
    return this;
  }
}
