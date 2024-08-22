import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

// Create the Cubit
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    emit(LoginInitial());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print("token= $token");
    if (token != null) {
      emit(Logined());
    } else {
      emit(LogineStarted());
    }
    // logout();
  }

  Future<void> login(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print("cred setted");
    emit(Logined());
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    emit(LogineStarted());
  }
}
