part of 'remote_user_login_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends UserEvent {
  final LoginRequestParams _params;
  const LoginUserEvent(this._params);
}
