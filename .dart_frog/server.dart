// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';


import '../routes/index.dart' as index;
import '../routes/hello.dart' as hello;
import '../routes/api/cliente/listar.dart' as api_cliente_listar;
import '../routes/api/cliente/inserir.dart' as api_cliente_inserir;
import '../routes/api/cliente/index.dart' as api_cliente_index;


void main() async {
  final address = InternetAddress.tryParse('') ?? InternetAddress.anyIPv6;
  final port = int.tryParse(Platform.environment['PORT'] ?? '8080') ?? 8080;
  hotReload(() => createServer(address, port));
}

Future<HttpServer> createServer(InternetAddress address, int port) {
  final handler = Cascade().add(buildRootHandler()).handler;
  return serve(handler, address, port);
}

Handler buildRootHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..mount('/api/cliente', (context) => buildApiClienteHandler()(context))
    ..mount('/', (context) => buildHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildApiClienteHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/listar', (context) => api_cliente_listar.onRequest(context,))..all('/inserir', (context) => api_cliente_inserir.onRequest(context,))..all('/', (context) => api_cliente_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => index.onRequest(context,))..all('/hello', (context) => hello.onRequest(context,));
  return pipeline.addHandler(router);
}

