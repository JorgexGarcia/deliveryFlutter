

import 'package:delivery/models/municipio_model.dart';
import 'package:delivery/models/provincia_model.dart';

class Direccion {
  int? id;
  String? calle;
  String? numero;
  String? puertaPisoEscalera;
  int? codPostal;
  Municipio? municipio;
  Provincia? provincia;

  Direccion(
      {this.id,
        this.calle,
        this.numero,
        this.puertaPisoEscalera,
        this.codPostal,
        this.municipio,
        this.provincia});

  Direccion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    calle = json['calle'];
    numero = json['numero'];
    puertaPisoEscalera = json['puertaPisoEscalera'];
    codPostal = json['codPostal'];
    municipio = json['municipio'] != null
        ? new Municipio.fromJson(json['municipio'])
        : null;
    provincia = json['provincia'] != null
        ? new Provincia.fromJson(json['provincia'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['calle'] = this.calle;
    data['numero'] = this.numero;
    data['puertaPisoEscalera'] = this.puertaPisoEscalera;
    data['codPostal'] = this.codPostal;
    if (this.municipio != null) {
      data['municipio'] = this.municipio!.toJson();
    }
    if (this.provincia != null) {
      data['provincia'] = this.provincia!.toJson();
    }
    return data;
  }
}