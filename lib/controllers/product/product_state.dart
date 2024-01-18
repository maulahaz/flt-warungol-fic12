part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

//--Loading/Progress
final class ProductLoading extends ProductState {}

//--Data Loaded: All Products
final class ProductsLoaded extends ProductState {
  final List<Product> dataOutput;
  ProductsLoaded({required this.dataOutput});
}

//--Data Loaded: Products By Category
final class ProductByCategoryLoaded extends ProductState {
  final List<Product> dataOutput;
  ProductByCategoryLoaded({required this.dataOutput});
}

//--Data Loaded: Best Seller Products
final class ProductBestSellerLoaded extends ProductState {
  final List<Product> dataOutput;
  ProductBestSellerLoaded({required this.dataOutput});
}

final class ProductError extends ProductState {
  final String? error;
  ProductError(this.error);
}
