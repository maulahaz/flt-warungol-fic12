import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/x_models.dart';
import '../../services/x_services.dart';

//--Bloc
//=============================================================================
class BestsellerProductBloc
    extends Bloc<BestsellerProductEvent, BestsellerProductState> {
  BestsellerProductBloc() : super(BestsellerInitialState()) {
    on<GetBestsellerProduct>(_handleBestsellerProduct);
  }

  Future<void> _handleBestsellerProduct(event, emit) async {
    emit(BestsellerLoadingState());
    //--Best seller product is category:1
    final response = await ProductServices.getProductByCategory(1);
    response.fold(
        (L) => emit(BestsellerErrorState('Error during fetching data')), (R) {
      if (R.data!.data!.isEmpty) {
        emit(BestsellerInitialState());
      } else {
        emit(BestsellerLoadedState(dataOutput: R.data!.data!));
      }
    });
  }
}

//--BlocEvent
//=============================================================================
sealed class BestsellerProductEvent {}

class GetBestsellerProduct extends BestsellerProductEvent {}

//--BlocState
//=============================================================================
sealed class BestsellerProductState {}

final class BestsellerInitialState extends BestsellerProductState {}

final class BestsellerLoadingState extends BestsellerProductState {}

final class BestsellerErrorState extends BestsellerProductState {
  final String? error;
  BestsellerErrorState(this.error);
}

final class BestsellerLoadedState extends BestsellerProductState {
  final List<Product> dataOutput;
  BestsellerLoadedState({required this.dataOutput});
}
