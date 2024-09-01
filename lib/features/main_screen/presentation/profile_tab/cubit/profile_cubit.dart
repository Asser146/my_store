import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final storage = const FlutterSecureStorage();
  ProfileCubit() : super(const ProfileState.initial());
  void logout() {
    emit(const ProfileState.loggedOut());
  }

  void deleteAccount() async {
    await storage.delete(key: "token");
    emit(const ProfileState.deleteAccount());
  }
}
