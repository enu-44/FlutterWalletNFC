import 'package:json_annotation/json_annotation.dart';
part 'jwt_model.g.dart';

@JsonSerializable(createToJson: false)
class JwtModel {
  JwtModel({this.userName, this.userId, this.exp});
  factory JwtModel.fromJson(Map<String, dynamic> json) =>
      _$JwtModelFromJson(json);

  @JsonKey(name: 'name_user')
  String? userName;
  @JsonKey(name: 'user_id')
  String? userId;
  int? exp;
}
