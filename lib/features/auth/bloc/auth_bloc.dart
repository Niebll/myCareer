import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 2)); // Simulasi API

      if (event.email == "admin@example.com" && event.password == "123456") {
        emit(Authenticated("Admin"));
      } else {
        emit(AuthError("Email atau password salah"));
        emit(Unauthenticated());
      }
    });

    on<LogoutEvent>((event, emit) {
      emit(Unauthenticated());
    });
  }
}
