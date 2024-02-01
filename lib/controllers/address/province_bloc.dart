import 'package:flt_warungol_fic12/datasources/remote/x_remotes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  ProvinceBloc() : super(GetProvinceInitialState()) {
    //--Get Provinces:
    on<GetProvinces>((event, emit) async {
      emit(GetProvinceLoadingState());
      final response = await RajaongkirRemoteData.getProvinces();
      response.fold((L) => emit(GetProvinceErrorState(L)), (R) {
        if (R.rajaongkir!.results!.isEmpty) {
          emit(GetProvinceInitialState());
        } else {
          emit(GetProvinceLoadedState(R.rajaongkir!.results!));
        }
      });
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class ProvinceEvent {}

class GetProvinces extends ProvinceEvent {}

//--BlocState
//=============================================================================
sealed class ProvinceState {}

//--Get Provinces:
//-----------------------------------------------------------------------------
final class GetProvinceInitialState extends ProvinceState {}

final class GetProvinceLoadingState extends ProvinceState {}

final class GetProvinceErrorState extends ProvinceState {
  final String? error;
  GetProvinceErrorState(this.error);
}

final class GetProvinceLoadedState extends ProvinceState {
  List<Province> provinces;

  GetProvinceLoadedState(this.provinces);
}
