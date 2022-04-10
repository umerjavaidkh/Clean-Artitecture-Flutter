import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'data/data_source/remote/api_service.dart';
import 'data/data_source/repositories/repository_impl.dart';
import 'domain/repositories/repository.dart';
import 'domain/usecase/user_login_usecase.dart';
import 'domain/usecase/user_register_usecase.dart';
import 'presentation/blocs/user_login/remote_user_login_bloc.dart';
import 'presentation/blocs/user_register/remote_user_register_bloc.dart';


final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // *


  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<ApiService>(ApiService(injector()));

  // *
  injector.registerSingleton<Repository>(
    UserRepositoryImpl(injector()),
  );

  // UseCases
  injector.registerSingleton<LoginUserUseCase>(LoginUserUseCase(injector()));
  injector.registerSingleton<RegisterUserUseCase>(RegisterUserUseCase(injector()));


  // Blocs
  injector.registerFactory<RemoteUserLoginBloc>(
    () => RemoteUserLoginBloc(injector()),
  );

  injector.registerFactory<RemoteUserRegisterBloc>(
    () => RemoteUserRegisterBloc(injector()),
  );

}
