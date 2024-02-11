// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flt_warungol_fic12/datasources/remote/x_remotes.dart';

import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class WarungBloc extends Bloc<WarungEvent, WarungState> {
  WarungBloc() : super(GetWarungInitialState()) {
    //--Get Warungs:
    on<GetWarungs>((event, emit) async {
      emit(GetWarungLoadingState());
      final response = await WarungRemoteData.getWarung();
      response.fold((L) => emit(GetWarungErrorState(L)), (R) {
        if (R.data!.isEmpty) {
          emit(GetWarungInitialState());
        } else {
          emit(GetWarungLoadedState(R.data!));
        }
      });
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class WarungEvent {}

class GetWarungs extends WarungEvent {}

//--BlocState
//=============================================================================
sealed class WarungState {}

//--Get Warungs:
//-----------------------------------------------------------------------------
final class GetWarungInitialState extends WarungState {}

final class GetWarungLoadingState extends WarungState {}

final class GetWarungErrorState extends WarungState {
  final String? error;
  GetWarungErrorState(this.error);
}

final class GetWarungLoadedState extends WarungState {
  List<Warung> warung;

  GetWarungLoadedState(this.warung);
}
