import 'package:flutter/material.dart';
import 'package:merakiot/src/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 30,
        left: 20,
        right: 20,
        child: Column(
          children: [
            InputText(
              label: "Email",
              inputType: TextInputType.emailAddress,
              validator: (String text){
                if(RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(text)){
                  return null;
                }
                return "Correo no en formato correcto aaa@dominio.com";
              },
            ),
            SizedBox(height: 30,),
            InputText(
              label: "Password",
              isSecure: true,
              validator: (String text){
                if(text.isNotEmpty && text.length > 8){
                  return null;
                }
                return "Contraseña debe ser mayor a 8 caracteres";
              },
            ),
          ],
        )
    );
  }
}
