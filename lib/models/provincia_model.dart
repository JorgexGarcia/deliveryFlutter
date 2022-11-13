

class Provincia {
  int? id;
  String? provincia;

  Provincia({this.id, this.provincia});

  Provincia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provincia = json['provincia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provincia'] = this.provincia;
    return data;
  }
}