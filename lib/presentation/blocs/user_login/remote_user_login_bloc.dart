import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../core/bloc/bloc_with_state.dart';
import '../../../core/params/request_params.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecase/user_login_usecase.dart';



part 'remote_user_login_event.dart';
part 'remote_user_login_state.dart';

class RemoteUserLoginBloc extends BlocWithState<UserEvent, UserState> {
  final LoginUserUseCase _loginUserUseCase;

  RemoteUserLoginBloc(this._loginUserUseCase) : super(const UserStateLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoginUserEvent) yield* _loginUser(event);
  }

  Stream<UserState> _loginUser(UserEvent event) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _loginUserUseCase(params: (event as LoginUserEvent)._params);

      if (dataState is DataSuccess && dataState.data!=null) {
        var result  = dataState.data;
        yield UserLoginDone(result);
      }
      if (dataState is DataFailed) {
        yield UserLoginError(dataState.error);
      }
    });
  }
}
