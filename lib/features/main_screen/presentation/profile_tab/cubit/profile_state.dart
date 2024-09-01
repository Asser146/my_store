part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loggedOut() = _LogOut;
  const factory ProfileState.deleteAccount() = _DeleteAccount;
}
