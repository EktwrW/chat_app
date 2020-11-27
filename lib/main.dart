import 'package:flutter/material.dart';

import 'package:chat_app/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionHandleColor: Color.fromRGBO(38, 191, 115, 1),
        cursorColor: Color.fromRGBO(38, 191, 115, 1),
        textTheme: GoogleFonts.varelaRoundTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      initialRoute: 'chat',
      routes: appRoutes,
    );
  }
}
