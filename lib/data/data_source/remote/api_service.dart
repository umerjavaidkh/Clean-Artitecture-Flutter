import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/utils/constants.dart';
import '../models/api_response_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: BaseUrl)
abstract class ApiService {

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/login')
  Future<HttpResponse<APIResponse>> loginUser(
    @Query("email") String email,
    @Query("password") String password,
  );


  @POST('/registration')
  Future<HttpResponse<APIResponse>> registerUser(
    @Query("email") String email,
    @Query("password") String password,
    @Query("name") String name,
  );

}
