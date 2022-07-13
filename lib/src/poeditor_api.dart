import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

import 'lib/paths.dart';
import 'lib/services/languages_service.dart';
import 'lib/services/projects_service.dart';
import 'lib/services/terms_service.dart';

class POEditorAPI {
  final String apiToken;
  final String url;
  final LanguagesService languages;
  final ProjectsService projects;
  final TermsService terms;

  POEditorAPI({
    required this.apiToken,
    this.url = 'https://api.poeditor.com',
    List<InterceptorContract> interceptors = const [],
    Client? client,
    ApiPaths paths = const ApiPaths(),
  })  : languages = LanguagesService(
          apiToken: apiToken,
          paths: paths,
          url: url,
          client: client,
          interceptors: interceptors,
        ),
        projects = ProjectsService(
          apiToken: apiToken,
          paths: paths,
          url: url,
          client: client,
          interceptors: interceptors,
        ),
        terms = TermsService(
          apiToken: apiToken,
          paths: paths,
          url: url,
          client: client,
          interceptors: interceptors,
        );
}
