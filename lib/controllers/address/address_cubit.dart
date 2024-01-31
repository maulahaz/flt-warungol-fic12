import 'package:flutter_bloc/flutter_bloc.dart';

//--Cubit
//=============================================================================
class AddressCubit extends Cubit<int> {
  //--Init addressId = 0
  AddressCubit() : super(0);

  //--On Selected Default Address:
  onSelectedAddress(int addressId) {
    emit(addressId);
  }
}
