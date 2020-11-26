import 'package:chat_app/widgets/boton.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/labels.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(titulo: 'Regístrate en Messenger'),
                  _Form(),
                  Labels(
                      question: '¿Ya tienes cuenta?',
                      textLink: 'Ingresa ahora',
                      ruta: 'login'),
                  _Terms(),
                  //TODO recuperar password
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            showHideIcon: false,
            icon: CupertinoIcons.person_alt_circle_fill,
            iconColor: Color.fromRGBO(38, 191, 115, 1),
            placeholder: 'Nombre de Usuario',
            keyboardType: TextInputType.name,
            textController: nameCtrl,
          ),
          CustomInput(
            showHideIcon: false,
            icon: CupertinoIcons.mail_solid,
            iconColor: Color.fromRGBO(38, 191, 115, 1),
            placeholder: 'Correo Electrónico',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            showHideIcon: true,
            icon: CupertinoIcons.lock_circle_fill,
            iconColor: Color.fromRGBO(38, 191, 115, 1),
            placeholder: 'Contraseña',
            isPassword: true,
            textController: passCtrl,
          ),
          Boton(
            text: 'Registrarme',
            onPressed: () {
              print(emailCtrl.text);
              print(passCtrl.text);
            },
          ),
        ],
      ),
    );
  }
}

class _Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Text(
        'Términos y condiciones de uso',
        style: TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
