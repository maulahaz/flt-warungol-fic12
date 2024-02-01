import 'package:flt_warungol_fic12/datasources/remote/x_remotes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(GetCityInitialState()) {
    //--Get Cities By Province ID:
    on<GetCityByProvinceId>((event, emit) async {
      emit(GetCityLoadingState());
      final response =
          await RajaongkirRemoteData.getCitiesByProvince(event.provinceId);
      response.fold((L) => emit(GetCityErrorState(L)), (R) {
        if (R.rajaongkir!.results!.isEmpty) {
          emit(GetCityInitialState());
        } else {
          emit(GetCityLoadedState(R.rajaongkir!.results!));
        }
      });
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class CityEvent {}

class GetCityByProvinceId extends CityEvent {
  String provinceId;
  GetCityByProvinceId(
    this.provinceId,
  );
}

//--BlocState
//=============================================================================
sealed class CityState {}

//--Get Cities:
//-----------------------------------------------------------------------------
final class GetCityInitialState extends CityState {}

final class GetCityLoadingState extends CityState {}

final class GetCityErrorState extends CityState {
  final String? error;
  GetCityErrorState(this.error);
}

final class GetCityLoadedState extends CityState {
  List<City> cities;

  GetCityLoadedState(this.cities);
}
