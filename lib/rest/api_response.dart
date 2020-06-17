class APIResponse<T> {
  int code;
  String message;
  bool isSuccess;
  T data;
  APIResponse({this.code, this.message, this.isSuccess, this.data});

  APIResponse.fromJson(Map<String, dynamic> json) {
    // APIResponse apiresponse= APIResponse(
    code = json["code"];
    data = json["data"];
    message = json["message"];
    isSuccess = json["isSuccess"];
    // );
    // return apiresponse;
  }
}
