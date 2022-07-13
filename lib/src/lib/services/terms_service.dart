import 'package:flutter_poeditor/src/lib/entities/term.dart';
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

  Future<List<Term>> _mapTerms(Map<String, dynamic> data) async {
    final List<Term> terms = [];
    final jsonList = data['result']['terms'];

    for (final item in jsonList) {
      terms.add(Term.fromJson(item));
    }

    return terms;
  }
}
