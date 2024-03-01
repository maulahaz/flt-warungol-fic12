import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flt_warungol_fic12/datasources/remote/x_remotes.dart';
import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  OrderDetailBloc() : super(GetOrderDetailInitialState()) {
    //--Get Order Detail:
    on<GetOrderDetail>((event, emit) async {
      emit(GetOrderDetailLoadingState());
      final response = await OrderRemoteData.getOrderDetail(event.id);
      // print(response);
      response.fold((L) => emit(GetOrderDetailErrorState(L)), (R) {
        emit(GetOrderDetailLoadedState(R));
      });
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class OrderDetailEvent {}

class GetOrderDetail extends OrderDetailEvent {
  final int id;
  GetOrderDetail({required this.id});
}

//--BlocState
//=============================================================================
sealed class OrderDetailState {}

//--Get Orders:
//-----------------------------------------------------------------------------
final class GetOrderDetailInitialState extends OrderDetailState {}

final class GetOrderDetailLoadingState extends OrderDetailState {}

final class GetOrderDetailErrorState extends OrderDetailState {
  final String? error;
  GetOrderDetailErrorState(this.error);
}

final class GetOrderDetailLoadedState extends OrderDetailState {
  OrderDetailModel dataOrder;

  GetOrderDetailLoadedState(this.dataOrder);
}
