class Language {
  final String code;
  final String name;
  final String updated;
  final int translations;
  final num percentage;

  Language({
    required this.code,
    required this.name,
    required this.updated,
    required this.translations,
    required this.percentage,
  });

  factory Language.fromJson(Map<String, dynamic> data) {
    return Language(
      code: data['code'],
      name: data['name'],
      updated: data['updated'],
      translations: data['translations'],
      percentage: data['percentage'],
    );
  }
}
