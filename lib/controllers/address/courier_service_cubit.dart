import 'package:flutter_bloc/flutter_bloc.dart';

//--Cubit
//=============================================================================
class CourierServiceCubit extends Cubit<String> {
  CourierServiceCubit() : super('');

  //--On Selected CourierService:
  onSelectedCourierService(String service) {
    emit(service);
  }
}
