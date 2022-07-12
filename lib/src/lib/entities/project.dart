class Project {
  final int id;
  final String name;
  final String description;
  final int public;
  final int open;
  final int terms;
  final String created;
  final String referenceLanguage;
  final String fallbackLanguage;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.public,
    required this.open,
    required this.terms,
    required this.created,
    required this.referenceLanguage,
    required this.fallbackLanguage,
  });

  factory Project.fromJson(Map<String, dynamic> data) {
    return Project(
      id: data['id'],
      created: data['created'],
      description: data['description'],
      name: data['name'],
      open: data['open'],
      public: data['public'],
      terms: data['terms'],
      fallbackLanguage: data['fallbackLanguage'],
      referenceLanguage: data['referenceLanguage'],
    );
  }
}
