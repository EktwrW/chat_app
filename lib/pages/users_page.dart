import 'dart:ui';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:chat_app/services/users_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat_app/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarioService = new UsuariosService();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<Usuario> usuarios = [];

  /* final usuarios = [
    Usuario(uid: '1', nombre: 'Nikola', email: 'test1@test.com', online: true),
    Usuario(uid: '2', nombre: 'Tony', email: 'test2@test.com', online: true),
    Usuario(uid: '3', nombre: 'Alan', email: 'test3@test.com', online: false),
    Usuario(uid: '4', nombre: 'Gregor', email: 'test4@test.com', online: true),
  ]; */

  @override
  void initState() {
    this._cargarUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 2,
          title: Text(
            usuario.nombre,
            style: GoogleFonts.varelaRound(
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Color.fromRGBO(38, 191, 115, 1),
          leading: IconButton(
              alignment: AlignmentDirectional.center,
              icon: Icon(CupertinoIcons.arrow_left_circle_fill),
              onPressed: () {
                socketService.disconnect();
                Navigator.pushReplacementNamed(context, 'login');
                AuthService.deleteToken();
              }),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: (socketService.serverStatus == ServerStatus.Online)
                  ? Icon(CupertinoIcons.check_mark_circled_solid)
                  : Icon(
                      CupertinoIcons.multiply_circle_fill,
                    ),
            )
          ],
        ),
        body: SmartRefresher(
          onRefresh: _cargarUsuarios,
          controller: _refreshController,
          header: WaterDropMaterialHeader(
            backgroundColor: Color.fromRGBO(38, 191, 115, 1),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 5),
            child: _listViewUsuarios(),
          ),
        ));
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: usuarios.length,
    );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        foregroundColor: Color.fromRGBO(74, 21, 75, 1),
        backgroundColor: Color.fromRGBO(74, 21, 75, 0.3),
        child: Text(
          usuario.nombre.substring(0, 2),
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      trailing: Icon(
        CupertinoIcons.chat_bubble_2_fill,
        color: usuario.online ? Color.fromRGBO(38, 191, 115, 1) : Colors.red,
      ),
      onTap: () {
        final chatService = Provider.of<ChatService>(context, listen: false);
        chatService.usuarioPara = usuario;
        Navigator.pushNamed(context, 'chat');
      },
    );
  }

  void _cargarUsuarios() async {
    this.usuarios = await usuarioService.getUsuarios();
    setState(() {});
    //await Future.delayed(Duration(milliseconds: 1500));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
