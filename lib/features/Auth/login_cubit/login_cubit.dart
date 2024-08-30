import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final storage = const FlutterSecureStorage();
  bool authState = false;
  LoginCubit() : super(LoginInitial());

  Future<void> checkAuthStatus() async {
    emit(LoginInitial());
    final String? tok = await storage.read(key: "token");
    if (tok != null) {
      authState = true;
      emit(Logined());
    } else {
      authState = false;

      emit(RegisterStarted());
    }
  }

  Future<bool> login(String token) async {
    if (await storage.read(key: "token") == token) {
      emit(Logined());
      return true;
    } else {
      emit(LoginStarted());
      return false;
    }
  }

  Future<void> register(String token) async {
    await storage.write(key: "token", value: token);
    emit(Logined());
  }

  void logout() {
    emit(LoginStarted()); // Return to the login screen
  }

  void deleteAccount() async {
    await storage.delete(key: "token");

    emit(RegisterStarted()); // Return to the login screen
  }
}
