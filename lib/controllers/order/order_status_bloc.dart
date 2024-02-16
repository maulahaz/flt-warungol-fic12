import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flt_warungol_fic12/datasources/remote/x_remotes.dart';

//--Bloc
//=============================================================================
class OrderStatusBloc extends Bloc<OrderStatusEvent, OrderStatusState> {
  OrderStatusBloc() : super(GetOrderStatusInitialState()) {
    //--Get Orders:
    on<GetOrderStatus>((event, emit) async {
      emit(GetOrderStatusLoadingState());
      final response = await OrderRemoteData.getOrderStatus(event.orderId);
      response.fold(
        (L) => emit(GetOrderStatusErrorState(L)),
        (R) => emit(GetOrderStatusLoadedState(R)),
      );
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class OrderStatusEvent {}

class GetOrderStatus extends OrderStatusEvent {
  int orderId;
  GetOrderStatus({
    required this.orderId,
  });
}

//--BlocState
//=============================================================================
sealed class OrderStatusState {}

//--Get Orders:
//-----------------------------------------------------------------------------
final class GetOrderStatusInitialState extends OrderStatusState {}

final class GetOrderStatusLoadingState extends OrderStatusState {}

final class GetOrderStatusErrorState extends OrderStatusState {
  final String? error;
  GetOrderStatusErrorState(this.error);
}

final class GetOrderStatusLoadedState extends OrderStatusState {
  String status;

  GetOrderStatusLoadedState(this.status);
}
