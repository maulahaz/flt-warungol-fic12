import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/x_models.dart';
import '../../services/x_services.dart';

//--Bloc
//=============================================================================
class TopratedProductBloc
    extends Bloc<TopratedProductEvent, TopratedProductState> {
  TopratedProductBloc() : super(TopratedInitialState()) {
    on<GetTopratedProduct>(_handleTopratedProduct);
  }

  Future<void> _handleTopratedProduct(event, emit) async {
    emit(TopratedLoadingState());
    //--Top rated product is category:4
    final response = await ProductServices.getProductByCategory(4);
    response.fold((L) => emit(TopratedErrorState('Error during fetching data')),
        (R) {
      if (R.data!.data!.isEmpty) {
        emit(TopratedInitialState());
      } else {
        emit(TopratedLoadedState(dataOutput: R.data!.data!));
      }
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class TopratedProductEvent {}

class GetTopratedProduct extends TopratedProductEvent {}

//--BlocState
//=============================================================================
sealed class TopratedProductState {}

final class TopratedInitialState extends TopratedProductState {}

final class TopratedLoadingState extends TopratedProductState {}

final class TopratedErrorState extends TopratedProductState {
  final String? error;
  TopratedErrorState(this.error);
}

final class TopratedLoadedState extends TopratedProductState {
  final List<Product> dataOutput;
  TopratedLoadedState({required this.dataOutput});
}
