import 'package:equatable/equatable.dart';
class User  extends Equatable {
  final String id;
  final String name;
  final String email;
  final String token;
  final String url;

 const User({this.id,this.name,this.email,this.token,this.url});

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      token,
      url
    ];
  }

  @override
  bool get stringify => true;


}