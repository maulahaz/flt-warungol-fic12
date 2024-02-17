import 'package:flutter_bloc/flutter_bloc.dart';

//--Cubit
//=============================================================================
class CourierCubit extends Cubit<String> {
  CourierCubit() : super('');

  //--On Selected Courier:
  onSelectedCourier(String courier) {
    emit(courier);
  }
}
