import 'package:flutter_bloc/flutter_bloc.dart';

import '../../datasources/remote/x_remotes.dart';
import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitialState()) {
    //--Get Signup:
    on<GetSignup>((event, emit) async {
      String value = validateSignup(event);
      if (value != '') {
        emit(SignupValidation(value));
      } else {
        emit(SignupLoadingState());
        Map<String, String> signupData = {
          'name': event.fullname!,
          'email': event.email!,
          'phone': event.phoneNumber!,
          'password': event.password!,
        };
        final response = await AuthRemoteData.signup(signupData);
        response.fold(
          (L) => emit(SignupErrorState(L)),
          (R) => emit(SignupSuccessState(dataOutput: R)),
        );
      }
    });
  }
}

//--validation for text field
String validateSignup(GetSignup data) {
  if (data.fullname?.isEmpty == true) {
    return 'Please Enter Your Name';
  }
  if (data.email?.isEmpty == true) {
    return 'Please Enter Your Email ID';
  }
  if (data.phoneNumber?.isEmpty == true) {
    return 'Please Enter Your Phone Number';
  }
  if (data.password?.isEmpty == true) {
    return 'Please Enter Your Password';
  }
  return '';
}

//--BlocEvent
//=============================================================================
sealed class SignupEvent {}

class GetSignup extends SignupEvent {
  final String? fullname;
  final String? email;
  final String? phoneNumber;
  final String? password;

  GetSignup({this.fullname, this.email, this.phoneNumber, this.password});
}

//--BlocState
//=============================================================================
sealed class SignupState {}

final class SignupInitialState extends SignupState {}

class SignupValidation extends SignupState {
  final String? value;
  SignupValidation(this.value);
}

final class SignupLoadingState extends SignupState {}

final class SignupErrorState extends SignupState {
  final String? error;
  SignupErrorState(this.error);
}

final class SignupSuccessState extends SignupState {
  final AuthModel dataOutput;
  SignupSuccessState({required this.dataOutput});
}
