import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/utils/constants.dart';
import '../models/api_response_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class ApiService {

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/api/authaccount/login')
  Future<HttpResponse<APIResponse>> loginUser(
    @Query("email") String email,
    @Query("password") String password,
  );


  @POST('/api/authaccount/registration')
  Future<HttpResponse<APIResponse>> registerUser(
    @Query("email") String email,
    @Query("password") String password,
    @Query("namr") String name,
  );

}
