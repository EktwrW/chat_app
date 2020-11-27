import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _messages = [];

  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(38, 191, 115, 1),
        title: Column(
          children: [
            Center(
              child: CircleAvatar(
                child: Text('De',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(38, 191, 115, 1),
                    )),
                backgroundColor: Colors.white.withOpacity(0.9),
                maxRadius: 14,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'John Deacon',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true,
              ),
            ),
            Divider(height: 1),
            Container(
              color: Colors.white,
              child: _inputChat(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmit,
              onChanged: (texto) {
                if (texto.trim().length > 0) {
                  _isWriting = true;
                } else {
                  _isWriting = false;
                }
                setState(() {});
              },
              decoration: InputDecoration.collapsed(
                  hintText: 'Enviar Mensaje',
                  hintStyle: TextStyle(color: Colors.black54)),
              focusNode: _focusNode,
            ),
          ),
          //Boton de enviar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Platform.isIOS
                ? CupertinoButton(
                    child: Text(
                      'Enviar',
                      style: TextStyle(color: Color.fromRGBO(38, 191, 115, 1)),
                    ),
                    onPressed: _isWriting
                        ? () => _handleSubmit(_textController.text.trim())
                        : null,
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data:
                          IconThemeData(color: Color.fromRGBO(38, 191, 115, 1)),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(
                          Icons.send_sharp,
                        ),
                        onPressed: _isWriting
                            ? () => _handleSubmit(_textController.text.trim())
                            : null,
                      ),
                    )),
          )
        ],
      ),
    ));
  }

  _handleSubmit(String texto) {
    if (texto.length == 0) return;
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessage(
      uid: '123',
      texto: texto,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 600)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _isWriting = false;
    });
  }

  @override
  void dispose() {
    //TODO off del socket

    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
