import '../../../domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Data extends User{
  final String id;
  final String name;
  final String email;
  final String token;

  Data({this.id,this.name,this.email,this.token}):super(
    id: id,
    name: name,
    email: email,
    token: token,
  );

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
    );
  }
}