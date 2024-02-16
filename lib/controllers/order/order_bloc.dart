import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flt_warungol_fic12/datasources/remote/x_remotes.dart';
import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(MakeOrderInitialState()) {
    //--Get Orders:
    on<MakeOrder>((event, emit) async {
      emit(MakeOrderLoadingState());
      final response = await OrderRemoteData.makeOrder(OrderRequestModel(
        addressId: event.addressId,
        paymentMethod: event.paymentMethod,
        paymentVaName: event.paymentVAName,
        shippingCost: event.shippingCost,
        shippingService: event.shippingService,
        items: event.productQty
            .map((e) => Item(productId: e.product.id!, quantity: e.qty))
            .toList(),
      ));
      print(response);
      response.fold((L) => emit(MakeOrderErrorState(L)), (R) {
        emit(MakeOrderLoadedState(R));
        // if (R.data!.isEmpty) {
        //   emit(MakeOrderInitialState());
        // } else {
        //   emit(MakeOrderLoadedState(R));
        // }
      });
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class OrderEvent {}

class MakeOrder extends OrderEvent {
  int addressId;
  String paymentMethod;
  String shippingService;
  int shippingCost;
  String paymentVAName;
  List<ProductQuantityModel> productQty;
  MakeOrder({
    required this.addressId,
    required this.paymentMethod,
    required this.shippingService,
    required this.shippingCost,
    required this.paymentVAName,
    required this.productQty,
  });
}

//--BlocState
//=============================================================================
sealed class OrderState {}

//--Get Orders:
//-----------------------------------------------------------------------------
final class MakeOrderInitialState extends OrderState {}

final class MakeOrderLoadingState extends OrderState {}

final class MakeOrderErrorState extends OrderState {
  final String? error;
  MakeOrderErrorState(this.error);
}

final class MakeOrderLoadedState extends OrderState {
  OrderModel order;

  MakeOrderLoadedState(this.order);
}
