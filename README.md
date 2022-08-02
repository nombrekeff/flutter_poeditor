<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Dart package to communicate with the [POEditor API](https://poeditor.com/docs/api)

## Features
Manage your POEditor projects, translations, and terms via it's API from dart.

## Getting started

To install the package check the install [guide](https://pub.dev/packages/dart_poeditor/install)


## Usage

Check the examples in the `/example` folder. 

```dart
  import 'package:dart_poeditor/dart_poeditor.dart';

  final editor = POEditorAPI(apiToken: env['API_TOKEN'] as String);
  editor.projects
      .exportJson(projectId: int.parse(env['PROJECT_ID'] ?? '0'), language: 'es')
      .then((value) => print(value));
```
