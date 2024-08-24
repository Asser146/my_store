import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

// Create the Cubit
class LoginCubit extends Cubit<LoginState> {
  final storage = const FlutterSecureStorage();
  LoginCubit() : super(LoginInitial()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    emit(LoginInitial());
    final String? tok = await storage.read(key: "token");
    print("token= $tok");
    if (tok != null) {
      emit(Logined());
    } else {
      emit(LogineStarted());
    }
    // logout();
  }

  Future<void> login(String token) async {
    await storage.write(key: "token", value: token);
    print("cred setted");
    emit(Logined());
  }

  Future<void> logout() async {
    await storage.delete(key: "token");

    emit(LogineStarted());
  }
}
