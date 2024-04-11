import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate  with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(Response response) {
    if (response.statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (response.statusCode! >= 500) {
      return ServerFailure(
          'There is a problem with the server, please try later');
    } else if (response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      return ServerFailure(response.data['error']['message']);
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
