import 'package:flt_warungol_fic12/datasources/remote/x_remotes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//--Bloc
//=============================================================================
class CourierBloc extends Bloc<CourierEvent, CourierState> {
  CourierBloc() : super(GetCourierInitialState()) {
    //--Get Couriers By Province ID:
    on<GetCourier>((event, emit) async {
      emit(GetCourierLoadingState());
      final response = await RajaongkirRemoteData.getCouriers();
      response.fold(
        (L) => emit(GetCourierErrorState(L)),
        (R) => emit(GetCourierLoadedState(R)),
      );
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class CourierEvent {}

class GetCourier extends CourierEvent {}

//--BlocState
//=============================================================================
sealed class CourierState {}

//--Get Couriers:
//-----------------------------------------------------------------------------
final class GetCourierInitialState extends CourierState {}

final class GetCourierLoadingState extends CourierState {}

final class GetCourierErrorState extends CourierState {
  final String? error;
  GetCourierErrorState(this.error);
}

final class GetCourierLoadedState extends CourierState {
  List<String> couriers;

  GetCourierLoadedState(this.couriers);
}
