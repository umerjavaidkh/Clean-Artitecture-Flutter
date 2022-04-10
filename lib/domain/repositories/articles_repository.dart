
import '../../core/params/request_params.dart';
import '../../core/resources/data_state.dart';
import '../entities/user.dart';

abstract class Repository {

  Future<DataState<User>> loginUser(LoginRequestParams params);
  Future<DataState<User>> registerUser(RegisterRequestParams params);

}
