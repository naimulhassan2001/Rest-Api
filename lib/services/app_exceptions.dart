
class AppExceptions implements Exception {
  final message;

  final prefixText;

  AppExceptions([this.message, this.prefixText]);


  @override
  String toString() {
    return "$prefixText $message";
  }
}

class InternetException extends AppExceptions {
  InternetException(String? message): super(message, "No internet");


}


class RequestTimeOutExceptions extends AppExceptions {
  RequestTimeOutExceptions(String? message): super(message, "Request Time out");
}
class ServerExceptions extends AppExceptions {
  ServerExceptions(String? message): super(message, "Server Exception");
}


class InvalidUrlExceptions extends AppExceptions {
  InvalidUrlExceptions(String? message): super(message, "Invalid Url");
}


class FetchDataExceptions extends AppExceptions {
  FetchDataExceptions(String? message): super(message, "FetchData Exceptions");
}
