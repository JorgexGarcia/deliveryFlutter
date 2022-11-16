import 'package:delivery/pages/comenzar_pedido/modals/add_direccion_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
              showMaterialModalBottomSheet(
                expand: true,
                context: context,
                builder: (context) =>
                    AddDireccionModal()
              );
            },
          ),
        ),
        child: SafeArea(
          child:
          widget.direcciones.isEmpty?
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: const [
                Text('No hay direcciones disponibles'),
              ],
            )
          )
              :
          ListView.builder(
            itemCount: widget.direcciones.length,
            itemBuilder: (context, int i){
              return ListTile(
                title: Text('${widget.direcciones[i].calle}, ${widget.direcciones[i].numero}, ${widget.direcciones[i].puertaPisoEscalera}'),
                subtitle: Text('${widget.direcciones[i].provincia!.provincia}, ${widget.direcciones[i].municipio!.municipio}, ${widget.direcciones[i].codPostal}'),
                trailing: IconButton(
                  icon: const Icon(Icons.add, color: Colors.green,),
                  onPressed: (){
                    Navigator.pop(context, widget.direcciones[i]);
                  },
                ),
              );
            }
          )
        ),
      ),
    );
  }
}
