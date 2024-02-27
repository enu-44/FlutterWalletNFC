class Account {
  final String uid;
  final String fullName;
  final String token;

  Account({
    required this.uid,
    required this.fullName,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'token': token,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      uid: map['uid'],
      fullName: map['fullName'],
      token: map['token'],
    );
  }
}
