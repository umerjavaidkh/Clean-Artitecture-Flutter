import 'user_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class APIResponse {
  final String id;
  final String message;
  final int code;
  final Data userData;


  APIResponse({
    this.id,
    this.message,
    this.code,
    this.userData
  });

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
        id: json['id'] as String,
        message: json['message'] as String,
        code: json['code'] as int,
        userData: Data.fromJson(json['data'])
    );
  }


}


