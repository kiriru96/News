class AppException implements Exception {
  final message;
  final prefix;

  AppException({this.message, this.prefix});

  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message: message, prefix: "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message])
      : super(message: message, prefix: "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message])
      : super(message: message, prefix: "Unauthorised Request: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message: message, prefix: "Invalid Input: ");
}
