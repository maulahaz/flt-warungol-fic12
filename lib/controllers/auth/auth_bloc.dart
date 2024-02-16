import 'package:flt_warungol_fic12/datasources/remote/auth_remote_dt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/x_models.dart';

//--Bloc
//=============================================================================
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    //--Get Signin:
    on<GetSignin>((event, emit) async {
      String value = validateLogin(event);
      if (value != '') {
        emit(SigninValidation(value));
      } else {
        emit(AuthLoadingState());
        Map<String, String> loginData = {
          'email': event.email!,
          'password': event.password!,
        };
        final response = await AuthRemoteData.signin(loginData);
        response.fold(
          (L) => emit(AuthErrorState(L)),
          (R) => emit(AuthSignedInState(R)),
        );
      }
    });

    //--Get Signout:
    on<GetSignout>((event, emit) async {
      emit(AuthLoadingState());
      final response = await AuthRemoteData.signout();
      response.fold(
        (L) => emit(AuthErrorState(L)),
        (R) => emit(AuthSignedOutState()),
      );
    });
  }
}

//--validation for text field
String validateLogin(GetSignin data) {
  if (data.email?.isEmpty == true) {
    return 'Please Enter Your Email ID';
  }
  if (data.password?.isEmpty == true) {
    return 'Please Enter Your Password';
  }
  return '';
}

//--BlocEvent
//=============================================================================
sealed class AuthEvent {}

class GetSignin extends AuthEvent {
  final String? email;
  final String? password;
  GetSignin({required this.email, required this.password});
}

class GetSignout extends AuthEvent {}

//--BlocState
//=============================================================================
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

class SigninValidation extends AuthState {
  final String? value;
  SigninValidation(this.value);
}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String? error;
  AuthErrorState(this.error);
}

final class AuthSignedUpState extends AuthState {
  final AuthModel dataOutput;
  AuthSignedUpState({required this.dataOutput});
}

final class AuthSignedInState extends AuthState {
  final AuthModel dataOutput;

  AuthSignedInState(this.dataOutput);
}

final class AuthSignedOutState extends AuthState {}
