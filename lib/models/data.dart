import 'package:json_annotation/json_annotation.dart';
//flutter pub run build_runner build

part 'data.g.dart';

@JsonSerializable()
class DataResult {
  List<Data> datas;

  DataResult(this.datas);

  factory DataResult.fromJson(Map<String, dynamic> json) =>
      _$DataResultFromJson(json);

  Map<String, dynamic> toJson() => _$DataResultToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'width_at')
  int width;
  int height;
  Urls urls;
  Links links;
  User user;

  Data({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.urls,
    this.links,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}

@JsonSerializable()
class Links {
  String self;
  String html;
  String download;
  @JsonKey(name: "download_location")
  String downloadLocation;

  Links({this.self, this.html, this.download, this.downloadLocation});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class User {
  String id;

  @JsonKey(includeIfNull: true, name: "name")
  String name;
  @JsonKey(includeIfNull: true, name: "first_name")
  String firstName;
  @JsonKey(includeIfNull: true, name: "last_name")
  String lastName;

  User({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
  String getName() {
    return name ?? firstName ?? lastName ?? '';
  }
}

@JsonSerializable()
class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({this.small, this.medium, this.large});

  factory ProfileImage.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileImageToJson(this);
}
