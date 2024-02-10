// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flt_warungol_fic12/datasources/remote/x_remotes.dart';

import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class ShippingCostBloc extends Bloc<ShippingCostEvent, ShippingCostState> {
  ShippingCostBloc() : super(GetShippingCostInitialState()) {
    //--Get ShippingCosts:
    on<GetShippingCosts>((event, emit) async {
      emit(GetShippingCostLoadingState());
      final response = await RajaongkirRemoteData.getShippingCost(
        event.origin,
        event.destination,
        event.courier,
      );
      response.fold((L) => emit(GetShippingCostErrorState(L)), (R) {
        if (R.rajaongkir!.results!.isEmpty) {
          emit(GetShippingCostInitialState());
        } else {
          emit(GetShippingCostLoadedState(R));
        }
      });
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class ShippingCostEvent {}

class GetShippingCosts extends ShippingCostEvent {
  String origin;
  String destination;
  String courier;
  GetShippingCosts({
    required this.origin,
    required this.destination,
    required this.courier,
  });
}

//--BlocState
//=============================================================================
sealed class ShippingCostState {}

//--Get ShippingCosts:
//-----------------------------------------------------------------------------
final class GetShippingCostInitialState extends ShippingCostState {}

final class GetShippingCostLoadingState extends ShippingCostState {}

final class GetShippingCostErrorState extends ShippingCostState {
  final String? error;
  GetShippingCostErrorState(this.error);
}

final class GetShippingCostLoadedState extends ShippingCostState {
  ShippingCostModel shippingCost;

  GetShippingCostLoadedState(this.shippingCost);
}
