
import 'package:delivery/pages/login/login_page.dart';
import 'package:delivery/pages/registro/registro_page.dart';
import 'package:flutter/widgets.dart';

final routes = <String, WidgetBuilder> {
  '/': (BuildContext context) => LoginPage(),
  '/registro': (BuildContext context) => RegistroPage(),
};