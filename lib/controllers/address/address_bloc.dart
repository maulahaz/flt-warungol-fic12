import 'package:flt_warungol_fic12/datasources/remote/address_remote_dt.dart';
import 'package:flt_warungol_fic12/models/address_mdl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(GetAddressInitialState()) {
    //--Get Address:
    on<GetAddress>((event, emit) async {
      emit(GetAddressLoadingState());
      final response = await AddressRemoteData.getAddress();
      response.fold((L) => emit(GetAddressErrorState(L)), (R) {
        if (R.data!.isEmpty) {
          emit(GetAddressInitialState());
        } else {
          emit(GetAddressLoadedState(R.data!));
        }
      });
    });

    //--Add Address:
    // on<AddAddress>((event, emit) async {
    //   emit(AddAddressLoadingState());
    //   final response = await AddressRemoteData.addAddress();
    //   response.fold((L) => emit(AddAddressErrorState(L)), (R) {
    //     if (R.data!.isEmpty) {
    //       emit(AddAddressInitialState());
    //     } else {
    //       emit(AddAddressLoadedState(R.data!));
    //     }
    //   });
    // });
  }
}

//--BlocEvent
//=============================================================================
sealed class AddressEvent {}

class GetAddress extends AddressEvent {}

class AddAddress extends AddressEvent {
  Address address;
  AddAddress(
    this.address,
  );
}

class RemoveAddress extends AddressEvent {
  Address address;
  RemoveAddress(
    this.address,
  );
}

class UpdateAddress extends AddressEvent {
  Address address;
  UpdateAddress(
    this.address,
  );
}

//--BlocState
//=============================================================================
sealed class AddressState {}

//--Get Address:
//-----------------------------------------------------------------------------
final class GetAddressInitialState extends AddressState {}

final class GetAddressLoadingState extends AddressState {}

final class GetAddressErrorState extends AddressState {
  final String? error;
  GetAddressErrorState(this.error);
}

final class GetAddressLoadedState extends AddressState {
  List<Address> dataOutput;

  GetAddressLoadedState(this.dataOutput);
}

//--Add Address:
//-----------------------------------------------------------------------------
final class AddAddressInitialState extends AddressState {}

final class AddAddressLoadingState extends AddressState {}

final class AddAddressErrorState extends AddressState {
  final String? error;
  AddAddressErrorState(this.error);
}

final class AddAddressLoadedState extends AddressState {
  List<Address> dataOutput;

  AddAddressLoadedState(this.dataOutput);
}
