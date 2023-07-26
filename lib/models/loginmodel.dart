class LoginModel {
  LoginModel({
    required this.code,
    required this.message,
    this.data,
  });

  late final int code;
  late final String message;
  late final Data? data;

  LoginModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    if(json['data'] != null) {
      data = Data.fromJson(json['data']);
    }else{
      data = null;
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    if(data != null){
      _data['data'] = data!.toJson();
    }
    return _data;
  }
}

class Data {
  Data({
    required this.Id,
    required this.Name,
    required this.Email,
    required this.Token,
  });
  late final int Id;
  late final String Name;
  late final String Email;
  late final String Token;

  Data.fromJson(Map<String, dynamic> json){
    Id = json['Id'];
    Name = json['Name'];
    Email = json['Email'];
    Token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Name'] = Name;
    _data['Email'] = Email;
    _data['Token'] = Token;
    return _data;
  }
}