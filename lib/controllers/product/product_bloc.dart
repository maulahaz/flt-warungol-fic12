import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/x_models.dart';
import '../../services/x_services.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProducts>(_handleGetProducts);
    // on<GetBestSellerProduct>(_handleGetBestSellerProduct);
  }

  Future<void> _handleGetProducts(event, emit) async {
    emit(ProductLoading());
    final response = await ProductServices.getProducts();
    response.fold((L) => emit(ProductError('Error during fetching data')), (R) {
      if (R.data!.data!.isEmpty) {
        emit(ProductInitial());
      } else {
        emit(ProductsLoaded(dataOutput: R.data!.data!));
      }
    });
  }

  // Future<void> _handleGetBestSellerProduct(event, emit) async {
  //   emit(ProductLoading());
  //   final response = await ProductServices.getProductByCategory(1);
  //   response.fold((L) => emit(ProductError('Error during fetching data')), (R) {
  //     if (R.data!.data!.isEmpty) {
  //       emit(ProductInitial());
  //     } else {
  //       emit(ProductBestSellerLoaded(dataOutput: R.data!.data!));
  //     }
  //   });
  // }
}
