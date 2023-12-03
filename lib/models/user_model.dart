import 'dart:convert';

class UserModel {
  final bool success;
  final Response response;

  UserModel({
    required this.success,
    required this.response,
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        response: Response.fromMap(json["response"]),
      );
}

class Response {
  final int? currentPage;
  final List<User>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  Response({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

  factory Response.fromMap(Map<String, dynamic> json) => Response(
        currentPage: json["current_page"],
        data: List<User>.from(json["data"].map((x) => User.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );
}

class User {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? address;
  final String? photo;
  final String? caption;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? deleted;

  User({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.address,
    this.photo,
    this.caption,
    this.createdAt,
    this.updatedAt,
    this.deleted,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        address: json["address"],
        photo: json["photo"],
        caption: json["caption"],
        createdAt: (json["created_at"] != null)
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: DateTime.parse(json["updated_at"]),
        deleted: (json["updated_at"] != null) ? json["deleted"] : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "address": address,
        "photo": photo,
        "caption": caption,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted": deleted,
      };
}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );
}
