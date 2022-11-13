

import 'dart:convert';

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

}