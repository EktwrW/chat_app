import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInput extends StatefulWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  bool isPassword;
  final Color iconColor;
  final bool showHideIcon;

  CustomInput({
    Key key,
    @required this.icon,
    @required this.placeholder,
    @required this.textController,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.iconColor,
    @required this.showHideIcon,
  }) : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          padding: EdgeInsets.only(right: 38),
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, 5),
                  blurRadius: 5,
                )
              ]),
          child: TextField(
            controller: this.widget.textController,
            textAlignVertical: TextAlignVertical.bottom,
            autocorrect: false,
            keyboardType: this.widget.keyboardType,
            obscureText: this.widget.isPassword,
            decoration: InputDecoration(
              prefixIcon: Icon(
                this.widget.icon,
                color: this.widget.iconColor,
              ),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: this.widget.placeholder,
              hintStyle: TextStyle(color: Colors.black54),
            ),
          )),
      Visibility(
        visible: this.widget.showHideIcon,
        child: Container(
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.width - 125),
          child: TextButton.icon(
            onPressed: () {
              if (widget.isPassword == true) {
                widget.isPassword = false;
              } else if (widget.isPassword == false) {
                widget.isPassword = true;
              }
              setState(() {});
            },
            label: Text(''),
            icon: Icon(
              CupertinoIcons.eye_solid,
              color: Color.fromRGBO(38, 191, 115, 1),
              size: 18,
            ),
          ),
        ),
      ),
    ]);
  }
}
