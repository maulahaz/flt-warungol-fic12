import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc() : super(AddAddressInitialState()) {
    //--Add Address:
    on<AddAddress>((event, emit) async {
      emit(AddAddressLoadingState());
      print(event.address);
      // final response = await AddressRemoteData.addAddress(event.address);
      // response.fold((L) => emit(AddAddressErrorState(L)), (R) {
      //   if (R.isEmpty) {
      //     emit(AddAddressInitialState());
      //   } else {
      //     emit(AddAddressLoadedState(R));
      //   }
      // });
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class AddAddressEvent {}

class AddAddress extends AddAddressEvent {
  // Map<String, dynamic> address;
  Address address;
  AddAddress(
    this.address,
  );
}

class RemoveAddress extends AddAddressEvent {
  Address address;
  RemoveAddress(
    this.address,
  );
}

class UpdateAddress extends AddAddressEvent {
  Address address;
  UpdateAddress(
    this.address,
  );
}

//--BlocState
//=============================================================================
sealed class AddAddressState {}

//--Add Address:
//-----------------------------------------------------------------------------
final class AddAddressInitialState extends AddAddressState {}

final class AddAddressLoadingState extends AddAddressState {}

final class AddAddressErrorState extends AddAddressState {
  final String? error;
  AddAddressErrorState(this.error);
}

final class AddAddressLoadedState extends AddAddressState {
  String result;

  AddAddressLoadedState(this.result);
}
