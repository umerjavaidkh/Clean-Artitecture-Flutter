// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl;
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<HttpResponse<APIResponse>> loginUser(
      email, password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'email': email,
      r'password': password,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<APIResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'everything',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = APIResponse.fromJson(_result.data);

    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }


  @override
  Future<HttpResponse<APIResponse>> registerUser(
      email, password,username) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'email': email,
      r'password': password,
      r'username': username,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<APIResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'everything',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = APIResponse.fromJson(_result.data);

    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }



RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
