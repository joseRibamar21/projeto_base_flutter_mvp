import '../../data/cache/cache.dart';
import '../../data/http/http.dart';

class AuthorizeHttpClientDecorator implements HttpClient {
  final CacheStorage secureCacheStorage;
  final HttpClient decorate;

  AuthorizeHttpClientDecorator({
    required this.secureCacheStorage,
    required this.decorate,
  });

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
  }) async {
    try {
      final token = await secureCacheStorage.fetch('token');
      if (token == null) {
        throw HttpError.unauthorized;
      }
      final authorizedHeaders = headers ?? {}
        ..addAll({'Authorization': "Bearer " + token});
      return await decorate.request(
          url: url, method: method, body: body!, headers: authorizedHeaders);
    } on HttpError catch (error) {
      if (error != HttpError.forbidden) {
        rethrow;
      } else {
        await secureCacheStorage.delete('token');
        throw HttpError.forbidden;
      }
    }
  }
}
