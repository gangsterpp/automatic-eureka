import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_model.freezed.dart';
part 'onboarding_model.g.dart';

@freezed
abstract class OnboardingModel with _$OnboardingModel {
  const factory OnboardingModel({required String title, required String imageUrl, String? description}) = _OnboardingModel;

  factory OnboardingModel.fromJson(Map<String, Object?> json) => _$OnboardingModelFromJson(json);
}
