import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@freezed
class UserModels with _$UserModels {
  factory UserModels({
    @Default('') @JsonKey(name: 'token') String token,
    @Default('') @JsonKey(name: 'error') String error,
  }) = _UserModels;

  factory UserModels.fromJson(Map<String,dynamic> json) => _$UserModelsFromJson(json);
}