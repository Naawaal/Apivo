abstract final class RoutePaths {
  static const String home = '/';
  static const String request = '/request';
  static const String requestWithId = '/request/:requestId';
  static const String collections = '/collections';
  static const String collectionDetail = '/collections/:collectionId';
  static const String history = '/history';
  static const String environments = '/environments';
  static const String environmentDetail = '/environments/:environmentId';
  static const String settings = '/settings';

  static String requestById(String requestId) => '/request/$requestId';
  static String collectionById(String collectionId) =>
      '/collections/$collectionId';
  static String environmentById(String environmentId) =>
      '/environments/$environmentId';
}
