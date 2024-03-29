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
    return post(
      Uri.parse(url).replace(path: paths.listLanguages),
      {'id': '$projectId'},
    ).then(_mapLanguages);
  }

  Future add({required int projectId, required String language}) {
    return post(Uri.parse(url).replace(path: paths.addLanguages), {
      'id': projectId,
      'language': language,
    });
  }

  Future delete({required int projectId, required String language}) {
    return post(Uri.parse(url).replace(path: paths.deleteLanguages), {
      'id': projectId,
      'language': language,
    });
  }

  Future<List<Language>> _mapLanguages(Map<String, dynamic> data) async {
    final List<Language> languages = [];
    final jsonList = data['result']['languages'];

    for (final item in jsonList) {
      languages.add(Language.fromJson(item));
    }

    return languages;
  }
}
