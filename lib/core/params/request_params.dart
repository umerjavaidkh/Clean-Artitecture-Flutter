import '../utils/constants.dart';


class LoginRequestParams{
  final String email;
  final String password;

   LoginRequestParams({
    this.email,
    this.password
  });
}

class RegisterRequestParams{
  final String email;
  final String password;
  final String username;

   RegisterRequestParams({
    this.email,
    this.password,
    this.username
  });
}
