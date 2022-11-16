import 'package:delivery/models/municipio_model.dart';
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

  late Future<List<Provincia>> provincia;
  late Future<List<Municipio>> municipio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
