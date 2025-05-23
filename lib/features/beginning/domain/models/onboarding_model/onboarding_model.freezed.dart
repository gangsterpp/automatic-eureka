// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnboardingModel {

 String get title; String get imageUrl; String? get description;
/// Create a copy of OnboardingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingModelCopyWith<OnboardingModel> get copyWith => _$OnboardingModelCopyWithImpl<OnboardingModel>(this as OnboardingModel, _$identity);

  /// Serializes this OnboardingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingModel&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,imageUrl,description);

@override
String toString() {
  return 'OnboardingModel(title: $title, imageUrl: $imageUrl, description: $description)';
}


}

/// @nodoc
abstract mixin class $OnboardingModelCopyWith<$Res>  {
  factory $OnboardingModelCopyWith(OnboardingModel value, $Res Function(OnboardingModel) _then) = _$OnboardingModelCopyWithImpl;
@useResult
$Res call({
 String title, String imageUrl, String? description
});




}
/// @nodoc
class _$OnboardingModelCopyWithImpl<$Res>
    implements $OnboardingModelCopyWith<$Res> {
  _$OnboardingModelCopyWithImpl(this._self, this._then);

  final OnboardingModel _self;
  final $Res Function(OnboardingModel) _then;

/// Create a copy of OnboardingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? imageUrl = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _OnboardingModel implements OnboardingModel {
  const _OnboardingModel({required this.title, required this.imageUrl, this.description});
  factory _OnboardingModel.fromJson(Map<String, dynamic> json) => _$OnboardingModelFromJson(json);

@override final  String title;
@override final  String imageUrl;
@override final  String? description;

/// Create a copy of OnboardingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingModelCopyWith<_OnboardingModel> get copyWith => __$OnboardingModelCopyWithImpl<_OnboardingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnboardingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingModel&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,imageUrl,description);

@override
String toString() {
  return 'OnboardingModel(title: $title, imageUrl: $imageUrl, description: $description)';
}


}

/// @nodoc
abstract mixin class _$OnboardingModelCopyWith<$Res> implements $OnboardingModelCopyWith<$Res> {
  factory _$OnboardingModelCopyWith(_OnboardingModel value, $Res Function(_OnboardingModel) _then) = __$OnboardingModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String imageUrl, String? description
});




}
/// @nodoc
class __$OnboardingModelCopyWithImpl<$Res>
    implements _$OnboardingModelCopyWith<$Res> {
  __$OnboardingModelCopyWithImpl(this._self, this._then);

  final _OnboardingModel _self;
  final $Res Function(_OnboardingModel) _then;

/// Create a copy of OnboardingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? imageUrl = null,Object? description = freezed,}) {
  return _then(_OnboardingModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
