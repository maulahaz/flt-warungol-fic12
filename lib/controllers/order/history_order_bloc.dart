import 'package:flt_warungol_fic12/models/history_order_mdl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flt_warungol_fic12/datasources/remote/x_remotes.dart';
import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class HistoryOrderBloc extends Bloc<HistoryOrderEvent, HistoryOrderState> {
  HistoryOrderBloc() : super(GetHistoryOrderInitialState()) {
    //--Get Orders:
    on<GetHistoryOrder>((event, emit) async {
      emit(GetHistoryOrderLoadingState());
      final response = await OrderRemoteData.getHistoryOrder();
      print(response);
      response.fold((L) => emit(GetHistoryOrderErrorState(L)), (R) {
        emit(GetHistoryOrderLoadedState(R));
        // if (R.data!.isEmpty) {
        //   emit(GetHistoryOrderInitialState());
        // } else {
        //   emit(GetHistoryOrderLoadedState(R));
        // }
      });
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class HistoryOrderEvent {}

class GetHistoryOrder extends HistoryOrderEvent {}

//--BlocState
//=============================================================================
sealed class HistoryOrderState {}

//--Get Orders:
//-----------------------------------------------------------------------------
final class GetHistoryOrderInitialState extends HistoryOrderState {}

final class GetHistoryOrderLoadingState extends HistoryOrderState {}

final class GetHistoryOrderErrorState extends HistoryOrderState {
  final String? error;
  GetHistoryOrderErrorState(this.error);
}

final class GetHistoryOrderLoadedState extends HistoryOrderState {
  HistoryOrderModel dataHistoryOrder;

  GetHistoryOrderLoadedState(this.dataHistoryOrder);
}
