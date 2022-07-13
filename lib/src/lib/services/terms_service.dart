import 'package:dart_poeditor/src/lib/entities/term.dart';
import 'package:dart_poeditor/src/lib/entities/translation.dart';
import 'base_service.dart';

class TermsService extends ServiceBase {
  TermsService({
    required super.apiToken,
    required super.url,
    required super.paths,
    super.client,
    super.interceptors,
  });

  Future<List<Term>> list(int projectId, String language) {
    return post(Uri.parse(url).replace(path: paths.listTerms), {
      'id': projectId.toString(),
      'language': language,
    }).then(_mapTerms);
  }

  Future<Map<String, dynamic>> getAsKeyValue(int projectId, String language) async {
    final listData = await list(projectId, language);
    final data = <String, dynamic>{};

    for (final entry in listData) {
      final translation = entry.translation;

      if (translation is PluralTranslation) {
        data[entry.term] = translation.content.toJson();
      } else if (translation is SingleTranslation) {
        data[entry.term] = translation.content;
      }
    }

    return data;
  }

  Future<List<Term>> _mapTerms(Map<String, dynamic> data) async {
    final List<Term> terms = [];
    final jsonList = data['result']['terms'];

    for (final item in jsonList) {
      terms.add(Term.fromJson(item));
    }

    return terms;
  }
}
