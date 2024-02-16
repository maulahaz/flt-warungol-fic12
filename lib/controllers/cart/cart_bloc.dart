// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(AddItemLoadedState([], 0, 'bank_transfer', '', 0, '')) {
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
        emit(AddItemLoadedState(newItems, 0, 'bank_transfer', '', 0, ''));
      } else {
        final newItem = ProductQuantityModel(product: event.product, qty: 1);
        final newItems = [...currentState.dataOutput, newItem];
        emit(AddItemLoadedState(newItems, 0, 'bank_transfer', '', 0, ''));
      }
    });

    //--Add item to cart:
    on<RemoveItem>((event, emit) async {
      final currentState = state as AddItemLoadedState;
      if (currentState.dataOutput
          .any((element) => element.product.id == event.product.id)) {
        final index = currentState.dataOutput
            .indexWhere((element) => element.product.id == event.product.id);
        final item = currentState.dataOutput[index];

        //--Delete if Qty = 1
        if (item.qty == 1) {
          final newItems = currentState.dataOutput
              .where((element) => element.product.id != event.product.id)
              .toList();
          emit(AddItemLoadedState(newItems, 0, 'bank_transfer', '', 0, ''));
        }
        //--Or Remove 1 item from cart
        else {
          final newItem = item.copyWith(qty: item.qty - 1);
          final newItems = currentState.dataOutput
              .map((e) => e == item ? newItem : e)
              .toList();
          emit(AddItemLoadedState(newItems, 0, 'bank_transfer', '', 0, ''));
        }
      }
    });

    //--Empty cart:
    on<EmptyCart>((event, emit) {
      emit(AddItemLoadedState([], 0, '', '', 0, ''));
    });

    //--Add AddressId to cart:
    on<AddAddressId>((event, emit) async {
      final currentState = state as AddItemLoadedState;
      emit(AddItemLoadedState(
        currentState.dataOutput,
        event.addressId,
        currentState.paymentMethod,
        currentState.shippingService,
        currentState.shippingCost,
        currentState.paymentVAName,
      ));
    });

    //--Add ShippingService to cart:
    on<AddShippingService>((event, emit) async {
      final currentState = state as AddItemLoadedState;
      emit(AddItemLoadedState(
        currentState.dataOutput,
        currentState.addressId,
        currentState.paymentMethod,
        event.shippingService,
        event.shippingCost,
        currentState.paymentVAName,
      ));
    });

    //--Add PaymentMethod to cart:
    on<AddPaymentMethod>((event, emit) async {
      final currentState = state as AddItemLoadedState;
      emit(AddItemLoadedState(
        currentState.dataOutput,
        currentState.addressId,
        event.paymentMethod,
        currentState.shippingService,
        currentState.shippingCost,
        event.paymentVAName,
      ));
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

class RemoveItem extends CartEvent {
  Product product;
  RemoveItem(
    this.product,
  );
}

class EmptyCart extends CartEvent {}

class AddAddressId extends CartEvent {
  int addressId;
  AddAddressId(
    this.addressId,
  );
}

class AddPaymentMethod extends CartEvent {
  String paymentMethod;
  String paymentVAName;
  AddPaymentMethod(
    this.paymentMethod,
    this.paymentVAName,
  );
}

class AddShippingService extends CartEvent {
  String shippingService;
  int shippingCost;
  AddShippingService(
    this.shippingService,
    this.shippingCost,
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
  AddItemLoadedState(
    this.dataOutput,
    this.addressId,
    this.paymentMethod,
    this.shippingService,
    this.shippingCost,
    this.paymentVAName,
  );

  List<ProductQuantityModel> dataOutput;
  int addressId;
  String paymentMethod;
  String shippingService;
  int shippingCost;
  String paymentVAName;
}
