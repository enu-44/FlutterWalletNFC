class CreateAccountRequest {
  final String fullName;
  final String phoneNumber;
  final String idNumber;
  final String idType;
  final String password;

  CreateAccountRequest({
    required this.fullName,
    required this.phoneNumber,
    required this.idNumber,
    required this.idType,
    required this.password,
  });
}
