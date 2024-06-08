class User {
  int? id;
  String? uuid;
  String? firstname;
  String? lastname;
  String? username;
  String? password;
  String? email;
  String? ip;
  String? macAddress;
  String? website;
  String? image;

  User({
    this.id,
    this.uuid,
    this.firstname,
    this.lastname,
    this.username,
    this.password,
    this.email,
    this.ip,
    this.macAddress,
    this.website,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      uuid: json['uuid'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      ip: json['ip'] as String?,
      macAddress: json['macAddress'] as String?,
      website: json['website'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'password': password,
      'email': email,
      'ip': ip,
      'macAddress': macAddress,
      'website': website,
      'image': image,
    };
  }
}
