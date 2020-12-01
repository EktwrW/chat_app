import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

mostrarAlerta(BuildContext context, String titulo, String subtitulo) {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          titulo,
          textAlign: TextAlign.center,
        ),
        content: Text(
          subtitulo,
          textAlign: TextAlign.center,
        ),
        actions: [
          Container(
            width: double.maxFinite,
            child: Center(
              child: MaterialButton(
                child: Text(
                  'Ok',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                textColor: Colors.white,
                elevation: 5,
                color: Color.fromRGBO(38, 191, 115, 1),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          )
        ],
      ),
    );
  }

  showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(
              titulo,
              textAlign: TextAlign.center,
            ),
            content: Text(
              subtitulo,
              textAlign: TextAlign.center,
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(
                  'Ok',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(38, 191, 115, 1),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ));
}
