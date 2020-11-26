import 'package:flutter/material.dart';

class Boton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Boton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2,
      highlightElevation: 5,
      highlightColor: Colors.green[200],
      shape: StadiumBorder(),
      textColor: Colors.white,
      color: Color.fromRGBO(38, 191, 115, 1),
      onPressed: this.onPressed,
      child: Container(
        height: 40,
        width: double.infinity,
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
