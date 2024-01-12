enum Status { Loading, COMPLETED, ERROR }

class ApiResponse<T> {
  Status? status;

  T? data;

  String? message;

  ApiResponse(this.status, this.message, this.data);

  ApiResponse.loading() : status = Status.Loading;

  ApiResponse.complete(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \nMessage : $message \nData : $data";
  }
}
