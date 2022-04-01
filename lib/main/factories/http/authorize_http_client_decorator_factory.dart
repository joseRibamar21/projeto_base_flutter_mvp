import '../cache/cache.dart';

import '../../../data/http/http.dart';
import '../../decorators/decorators.dart';
import 'http.dart';

HttpClient makeAuthorizeHttpClientDecorator() => AuthorizeHttpClientDecorator(
      decorate: makeHttpAdapter(),
      secureCacheStorage: makeSecureStorageAdapter(),
    );
