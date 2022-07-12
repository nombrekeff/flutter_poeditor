import 'base_service.dart';

class ProjectsService extends ServiceBase {
  ProjectsService({
    required super.apiToken,
    required super.paths,
    required super.url,
    super.client,
    super.interceptors,
  });
}
