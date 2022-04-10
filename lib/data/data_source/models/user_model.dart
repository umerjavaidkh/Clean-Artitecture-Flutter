import '../../../domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Data extends User{
  final String id;
  final String name;
  final String email;
  final String token;
  final String url;

  Data({this.id,this.name,this.email,this.token,this.url}):super(
    id: id,
    name: name,
    email: email,
    token: token,
    url: url,
  );

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json['Id'].toString(),
      name: json['Name'] ,
      email: json['Email'],
      token: json['Token'],
    );
  }
}