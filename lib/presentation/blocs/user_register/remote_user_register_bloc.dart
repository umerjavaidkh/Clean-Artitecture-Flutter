import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../core/bloc/bloc_with_state.dart';
import '../../../core/params/request_params.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecase/user_register_usecase.dart';
import '../user_login/remote_user_login_bloc.dart';



part 'remote_user_register_state.dart';
part 'remote_user_register_event.dart';

class RemoteUserRegisterBloc extends BlocWithState<UserEvent, UserState> {
  final RegisterUserUseCase _registerUserUseCase;

  RemoteUserRegisterBloc(this._registerUserUseCase) : super(const UserStateLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is RegisterUserEvent) yield* _loginUser(event);
  }

  Stream<UserState> _loginUser(UserEvent event) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _registerUserUseCase(params: (event as RegisterUserEvent)._params);

      if (dataState is DataSuccess && dataState.data!=null) {
        var result  = dataState.data;
        yield UserRegisterDone(result);
      }
      if (dataState is DataFailed) {
        yield UserRegisterError(dataState.error);
      }
    });
  }
}
