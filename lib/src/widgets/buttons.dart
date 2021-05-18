import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppleButton extends StatelessWidget {

  AppleButton(this.onPressed);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      minWidth: double.infinity,
      height: 40,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.apple, color: Colors.black,),
          Text('Sign in with Apple',style: TextStyle(color: Colors.black, fontSize: 17),)
        ],
      ),
      onPressed: this.onPressed,

    );
  }
}

class GoogleButton extends StatelessWidget {



  GoogleButton(this.onPressed);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      minWidth: double.infinity,
      height: 40,
      color: Colors.redAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.google, color: Colors.white,),
          Text('Sign in with Google',style: TextStyle(color: Colors.white, fontSize: 17),)
        ],
      ),
      onPressed: this.onPressed,

        );
  }
}
class FacebookButton extends StatelessWidget {

  FacebookButton(this.onPressed);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      minWidth: double.infinity,
      height: 40,
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.facebookF, color: Colors.white,),
          Text('Sign in with Facebook',style: TextStyle(color: Colors.white, fontSize: 17),)
        ],
      ),
      onPressed: this.onPressed,

    );
  }
}




