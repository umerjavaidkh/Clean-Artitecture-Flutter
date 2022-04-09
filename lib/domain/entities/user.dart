import 'package:equatable/equatable.dart';
class User  extends Equatable {
  final String id;
  final String name;
  final String email;
  final String token;

 const User({this.id,this.name,this.email,this.token});

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      token,
    ];
  }

  @override
  bool get stringify => true;


}