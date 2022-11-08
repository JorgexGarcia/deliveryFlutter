import 'package:flutter/material.dart';


class StackWidget extends StatelessWidget {

  List<Widget> widgets;
  double altoImg;
  double altoContenedor;
  String img;
  Widget backButton;

  StackWidget({
    Key? key,
    required this.widgets,
    this.altoImg = 0.5,
    this.altoContenedor = 0.5,
    required this.img,
    this.backButton = const SizedBox()
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  width: double.infinity,
                  height: alto * altoImg,
                  fit: BoxFit.cover,
                  image: AssetImage(img),
                ),
                Container(
                  margin: const EdgeInsets.only(top:50.0),
                  child: backButton,
                )
              ],
            ),
            Transform.translate(offset: const Offset(0.0, -20),
                child: Container(
                  width: double.infinity,
                  height: alto * altoContenedor,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: widgets,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
