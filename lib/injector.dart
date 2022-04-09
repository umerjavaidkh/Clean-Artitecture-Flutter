import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/presentation/blocs/remote_articles/remote_user_login_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/constants.dart';
import 'data/data_source/remote/api_service.dart';
import 'data/data_source/repositories/repository_impl.dart';
import 'domain/repositories/articles_repository.dart';
import 'domain/usecase/get_articles_usecase.dart';


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


  // Blocs
  injector.registerFactory<RemoteUserLoginBloc>(
    () => RemoteUserLoginBloc(injector()),
  );

}
