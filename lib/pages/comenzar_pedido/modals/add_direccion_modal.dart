import 'dart:developer';

import 'package:delivery/models/municipio_model.dart';
import 'package:delivery/pages/comenzar_pedido/providers/pedido_provider.dart';
import 'package:delivery/utils/colors/color.dart';
import 'package:delivery/widgets/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/provincia_model.dart';

class AddDireccionModal extends StatefulWidget {
  const AddDireccionModal({Key? key}) : super(key: key);

  @override
  State<AddDireccionModal> createState() => _AddDireccionModalState();
}

class _AddDireccionModalState extends State<AddDireccionModal> {

  TextEditingController calleController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController pisoPuertaEscaleraController = TextEditingController();
  TextEditingController codigoPostalController = TextEditingController();

  late Future<List<Provincia>> provincias;
  Provincia? provinciaSelected;
  List<Municipio> municipios = [];
  Municipio? municipioSelected;
  PedidoService pedidoService = PedidoService();

  @override
  void initState() {
    super.initState();
    provincias = pedidoService.getProvincias();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Nueva dirección'),
      ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const Text('Complete el formulario',
                    style: TextStyle(
                        color: amarillo,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)
                  ),
                  InputWidget(
                      hint: 'Calle',
                      marginTop: 10,
                      paddingLeft: 10,
                      txtCtrl: calleController),
                  Row(
                    children: [
                      Flexible(
                          child: InputWidget(
                              hint: 'Numero',
                              marginTop: 10,
                              paddingLeft: 10,
                              txtCtrl: numeroController)
                      ),
                      Flexible(
                        flex: 2,
                        child: InputWidget(
                            hint: 'Puerta Piso Escalera',
                            marginTop: 10,
                            paddingLeft: 10,
                            txtCtrl: pisoPuertaEscaleraController)
                      )
                    ],
                  ),
                  InputWidget(
                      hint: 'Código Postal',
                      marginTop: 10,
                      paddingLeft: 10,
                      txtCtrl: codigoPostalController),
                  FutureBuilder(
                    future: provincias,
                      builder: (context, snapshot){
                      if(snapshot.hasError){
                        return const Text('Error');
                      }else if(snapshot.hasData){
                        return _dropDownProvincias(snapshot.data!);
                      }else{
                        return const LinearProgressIndicator();
                      }
                    }
                  ),
                  _dropDownMunicipios()
                ],
              ),
            ),
          )
        )
    );
  }

  Widget _dropDownProvincias(List<Provincia> list) {
    return Container(
      width: 370,
      height: 50,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: inputGris,
        borderRadius: BorderRadius.circular(40)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Provincia>(
          isExpanded: true,
          hint: const Text('Seleccione provincia'),
          value: provinciaSelected,
          onChanged: (Provincia? value) async{
            setState(() {
              provinciaSelected = value;
              municipioSelected = null;
            });
            municipios = await pedidoService.getMunicipioByProvincia(provinciaSelected!.id!);
            setState(() {

            });
          },
          items: list.map((Provincia e){
            return DropdownMenuItem<Provincia>(
                value: e,
                child: Text(e.provincia!)
            );
          }).toList(),
        )
      ),
    );
  }

  Widget _dropDownMunicipios() {
    return Container(
      width: 370,
      height: 50,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: inputGris,
          borderRadius: BorderRadius.circular(40)
      ),
      child: DropdownButtonHideUnderline(
          child: DropdownButton<Municipio>(
            isExpanded: true,
            hint: const Text('Seleccione municipio'),
            value: municipioSelected,
            onChanged: (Municipio? value) {
              setState(() {
                municipioSelected = value;
              });
            },
            items: municipios.map((Municipio e){
              return DropdownMenuItem<Municipio>(
                  value: e,
                  child: Text(e.municipio!)
              );
            }).toList(),
          )
      ),
    );
  }
}
