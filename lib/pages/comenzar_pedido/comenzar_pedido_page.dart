import 'package:delivery/pages/comenzar_pedido/modals/direcciones_modals.dart';
import 'package:delivery/pages/comenzar_pedido/providers/pedido_provider.dart';
import 'package:delivery/utils/colors/color.dart';
import 'package:delivery/widgets/stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../models/cliente_model.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({Key? key}) : super(key: key);



  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {

  late Future<Cliente> cliente;
  PedidoService pedidoService = PedidoService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cliente = pedidoService.getCliente();
  }

  @override
  Widget build(BuildContext context) {
    return StackWidget(
        widgets: [
          const Text('Comienza tu pedido',
            style: TextStyle( fontWeight:  FontWeight.bold, fontSize: 26)),
          const Text('Selecciona una direccion, el día y la hora de reparto',
            style: TextStyle( fontWeight:  FontWeight.w500, fontSize: 13, color: gris)),
          FutureBuilder(
            future: cliente,
            builder: (context, snapshot){
              if(snapshot.hasError){
                return Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Text(snapshot.error.toString()),
                );
              }
              else if(snapshot.hasData){
                return Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text('Direccion de envio',
                    style: TextStyle( color:  gris, fontWeight: FontWeight.w500, fontSize: 15)),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: (){
                        showBarModalBottomSheet(
                          expand: false,
                          context: context,
                          builder: (context) =>
                            DireccionesModal(direcciones: snapshot.data!.direcciones!)

                        );
                      },
                      child: const Text('Seleccionar direccion',
                        style: TextStyle(
                            color: gris,
                            fontWeight: FontWeight.w400,
                            fontSize: 12))
                    )
                  ],
                );
              }
              else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          )
        ],
        img: 'assets/images/image1.png',
        altoImg: 0.45,
        altoContenedor: 0.6,
    );
  }
}

