import 'dart:convert';

class User {
  final String? first_name;
  final String? last_name ;
  final String email; 
  final String? password;
  final String? phone_number;
  User({
    this.first_name,
    this.last_name,
    required this.email,
    this.password,
    this.phone_number,
  });
  Map<String, dynamic> toMap(){
    return{
      'first_name':first_name,
      'last_name':last_name,
      'email':email,
      'password':password,
      'phone_number':phone_number,
    };
  }
         String toJson() => json.encode(toMap());

}