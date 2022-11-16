

import 'dart:convert';

import 'package:delivery/models/provincia_model.dart';
import 'package:delivery/utils/base_url.dart';
import 'package:delivery/utils/shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

import '../../../models/cliente_model.dart';

class PedidoService{

  UserPreferences pref = UserPreferences();

  Future<Cliente> getCliente() async {
    String token = await pref.userAccesToken;
    int id_cliente = await pref.userId;

    Response res = await get(Uri.parse(baseUrl+'cliente/'+ id_cliente.toString()),
    headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
    });
    if(res.statusCode == 200){
      return Cliente.fromJson(json.decode(res.body));
    }
    else{
      throw Exception('Error al traer el cliente');
    }
  }

  Future<List<Provincia>> getProvincias() async {
    String token = await pref.userAccesToken;
    
    Response res = await get(Uri.parse('${baseUrl}provincias'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      }
    );
    if(res.statusCode == 200){
      List<dynamic> jsonList = json.decode(res.body);
      return List<Provincia>.from(jsonList.map((e) => Provincia.fromJson(e)));
    }
    else{
      throw Exception('Error al traer las provincias');
    }
  }
}