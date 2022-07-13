import 'package:flutter_poeditor/src/lib/entities/project.dart';
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
