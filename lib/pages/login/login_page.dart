import 'package:delivery/widgets/stack_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    return StackWidget(widgets: const [
      Text('Bienvenido',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26
      )),
      Text('Accede a tu cuenta',
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w500,
        fontSize: 13
      ))
    ], img: 'assets/images/image1.png');
  }
}
