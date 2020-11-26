import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({Key key, @required this.titulo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 40),
        width: 200,
        child: Column(
          children: [
            Image(image: AssetImage('assets/Native.png')),
            SizedBox(height: 15),
            Text(
              this.titulo,
              style: TextStyle(
                  color: Color.fromRGBO(38, 191, 115, 1),
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
