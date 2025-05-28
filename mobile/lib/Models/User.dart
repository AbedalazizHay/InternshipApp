import 'dart:convert';

class User {
  final String? first_name;
  final String? last_name ;
  final String email; 
  final String? password;
  final String? phone_number;
  final String? gender;
  final int? institution_id;
  final int? academic_level_id;
  final String? userName;
  User({
    this.first_name,
    this.last_name,
    required this.email,
    this.password,
    this.phone_number,
    this.gender,
    this.institution_id,
    this.academic_level_id,
    this.userName,
  });
  Map<String, dynamic> toMap(){
    return{
      'first_name':first_name,
      'last_name':last_name,
      'email':email,
      'password':password,
      'phone_number':phone_number,
      'gender' : gender,
      'institution_id':institution_id,
      'academic_level_id':academic_level_id,
      'userName':userName,
    };
  }
         String toJson() => json.encode(toMap());

}