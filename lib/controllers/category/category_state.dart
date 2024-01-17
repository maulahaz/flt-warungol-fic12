part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

//--Empty data:
final class CategoryInitial extends CategoryState {}

//--Loading/Progress
final class CategoryLoading extends CategoryState {}

//--Data Loaded
final class CategoryLoaded extends CategoryState {
  final CategoryModel dataOutput;
  CategoryLoaded({required this.dataOutput});
}

final class CategoryError extends CategoryState {
  final String? error;
  CategoryError(this.error);
}
