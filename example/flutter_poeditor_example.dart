import 'dart:convert';

import 'package:dart_poeditor/src/lib/entities/term.dart';
import 'package:dotenv/dotenv.dart';
import 'package:dart_poeditor/dart_poeditor.dart';

void main() {
  final env = DotEnv()..load(['example/env/.env']);
  if (!env.isDefined('API_TOKEN')) {
    throw Exception('API_TOKEN env is not defined in "example/env/.env"');
  }

  if (!env.isDefined('PROJECT_ID')) {
    throw Exception('PROJECT_ID env is not defined in "example/env/.env"');
  }

  final editor = POEditorAPI(apiToken: env['API_TOKEN'] as String);
  editor.projects
      .exportJson(projectId: int.parse(env['PROJECT_ID'] ?? '0'), language: 'es')
      .then((value) => print(value));
}
