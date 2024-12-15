class TravellerRegisterModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String bio;
  final String profilePicture;
  final String description;
  final String expertiseArea;
  final String password;

  TravellerRegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.bio,
    required this.profilePicture,
    required this.description,
    required this.expertiseArea,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'bio': bio,
      'profilePicture': profilePicture,
      'description': description,
      'expertiseArea': expertiseArea,
      'password': password,
    };
  }
}
