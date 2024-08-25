import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final storage = const FlutterSecureStorage();
  LoginCubit() : super(LoginInitial()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    emit(LoginInitial());
    final String? tok = await storage.read(key: "token");
    if (tok != null) {
      emit(Logined());
    } else {
      emit(LogineStarted());
    }
  }

  Future<void> login(String token) async {
    await storage.write(key: "token", value: token);
    emit(Logined());
  }

  Future<void> logout() async {
    await storage.delete(key: "token");

    emit(LogineStarted());
  }
}
