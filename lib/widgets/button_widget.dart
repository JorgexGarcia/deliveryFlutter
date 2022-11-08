import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {

  VoidCallback onClick;
  bool disabled;
  double ancho;
  double alto;
  double marginTop;
  String texto;

  ButtonWidget({
    Key? key,
    required this.marginTop,
    required this.texto,
    required this.ancho,
    required this.alto,
    required this.onClick,
    this.disabled = false
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {

  @override
  Widget build(BuildContext context) {

    var anchoWindows = MediaQuery.of(context).size.width;
    var altoWindows = MediaQuery.of(context).size.height;

    return Container(
      width: anchoWindows * widget.ancho,
      height: altoWindows * widget.alto,
      padding: EdgeInsets.only(
        top: widget.marginTop
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        onPressed: widget.disabled ? null : (){
          widget.onClick();
        },
        child: Text(widget.texto),
      ),
    );
  }
}
