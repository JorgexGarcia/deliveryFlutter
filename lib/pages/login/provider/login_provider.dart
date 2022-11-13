

import 'dart:convert';

import 'package:delivery/models/user_model.dart';
import 'package:delivery/utils/shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

import '../../../models/api_response.dart';
import '../../../utils/base_url.dart';

class LoginService{

  Future<ApiResponse> loginUser(Map<String,dynamic> user) async {
    ApiResponse _apiResponse = ApiResponse();
    Response res = await post(Uri.parse('${baseUrl}login_check'),
        body: json.encode(user),
        headers: {
          'Content-Type': 'application/json'
        }
    );
    if (res.statusCode == 200) {
      _apiResponse.error = false;
      UserPreferences pref = UserPreferences();
      pref.saveUserOnLogin(User.fromJson(json.decode(res.body)));
    }
    //Aqui no estoy controlando los codigos de error
    //Deberias controlarlos
    else {
      _apiResponse.error = true;
      _apiResponse.apiErrorMsg = 'Error de credenciales';
    }

    return _apiResponse;
  }

}