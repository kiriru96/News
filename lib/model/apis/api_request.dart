class ApiRequest<T> {
  Status status;
  T? data;
  String? message;

  ApiRequest.initial(this.message) : status = Status.INITIAL;

  ApiRequest.loading(this.message) : status = Status.LOADING;

  ApiRequest.completed(this.data) : status = Status.COMPLETED;

  ApiRequest.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { INITIAL, LOADING, COMPLETED, ERROR }
