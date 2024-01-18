// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(AddItemLoadedState([])) {
    //--Add item to cart:
    on<AddItem>((event, emit) async {
      final currentState = state as AddItemLoadedState;
      if (currentState.dataOutput
          .any((element) => element.product.id == event.product.id)) {
        final index = currentState.dataOutput
            .indexWhere((element) => element.product.id == event.product.id);
        final item = currentState.dataOutput[index];
        final newItem = item.copyWith(qty: item.qty + 1);
        final newItems = currentState.dataOutput
            .map((e) => e == item ? newItem : e)
            .toList();
        emit(AddItemLoadedState(newItems));
      } else {
        final newItem = ProductQuantityModel(product: event.product, qty: 1);
        final newItems = [...currentState.dataOutput, newItem];
        emit(AddItemLoadedState(newItems));
      }
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class CartEvent {}

class AddItem extends CartEvent {
  Product product;
  AddItem(
    this.product,
  );
}

//--BlocState
//=============================================================================
sealed class CartState {}

final class AddItemInitialState extends CartState {}

final class AddItemLoadingState extends CartState {}

final class AddItemErrorState extends CartState {
  final String? error;
  AddItemErrorState(this.error);
}

final class AddItemLoadedState extends CartState {
  List<ProductQuantityModel> dataOutput;

  AddItemLoadedState(this.dataOutput);
}
