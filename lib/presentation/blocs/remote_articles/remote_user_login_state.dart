part of 'remote_user_login_bloc.dart';

abstract class UserState extends Equatable {
  final User user;
  final DioError error;
  const UserState({this.user, this.error});

  @override
  List<Object> get props => [user, error];
}

class UserStateLoading extends UserState {
  const UserStateLoading();
}

class UserLoginDone extends UserState {
  const UserLoginDone(User user) : super(user: user);
}

class UserLoginError extends UserState {
  const UserLoginError(DioError error) : super(error: error);
}
