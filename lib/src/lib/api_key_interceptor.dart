import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class TokenInterceptor implements InterceptorContract {
  final String apiToken;

  TokenInterceptor(this.apiToken);

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data.body);
    data.body += '&api_token=$apiToken';
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
