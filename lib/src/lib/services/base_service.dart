import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import '../api_key_interceptor.dart';
import '../paths.dart';

abstract class ServiceBase {
  late Client client;
  final String url;
  final String apiToken;
  final ApiPaths paths;

  ServiceBase({
    required this.url,
    required this.apiToken,
    required this.paths,
    List<InterceptorContract> interceptors = const [],
    Client? client,
  }) : client = client ??
            InterceptedClient.build(
              interceptors: [...interceptors, TokenInterceptor(apiToken)],
            );

  Future<Map<String, dynamic>> post(Uri uri, [Map<String, dynamic>? body = const {}]) async {
    return client.post(uri, body: body).then(onResponse);
  }

  FutureOr<Map<String, dynamic>> onResponse(Response response) {
    if (response.statusCode >= 400) {
      return Future.error(response);
    }

    return Future.value(
      response.body.isNotEmpty ? json.decode(response.body) : {},
    );
  }
}
