part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class GetCategories extends CategoryEvent {}
