import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../DB/sql_services.dart';
import '../../../Models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<InitialEvent>((event, emit) {
      emit(AuthInitial());
    });
    on<loginEvent>((event, emit) async {
      SQLServices sqlService = SQLServices();
      await sqlService.initDB();
      var numberOfLogins = await sqlService.login(event.user);
      emit(LoginState(numberOfLogins));
      // });
    });
  }
}
