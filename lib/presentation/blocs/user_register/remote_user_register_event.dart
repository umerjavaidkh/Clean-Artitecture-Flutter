part of 'remote_user_register_bloc.dart';


class RegisterUserEvent extends UserEvent {
  final RegisterRequestParams _params;
  const RegisterUserEvent(this._params);
}
