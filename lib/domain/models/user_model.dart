// class LoginModel22 {
//   String? refresh;
//   String? access;
//   User? user;

//   LoginModel22({this.refresh, this.access, this.user});

//   LoginModel22.fromJson(Map<String, dynamic> json) {
//     refresh = json['refresh'];
//     access = json['access'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['refresh'] = refresh;
//     data['access'] = access;
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     return data;
//   }
// }
// class AuthArgs {
//   final String email;
//   final String password;
//   String ? access;
//   String ? refresh;
//   AuthArgs({required this.email, required this.password});
// }


// class AuthValues {

//   final String email;
//   final String firstName;
//   final String lastName;
//   final String position;
//   final String accessLevel;
//   final String windowNumber;
  
//   AuthValues(
//       {
//       required this.email,
//       required this.firstName,
//       required this.lastName,
//       required this.position,
//       required this.accessLevel,
//       required this.windowNumber});

//   AuthValues.fromJson(Map<String, dynamic> json)
//       : 
//         email = json['email'] ?? '',
//         firstName = json['firstName'] ?? '',
//         lastName = json['lastName'] ?? '',
//         position = json['position'] ?? '',
//         accessLevel = json['accessLevel'] ?? '',
//         windowNumber = json['windowNumber'] ?? '';
// }

