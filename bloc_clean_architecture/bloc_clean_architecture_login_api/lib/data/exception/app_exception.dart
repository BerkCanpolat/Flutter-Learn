class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);

  @override
  String toString() {
    // TODO: implement toString
    return '$_message$_prefix';
  }
}

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message,'No Internet Connection');
}
class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message,'You Dont Have Access to this');
}
class RequestTimeException extends AppException {
  RequestTimeException([String? message]) : super(message,'Request Time Out');
}
class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message,'');
}

