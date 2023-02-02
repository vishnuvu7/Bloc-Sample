enum HttpRequestType { post, get, put, patch, delete }

extension NetworkTypeExtension on HttpRequestType {
  /// [RequestType] convert to string value.
  String get stringValue {
    switch (this) {
      case HttpRequestType.get:
        return 'GET';
      case HttpRequestType.post:
        return 'POST';
      case HttpRequestType.delete:
        return 'DELETE';
      case HttpRequestType.put:
        return 'PUT';
      case HttpRequestType.patch:
        return 'PATCH';
      default:
        throw 'Method Not Found';
    }
  }
}
