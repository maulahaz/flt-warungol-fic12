import 'package:flt_warungol_fic12/models/x_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../services/x_services.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<GetCategories>(_getCategories);
  }

  Future<void> _getCategories(event, emit) async {
    emit(CategoryLoading());
    final response = await CategoryServices.getCategories();
    response.fold((L) => emit(CategoryError('Error during fetching data')),
        (R) {
      if (R.data!.isEmpty) {
        emit(CategoryInitial());
      } else {
        emit(CategoryLoaded(dataOutput: R));
      }
    });
  }
}
