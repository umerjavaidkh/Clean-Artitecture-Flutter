
import '../../core/params/request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/repository.dart';


class LoginUserUseCase implements UseCase<DataState<User>, LoginRequestParams> {
  final Repository _userRepository;

  LoginUserUseCase(this._userRepository);

  @override
  Future<DataState<User>> call({LoginRequestParams params}) {
    return _userRepository.loginUser(params);
  }
}
