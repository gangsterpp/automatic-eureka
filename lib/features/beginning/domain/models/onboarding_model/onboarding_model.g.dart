// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnboardingModel _$OnboardingModelFromJson(Map<String, dynamic> json) =>
    _OnboardingModel(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$OnboardingModelToJson(_OnboardingModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
    };
