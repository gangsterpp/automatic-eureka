import 'package:VOX/features/beginning/domain/models/onboarding_model/onboarding_model.dart';
import 'package:vox_ui_kit/gen/assets.gen.dart';

class MockOnboardingData {
  static List<OnboardingModel> getOnboardingData() {
    return [
      OnboardingModel(
        title: 'Привет, это сервис VOX! ',

        imageUrl: Assets.images.onboarding.ownerWithDog.path,
        description: 'Мы помогаем заботиться о питомцах\n с 2020 года!',
      ),
      OnboardingModel(title: 'Возьмем заботы о ваших\nпитомцах на себя!', imageUrl: Assets.images.onboarding.dialogues.path),
      OnboardingModel(title: 'Не переживайте за безопасность —\n мы всё продумали!', imageUrl: Assets.images.onboarding.verified.path),
      OnboardingModel(
        title: 'Всё для вашего удобства',
        imageUrl: Assets.images.onboarding.appStructure.path,
        description: 'Следите за прогулкой в режиме\n реального времени!',
      ),
      OnboardingModel(
        title: 'Умный помощник для заботы о питомце!',
        imageUrl: Assets.images.onboarding.dialogueWithAi.path,
        description: 'Мы внедрили искусственный интеллект, который регулярно обучаем полезными и проверенными знаниями о животных',
      ),
    ];
  }
}
