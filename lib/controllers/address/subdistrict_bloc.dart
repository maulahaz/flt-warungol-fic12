import 'package:flt_warungol_fic12/datasources/remote/x_remotes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class SubdistrictBloc extends Bloc<SubdistrictEvent, SubdistrictState> {
  SubdistrictBloc() : super(GetSubdistrictInitialState()) {
    //--Get Subdistricts By City ID:
    on<GetSubdistrictByCityId>((event, emit) async {
      emit(GetSubdistrictLoadingState());
      final response =
          await RajaongkirRemoteData.getSubdistrictsByCity(event.cityId);
      // print(response)
      response.fold((L) => emit(GetSubdistrictErrorState(L)), (R) {
        if (R.rajaongkir!.results!.isEmpty) {
          emit(GetSubdistrictInitialState());
        } else {
          emit(GetSubdistrictLoadedState(R.rajaongkir!.results!));
        }
      });
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class SubdistrictEvent {}

class GetSubdistrictByCityId extends SubdistrictEvent {
  String cityId;
  GetSubdistrictByCityId(
    this.cityId,
  );
}

//--BlocState
//=============================================================================
sealed class SubdistrictState {}

//--Get Subdistricts(Kecamatan):
//-----------------------------------------------------------------------------
final class GetSubdistrictInitialState extends SubdistrictState {}

final class GetSubdistrictLoadingState extends SubdistrictState {}

final class GetSubdistrictErrorState extends SubdistrictState {
  final String? error;
  GetSubdistrictErrorState(this.error);
}

final class GetSubdistrictLoadedState extends SubdistrictState {
  List<Subdistrict> subdistricts;

  GetSubdistrictLoadedState(this.subdistricts);
}
