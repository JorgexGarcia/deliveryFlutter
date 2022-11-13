

class Municipio {
  int? id;
  String? municipio;

  Municipio({this.id, this.municipio});

  Municipio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    municipio = json['municipio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['municipio'] = this.municipio;
    return data;
  }
}