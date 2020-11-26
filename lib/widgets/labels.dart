import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String question;
  final String textLink;

  const Labels(
      {Key key,
      @required this.ruta,
      @required this.textLink,
      @required this.question})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.question,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            child: Text(
              this.textLink,
              style: TextStyle(
                color: Color.fromRGBO(38, 191, 115, 1),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          )
        ],
      ),
    );
  }
}
