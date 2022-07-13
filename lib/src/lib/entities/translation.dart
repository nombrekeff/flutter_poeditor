abstract class Translation {
  final String updated;
  final int fuzzy;
  final int proofread;

  Translation({
    required this.updated,
    required this.fuzzy,
    required this.proofread,
  });

  Map<String, dynamic> toJson();
}

class SingleTranslation extends Translation {
  final String content;

  SingleTranslation({
    required this.content,
    required super.updated,
    required super.fuzzy,
    required super.proofread,
  });

  factory SingleTranslation.fromJson(Map<String, dynamic> data) {
    return SingleTranslation(
      content: data["content"],
      updated: data["updated"],
      fuzzy: data["fuzzy"] ?? 0,
      proofread: data["proofread"] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'updated': updated,
      'content': content,
      'fuzzy': fuzzy,
      'proofread': proofread,
    };
  }
}

class PluralTranslation extends Translation {
  final PluralTranslationContent content;

  PluralTranslation({
    required this.content,
    required super.updated,
    required super.fuzzy,
    required super.proofread,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'updated': updated,
      'content': content.toJson(),
      'fuzzy': fuzzy,
      'proofread': proofread,
    };
  }

  factory PluralTranslation.fromJson(Map<String, dynamic> data) {
    return PluralTranslation(
      content: PluralTranslationContent.fromJson(data["content"]),
      updated: data["updated"],
      fuzzy: data["fuzzy"] ?? 0,
      proofread: data["proofread"] ?? 0,
    );
  }
}

class PluralTranslationContent {
  final String one;
  final String other;

  PluralTranslationContent({
    required this.one,
    required this.other,
  });

  factory PluralTranslationContent.fromJson(Map<String, dynamic> data) {
    return PluralTranslationContent(
      one: data["one"],
      other: data["other"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'one': one,
      'other': other,
    };
  }
}
