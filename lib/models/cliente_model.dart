

import 'direccion_model.dart';

class Cliente {
  int? id;
  String? nombre;
  String? apellidos;
  String? telefono;
  List<Direccion>? direcciones;

  Cliente(
      {this.id, this.nombre, this.apellidos, this.telefono, this.direcciones});

  Cliente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    telefono = json['telefono'];
    if (json['direcciones'] != null) {
      direcciones = <Direccion>[];
      json['direcciones'].forEach((v) {
        direcciones!.add(new Direccion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['apellidos'] = this.apellidos;
    data['telefono'] = this.telefono;
    if (this.direcciones != null) {
      data['direcciones'] = this.direcciones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}






