mixin POResult {}

class AddResult implements POResult {
  final int parsed;
  final int added;

  AddResult(this.parsed, this.added);

  factory AddResult.fromJson(Map<String, dynamic> data, String field) {
    return AddResult(data['result'][field]['parsed'], data['result'][field]['added']);
  }
}

class UpdateResult implements POResult {
  final int parsed;
  final int updated;

  UpdateResult(this.parsed, this.updated);

  factory UpdateResult.fromJson(Map<String, dynamic> data, String field) {
    return UpdateResult(data['result'][field]['parsed'], data['result'][field]['updated']);
  }
}

class DeleteResult implements POResult {
  final int parsed;
  final int deleted;

  DeleteResult(this.parsed, this.deleted);

  factory DeleteResult.fromJson(Map<String, dynamic> data, String field) {
    return DeleteResult(data['result'][field]['parsed'], data['result'][field]['deleted']);
  }
}
