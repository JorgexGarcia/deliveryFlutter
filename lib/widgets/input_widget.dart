import 'package:delivery/utils/colors/color.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {

  final double marginTop;
  final double paddingLeft;
  final TextInputType keyBoardType;
  final bool obscure;
  final TextEditingController txtCtrl;
  final String hint;

  const InputWidget({
    Key? key,
    required this.hint,
    required this.marginTop,
    required this.paddingLeft,
    required this.txtCtrl,
    this.obscure = false,
    this.keyBoardType = TextInputType.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(
          top: marginTop
      ),
      padding: EdgeInsets.only(
          left: paddingLeft,
          top: 15
      ),
      decoration: BoxDecoration(
        color: inputGris,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        keyboardType: keyBoardType,
        obscureText: obscure,
        controller: txtCtrl,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none
          )
        ),
      ),
    );
  }
}
