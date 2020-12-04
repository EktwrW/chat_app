import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chat_app/model/mensajes_response.dart';
import 'package:chat_app/global/enviroments.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/model/user.dart';

class ChatService with ChangeNotifier {
  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    final resp = await http.get('${Environment.apiUrl}/mensajes/$usuarioID',
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
        });

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;
  }
}
