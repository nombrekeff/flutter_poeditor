import 'package:dotenv/dotenv.dart';
import 'package:flutter_poeditor/flutter_poeditor.dart';

void main() {
  final env = DotEnv()..load(['example/env/.env']);
  if (!env.isDefined('API_TOKEN')) {
    throw Exception('API_TOKEN env is not defined in "example/env/.env"');
  }

  final editor = POEditorAPI(apiToken: env['API_TOKEN'] as String);
  editor.languages.list(545821).then((value) => print(value));
}
