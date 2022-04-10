part of 'remote_user_register_bloc.dart';


class UserRegisterDone extends UserState {
  const UserRegisterDone(User user) : super(user: user);
}

class UserRegisterError extends UserState {
  const UserRegisterError(DioError error) : super(error: error);
}
