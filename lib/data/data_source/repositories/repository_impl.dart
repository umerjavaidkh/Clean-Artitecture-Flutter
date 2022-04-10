import 'dart:io';

import 'package:dio/dio.dart';
import '../../../core/params/request_params.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/article.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/repositories/articles_repository.dart';
import '../remote/api_service.dart';


class UserRepositoryImpl implements Repository {
  final ApiService _ApiService;

  const UserRepositoryImpl(this._ApiService);

  @override
  Future<DataState<User>> loginUser(LoginRequestParams params) async {
    try {
      final httpResponse = await _ApiService.loginUser(
        params.email,
         params.password,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.userData);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<User>> registerUser(RegisterRequestParams params) async{
    try {
      final httpResponse = await _ApiService.registerUser(
         params.email,
         params.password,
        params.username
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.userData);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }


}
