class LoginModel {
  final String mobileNumber;
  final String password;
  LoginModel ({required this.mobileNumber, required this.password});
  
  toJson()=>{
    "phone":mobileNumber,
    'password':password
  };
}