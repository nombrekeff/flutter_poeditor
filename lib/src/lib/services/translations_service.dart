import 'package:dart_poeditor/src/lib/responses.dart';

import 'base_service.dart';

class TranslationsService extends ServiceBase {
  TranslationsService({
    required super.apiToken,
    required super.url,
    required super.paths,
    super.client,
    super.interceptors,
  });

  Future<AddResult> add({required String name, String? description}) {
    return post(Uri.parse(url).replace(path: paths.viewProject), {
      'name': name,
      if (description != null) 'description': description,
    }).then((data) => AddResult.fromJson(data, 'projects'));
  }

  Future delete(int projectId) {
    return post(Uri.parse(url).replace(path: paths.deleteProjects), {'id': projectId});
  }
}
