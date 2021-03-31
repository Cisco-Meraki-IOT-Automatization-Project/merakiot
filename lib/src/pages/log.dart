import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merakiot/src/widgets/headers.dart';
import 'package:merakiot/src/widgets/icon_container.dart';
import 'package:merakiot/src/widgets/loginform.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: double.infinity,
          child: Stack(
              alignment: Alignment.center,
              children:[
            HeaderWavesGradient(),
            SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height,
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconContainer(size: size.width*0.3,),
                      Text("Meraki ",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      Column(

                        children: [
                          ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 350,
                                maxWidth: 350,
                              ),
                              child: LoginForm()
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 350,
                          maxWidth: 350,
                          minWidth: 300,
                        ),
                        child: CupertinoButton(
                          padding: EdgeInsets.symmetric(vertical: 17),
                          borderRadius: BorderRadius.circular(4),
                          color: Color.fromRGBO(137, 209, 101, 1),
                          onPressed: (){},
                          child: Text("Sign in",style: TextStyle(fontSize: 20),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("New at meraki Dashboard?",style: TextStyle(fontSize: 16,color: Colors.black54),),
                          CupertinoButton(
                            onPressed: () => Navigator.pushNamed(context, "signup"),
                            child: Text("Sign up",style: TextStyle(fontSize: 16, color: Color.fromRGBO(137, 209, 101, 1),),),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ),
          ]),
        ),
      ),
    );
  }
}