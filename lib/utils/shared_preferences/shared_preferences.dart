


import 'package:delivery/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  String _inMemoryToken = '';
  int _cliente = 0;

  Future<int> get userId async {
    if(_cliente != 0){
      return _cliente;
    }
    else{
      _cliente = await _loadIdFromShared();
      return _cliente;
    }
  }

  Future<String> get userAccesToken async {
    if(_inMemoryToken.isNotEmpty){
      return _inMemoryToken;
    }
    else{
      _inMemoryToken = await _loadTokenFromShared();
      return _inMemoryToken;
    }
  }


  Future<String> _loadTokenFromShared() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    var accesToken = '';
    final token = pref.getString('token');
    if(token != null){
      accesToken = token;
    }

    return accesToken;

  }

  Future<int> _loadIdFromShared() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    var cliente = 0;
    final id = pref.getInt('id_cliente');
    if(id != null){
      cliente = id;
    }

    return cliente;

  }

  saveUserOnLogin(User user) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('token', user.token!);
    pref.setInt('id_cliente', user.cliente!);
    pref.setInt('id_user', user.user!);
  }
}