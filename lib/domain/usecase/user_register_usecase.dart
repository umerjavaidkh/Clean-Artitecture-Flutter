
import '../../core/params/request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/repository.dart';


class RegisterUserUseCase implements UseCase<DataState<User>, RegisterRequestParams> {
  final Repository _userRepository;

  RegisterUserUseCase(this._userRepository);

  @override
  Future<DataState<User>> call({RegisterRequestParams params}) {
    return _userRepository.registerUser(params);
  }
}
