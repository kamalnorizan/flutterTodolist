
class UsersModel {
  int? page;
  int? perPage;
  int? totalrecord;
  int? totalPages;
  List<User>? data;

  UsersModel({this.page, this.perPage, this.totalrecord, this.totalPages, this.data});

  UsersModel.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    perPage = json["per_page"];
    totalrecord = json["totalrecord"];
    totalPages = json["total_pages"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => User.fromJson(e)).toList();
  }

  static List<UsersModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => UsersModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    _data["per_page"] = perPage;
    _data["totalrecord"] = totalrecord;
    _data["total_pages"] = totalPages;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  UsersModel copyWith({
    int? page,
    int? perPage,
    int? totalrecord,
    int? totalPages,
    List<User>? data,
  }) => UsersModel(
    page: page ?? this.page,
    perPage: perPage ?? this.perPage,
    totalrecord: totalrecord ?? this.totalrecord,
    totalPages: totalPages ?? this.totalPages,
    data: data ?? this.data,
  );
}

class User {
  String? $id;
  int? id;
  String? name;
  String? email;
  String? profilepicture;
  String? location;
  String? createdat;

  User({this.$id, this.id, this.name, this.email, this.profilepicture, this.location, this.createdat});

  User.fromJson(Map<String, dynamic> json) {
    $id = json["$id"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    profilepicture = json["profilepicture"];
    location = json["location"];
    createdat = json["createdat"];
  }

  static List<User> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => User.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["$id"] = $id;
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["profilepicture"] = profilepicture;
    _data["location"] = location;
    _data["createdat"] = createdat;
    return _data;
  }

  User copyWith({
    String? $id,
    int? id,
    String? name,
    String? email,
    String? profilepicture,
    String? location,
    String? createdat,
  }) => User(
    $id: $id ?? this.$id,
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    profilepicture: profilepicture ?? this.profilepicture,
    location: location ?? this.location,
    createdat: createdat ?? this.createdat,
  );
}