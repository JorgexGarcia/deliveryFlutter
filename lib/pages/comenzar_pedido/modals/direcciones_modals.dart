import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/direccion_model.dart';
import '../../../utils/colors/color.dart';

class DireccionesModal extends StatefulWidget {
  List<Direccion> direcciones ;
  DireccionesModal({Key? key, required this.direcciones}) : super(key: key);

  @override
  State<DireccionesModal> createState() => _DireccionesModalState();
}

class _DireccionesModalState extends State<DireccionesModal> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Seleciona dirección'),
          trailing: TextButton(
            child: const Text('Añadir direccion',
            style: TextStyle(
              color: gris,
              fontSize: 10
            )),
            onPressed: (){

            },
          ),
        ),
        child: const  SafeArea(
          child: Text('No hay direcciones disponibles')
        ),
      ),
    );
  }
}
