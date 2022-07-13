import 'dart:convert';

import 'translation.dart';

class Term {
  final String term;
  final String context;
  final String created;
  final String updated;
  final String plural;
  final String reference;
  final String comment;
  final Translation translation;
  final List<String> tags;

  Term({
    required this.term,
    required this.context,
    required this.plural,
    required this.updated,
    required this.reference,
    required this.tags,
    required this.created,
    required this.comment,
    required this.translation,
  });

  get isPlural => plural.isNotEmpty;

  @override
  toString() {
    return 'Term(${jsonEncode(toJson())})';
  }

  Map<String, dynamic> toJson() {
    return {
      'term': term,
      'context': context,
      'plural': plural,
      'updated': updated,
      'created': created,
      'reference': reference,
      'tags': tags,
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
