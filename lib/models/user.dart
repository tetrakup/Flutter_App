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

  User(
      {this.id,
      this.uuid,
      this.firstname,
      this.lastname,
      this.username,
      this.password,
      this.email,
      this.ip,
      this.macAddress,
      this.website,
      this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      uuid: json['uuid'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      ip: json['ip'],
      macAddress: json['macAddress'],
      website: json['website'],
      image: json['image'],
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
