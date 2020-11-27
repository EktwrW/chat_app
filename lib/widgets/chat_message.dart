import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage(
      {Key key,
      @required this.texto,
      @required this.uid,
      @required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
            parent: animationController, curve: Curves.easeInExpo),
        child: Container(
          child: this.uid == '123' ? _myMessage() : _otherMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 5, left: 50, right: 5),
        child: Text(
          this.texto,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900],
            fontWeight: FontWeight.w500,
          ),
        ),
        decoration: BoxDecoration(
            color: Color.fromRGBO(38, 191, 115, 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color.fromRGBO(38, 191, 115, 1),
              width: 1,
            )),
      ),
    );
  }

  Widget _otherMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 5, right: 50, left: 5),
        child: Text(
          this.texto,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900],
            fontWeight: FontWeight.w500,
          ),
        ),
        decoration: BoxDecoration(
            color: Color.fromRGBO(74, 21, 75, 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color.fromRGBO(74, 21, 75, 1),
              width: 1,
            )),
      ),
    );
  }
}
