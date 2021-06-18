import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:solutasks/services/dados_.dart';

class GeraSenha extends StatefulWidget {
  @override
  _GeraSenhaState createState() => _GeraSenhaState();
}

class _GeraSenhaState extends State<GeraSenha> {
  String input = "";

  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Senha diária"),
        brightness: Brightness.dark,
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              onChanged: (String tarefa) {
                setState(() {
                  input = tarefa;
                });
              },
            ),
          ),
          TextButton(
            onPressed: () async {
              var res = await _getRequest(input);
              print(res);
              setState(() {
                senha = res;
              });

              //print(senha);
            },
            child: Text("Gerar senha"),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(senha),
            ),
          ),
        ],
      ),
    );
  }
}

Future<String> _getRequest(String usuario) async {
  const dados = const Dados();
  HttpClient client = new HttpClient();
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  String url1 = dados.url1 + usuario;
  String url2 = dados.url2 + usuario;
  String token = dados.token;

  try {
    HttpClientRequest request = await client.getUrl(Uri.parse(url1));

    request.headers.set('content-type', 'application/json');
    request.headers.set('authorization', token);

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();

    print(reply);

    return reply;
  } catch (e) {
    HttpClientRequest request = await client.getUrl(Uri.parse(url2));

    request.headers.set('content-type', 'application/json');
    request.headers.set('authorization', token);

    HttpClientResponse response = await request.close();

    String reply = await response.transform(utf8.decoder).join();

    print(reply);

    return reply;
  }
}

class Senha {
  String senha;

  Senha(this.senha);
}
