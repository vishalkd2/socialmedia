

class UserRegistrationModel{
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  final String? profilepic;

  UserRegistrationModel({required this.firstname,required this.lastname,required this.email,required this.password,this.profilepic});

  Map<String,dynamic> toJson(){
    return {
      'firstName':firstname,
      'lastName':lastname,
      'email':email,
      'password':password,
      if(profilepic !=null) 'profilepic':profilepic,
    };
  }
  factory UserRegistrationModel.fromJson(Map<String,dynamic>json){
    return UserRegistrationModel(firstname: json['firstName'], lastname: json['lastName'], email: json['email'], password: json['password'],profilepic: json['profilepic']);
  }
}