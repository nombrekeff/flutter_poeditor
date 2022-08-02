import 'translation.dart';

class Term {
  final String term;
  final String context;
  final String created;
  final String updated;
  final String plural;
  final String reference;
  final String comment;
  final List<String> tags;
  final Translation translation;

  Term({
    required this.term,
    required this.context,
    required this.plural,
    required this.updated,
    required this.reference,
    required this.created,
    required this.comment,
    required this.translation,
    this.tags = const [],
  });

  get isPlural => plural.isNotEmpty;

  Map<String, dynamic> toJson() {
    return {
      'term': term,
      'context': context,
      'plural': plural,
      'updated': updated,
      'created': created,
      'reference': reference,
      if (tags.length > 1) 'tags': tags,
      if (tags.length == 1) 'tags': tags.first,
      'comment': comment,
      'translation': translation.toJson(),
      'has_plural': isPlural,
    };
  }

  factory Term.fromJson(Map<String, dynamic> data) {
    final hasPlural = data['plural'] != '';
    final translation = hasPlural
        ? PluralTranslation.fromJson(data['translation'])
        : SingleTranslation.fromJson(data['translation']);

    return Term(
      term: data['term'],
      context: data['context'],
      plural: data['plural'],
      updated: data['updated'],
      reference: data['reference'],
      tags: List<String>.from(data['tags']),
      created: data['created'],
      comment: data['comment'],
      translation: translation,
    );
  }
}

class TermData {
  final String term;
  final String context;
  final String plural;
  final String reference;
  final String comment;
  final List<String> tags;

  TermData({
    required this.term,
    required this.context,
    required this.plural,
    required this.reference,
    required this.comment,
    this.tags = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'term': term,
      'context': context,
      'plural': plural,
      'reference': reference,
      if (tags.length > 1) 'tags': tags,
      if (tags.length == 1) 'tags': tags.first,
      'comment': comment,
    };
  }

  factory TermData.fromJson(Map<String, dynamic> data) {
    return TermData(
      term: data['term'],
      context: data['context'],
      plural: data['plural'],
      reference: data['reference'],
      tags: List<String>.from(data['tags'] ?? []),
      comment: data['comment'],
    );
  }
}
