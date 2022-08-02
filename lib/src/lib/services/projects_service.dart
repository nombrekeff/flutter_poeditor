import 'package:dart_poeditor/src/lib/entities/project.dart';
import 'base_service.dart';

class ProjectsService extends ServiceBase {
  ProjectsService({
    required super.apiToken,
    required super.paths,
    required super.url,
    super.client,
    super.interceptors,
  });

  Future<List<Project>> list() {
    return post(Uri.parse(url).replace(path: paths.listProjects), {}).then(_mapProjects);
  }

  Future<Project> view(int projectId) {
    return post(Uri.parse(url).replace(path: paths.viewProject), {
      'id': projectId.toString(),
    }).then(_mapProject);
  }

  Future<Project> add({required String name, String? description}) {
    return post(Uri.parse(url).replace(path: paths.viewProject), {
      'name': name,
      if (description != null) 'description': description,
    }).then(_mapProject);
  }

  Future<Map<String, dynamic>> exportJson({
    required int projectId,
    required String language,
  }) async {
    try {
      final resp = await post(
        Uri.parse(url).replace(path: paths.exportProjects),
        {
          'id': '$projectId',
          'language': language,
          'type': 'key_value_json',
        },
      );

      return get(Uri.parse(resp['result']['url']));
    } catch (e) {
      return {};
    }
  }

  Future delete(int projectId) {
    return post(Uri.parse(url).replace(path: paths.deleteProjects), {'id': projectId});
  }

  Future<List<Project>> _mapProjects(Map<String, dynamic> data) async {
    final List<Project> projects = [];
    final jsonList = data['result']['projects'];

    for (final item in jsonList) {
      projects.add(Project.fromJson(item));
    }

    return projects;
  }

  Future<Project> _mapProject(Map<String, dynamic> data) async {
    final projectData = data['result']['project'];
    return Project.fromJson(projectData);
  }
}
