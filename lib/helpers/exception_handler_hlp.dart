class ExceptionHandler implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  ExceptionHandler([this.message, this.prefix, this.url]);
}

class BadRequestException extends ExceptionHandler {
  BadRequestException([String? message, String? url]) : super(message, 'Bad Request', url);
}

class FetchDataException extends ExceptionHandler {
  FetchDataException([String? message, String? url]) : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends ExceptionHandler {
  ApiNotRespondingException([String? message, String? url]) : super(message, 'Api not responded in time', url);
}

class UnAuthorizedException extends ExceptionHandler {
  UnAuthorizedException([String? message, String? url]) : super(message, 'UnAuthorized request', url);
}