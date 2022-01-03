class Responses {
  String? _message;

  var _data;

 var _status;

  String ? get message => _message;
  get status => _status;
  get data => _data;

  Responses({  String? message,    status, data}) {
    _message = message;
    _status= status;
    _data = data;
  }
  Responses.fromJson(dynamic json) {
    _status = json['status']?? '';
    _message = json['message']?? '';
    _data  = json['data'] ?? '';
  }



}
