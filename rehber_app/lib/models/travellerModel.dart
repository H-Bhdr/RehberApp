class Traveller {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  Traveller({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  factory Traveller.fromJson(Map<String, dynamic> json) {
    return Traveller(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
