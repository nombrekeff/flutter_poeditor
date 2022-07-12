import 'dart:convert';

import 'package:http/http.dart';

import '../entities/language.dart';
import 'base_service.dart';

class LanguagesService extends ServiceBase {
  LanguagesService({
    required super.apiToken,
    required super.url,
    required super.paths,
    super.client,
    super.interceptors,
  });

  Future<List<Language>> list(int projectId) {
    return client.post(
      Uri.parse(url).replace(path: paths.listLanguages),
      body: {'id': '$projectId'},
    ).then(_mapLanguages);
  }

  List<Language> _mapLanguages(Response resp) {
    final data = jsonDecode(resp.body);
    print(data);
    final List<Language> languages = [];
    final jsonList = data['result']['languages'];

    for (final item in jsonList) {
      languages.add(Language.fromJson(item));
    }

    return languages;
  }
}
