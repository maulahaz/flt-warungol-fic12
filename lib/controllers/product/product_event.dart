part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class GetProducts extends ProductEvent {}

class GetProductByCategory extends ProductEvent {
  final int categoryId;

  GetProductByCategory({required this.categoryId});
}

class GetBestSellerProduct extends ProductEvent {}
