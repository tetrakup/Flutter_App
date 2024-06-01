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

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    ip = json['ip'];
    macAddress = json['macAddress'];
    website = json['website'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['ip'] = this.ip;
    data['macAddress'] = this.macAddress;
    data['website'] = this.website;
    data['image'] = this.image;
    return data;
  }
}
