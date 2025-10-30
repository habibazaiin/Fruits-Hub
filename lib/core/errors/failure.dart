abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  // 👇 Handle HTTP response status codes
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == null) {
      return ServerFailure('Unknown error occurred.');
    }

    switch (statusCode) {
      case 400:
        return ServerFailure('Bad request. Please check your input.');
      case 401:
        return ServerFailure('Unauthorized. Please check your credentials.');
      case 403:
        return ServerFailure(
          'Forbidden. You don’t have access to this resource.',
        );
      case 404:
        return ServerFailure('Resource not found. Please try again later.');
      case 500:
        return ServerFailure('Internal server error. Please try again later.');
      default:
        return ServerFailure(
          'Oops! Error [$statusCode]: ${response?['error'] ?? 'Something went wrong.'}',
        );
    }
  }
}
