

class ApiResponse{

  late Object _data;
  late bool _error;
  String? _apiErrorMsg;

  Object get data => _data;

  set data(Object value) {
    _data = value;
  }

  String get apiErrorMsg => _apiErrorMsg!;

  set apiErrorMsg(String value) {
    _apiErrorMsg = value;
  }

  bool get error => _error;

  set error(bool value) {
    _error = value;
  }
}