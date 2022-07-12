import 'base_service.dart';

class TermsService extends ServiceBase {
  TermsService({
    required super.apiToken,
    required super.url,
    required super.paths,
    super.client,
    super.interceptors,
  });
}
