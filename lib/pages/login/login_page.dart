import 'package:delivery/utils/colors/color.dart';
import 'package:delivery/widgets/button_widget.dart';
import 'package:delivery/widgets/input_widget.dart';
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

    TextEditingController emailCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();
    bool disabled = false;

    return StackWidget(
      widgets: [
        const Text('Bienvenido',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26
        )),
        const Text('Accede a tu cuenta',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 13
        )),
        InputWidget(
          hint: 'Email',
          marginTop: 40,
          paddingLeft: 20,
          txtCtrl: emailCtrl,
          keyBoardType: TextInputType.emailAddress
        ),
        InputWidget(
          hint: 'Password',
          marginTop: 10,
          paddingLeft: 20,
          txtCtrl: passwordCtrl,
          obscure: true,
        ),
        ButtonWidget(
          marginTop: 30,
          texto: 'Entrar',
          ancho: 0.5,
          alto: 0.08,
          disabled: disabled,
          onClick: (){
            _loginUser();
          }
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Aún no tienes cuenta?',
              style: TextStyle(
                color:  gris,
                fontWeight: FontWeight.w500,
                fontSize: 15
              )),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed('/registro');
                },
                child: const Text(' Registro',
                style: TextStyle(
                  color: amarillo,
                  fontWeight: FontWeight.w400,
                  fontSize: 15
                )),
              )
            ],
          ),
        )
    ],
    img: 'assets/images/image1.png'
    );
  }

  void _loginUser() {

  }
}
