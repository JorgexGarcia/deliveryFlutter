import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



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
                  height: alto * 0.5,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/image1.png'),
                ),
                Container(
                  child: SizedBox(),
                  margin: EdgeInsets.only(top:50.0),
                )
              ],
            ),
            Transform.translate(offset: Offset(0.0, -20),
            child: Container(
              width: double.infinity,
              height: alto * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [

                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
