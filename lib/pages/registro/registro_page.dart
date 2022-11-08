import 'package:delivery/utils/colors/color.dart';
import 'package:delivery/widgets/button_widget.dart';
import 'package:delivery/widgets/input_widget.dart';
import 'package:delivery/widgets/stack_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/backButton_widget.dart';


class RegistroPage extends StatefulWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {

  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController apellidosCtrl = TextEditingController();
  TextEditingController telefonoCtrl = TextEditingController();
  bool disabled = false;

  @override
  Widget build(BuildContext context) {
    return StackWidget(
      altoContenedor: 0.8,
      altoImg: 0.4,
      widgets: [
       const Text(
          'Registro',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold
          )
        ),
        const SizedBox(height: 30),
        InputWidget(
          hint: 'Nombre',
          marginTop: 10,
          paddingLeft: 20,
          txtCtrl: nombreCtrl
        ),
        InputWidget(
          hint: 'Apellidos',
          marginTop: 10,
          paddingLeft: 20,
          txtCtrl: apellidosCtrl
        ),
        InputWidget(
          hint: 'Telefono',
          marginTop: 10,
          paddingLeft: 20,
          txtCtrl: telefonoCtrl,
          keyBoardType: TextInputType.phone
        ),
        InputWidget(
          hint: 'Email',
          marginTop: 10,
          paddingLeft: 20,
          txtCtrl: emailCtrl,
          keyBoardType: TextInputType.emailAddress
        ),
        InputWidget(
          hint: 'Contraseña',
          marginTop: 10,
          paddingLeft: 20,
          txtCtrl: passwordCtrl,
          obscure: true
        ),
        ButtonWidget(
          marginTop: 20,
          texto: 'Crear',
          ancho: 0.2,
          alto: 0.05,
          onClick: (){
            _registrarUsuario();
          }
        )
      ],
      img: 'assets/images/image2.png',
      backButton: backButton(
      Colors.white,
      context
      )
    );
  }

  void _registrarUsuario() {}
}
