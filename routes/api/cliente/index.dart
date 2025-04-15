import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../../app/model/cliente.dart';

Future<Response> onRequest(RequestContext context) {
  final method = context.request.method;

  return switch (method) {
    HttpMethod.get => _buscartodos(context),
    HttpMethod.post => _inserir(context),
    HttpMethod.put => _atualizar(context),
    HttpMethod.delete => _excluir(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed))
  };
}

Future<Response> _inserir(RequestContext context) async {
  final result = <Map<String, dynamic>>[];
  final data = <Map<String, dynamic>>[];
  result.add({'success': true, 'message': 'OK', 'data': data});
  return Response.json(body: result);
}

Future<Response> _buscartodos(RequestContext context) async {
  final cliente =
      Cliente(nome: 'Paulo', email: 'paulo@teste.com.br', cpf: '123456789');

  final data = <Map<String, dynamic>>[];
  final result = <Map<String, dynamic>>[];

  for (var i = 0; i < 10; i++) {
    data.add(cliente.toMap());
  }

  result.add({'success': true, 'message': 'OK', 'data': data});

  return Response.json(body: result);
}

Future<Response> _atualizar(RequestContext context) async {
  final result = <Map<String, dynamic>>[];
  final data = <Map<String, dynamic>>[];
  result.add({'success': true, 'message': 'OK', 'data': data});
  return Response.json(body: result);
}

Future<Response> _excluir(RequestContext context) async {
  final result = <Map<String, dynamic>>[];
  final data = <Map<String, dynamic>>[];
  result.add({'success': true, 'message': 'OK', 'data': data});
  return Response.json(body: result);
}
