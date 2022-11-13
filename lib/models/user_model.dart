

class User {
  String? token;
  int? cliente;
  int? user;

  User({this.token, this.cliente, this.user});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    cliente = json['cliente'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['cliente'] = this.cliente;
    data['user'] = this.user;
    return data;
  }
}
