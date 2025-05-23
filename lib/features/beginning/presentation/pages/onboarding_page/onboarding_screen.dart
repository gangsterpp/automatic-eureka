import 'package:VOX/core/routes/app_router.gr.dart';
import 'package:VOX/providers/app_storage.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vox_ui_kit/core/constants/constants.dart';
import 'package:vox_ui_kit/core/theme/colors.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';
import 'package:vox_uikit/main.dart';

import '../../../domain/models/onboarding_model/onboarding_model.dart';
import '../../../domain/models/onboarding_model/onboarding_model_mock.dart';
import 'widgets/onboarding_card.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = MockOnboardingData.getOnboardingData();

    return OnboardingPageView(data: data);
  }
}

class MockDataService {}

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({required this.data, super.key});

  final List<OnboardingModel> data;

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final _pageController = PageController();
  late final _itemCount = widget.data.length;

  bool _isLastPage = false;

  final _dotDecoration = DotDecoration(
    height: 2,
    width: 32,
    borderRadius: BorderRadius.circular(DefaultSizes.xSmall),
  );

  @override
  void initState() {
    _pageController.addListener(_listener);

    super.initState();
  }

  int get _currentPage => (_pageController.page ?? 0).round();

  void _listener() {
    final isLastPage = _currentPage == _itemCount - 1;

    if (isLastPage != _isLastPage) {
      setState(() {
        _isLastPage = isLastPage;
      });
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.deepPurpleA50,
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.data[index];

          return OnboardingCard(
            title: item.title,
            description: item.description,
            imageUrl: item.imageUrl,
          );
        },
        itemCount: _itemCount,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(DefaultSizes.large),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: DefaultSizes.large,
            children: [
              Center(child: _buildPageIndicator()),
              ContinueButton(
                isLastPage: _isLastPage,
                pageController: _pageController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return SmoothPageIndicator(
      count: _itemCount,
      controller: _pageController,
      effect: CustomizableEffect(
        spacing: DefaultSizes.xxSmall,
        inActiveColorOverride: (index) {
          if (index < _currentPage) {
            return ThemeColors.deepPurpleA20002;
          }

          return ThemeColors.whiteA70001;
        },
        dotDecoration: _dotDecoration,
        activeDotDecoration: _dotDecoration.copyWith(
          color: ThemeColors.deepPurpleA20002,
        ),
      ),
    );
  }
}

class ContinueButton extends ConsumerWidget {
  final bool isLastPage;
  final PageController pageController;
  const ContinueButton({
    super.key,
    required this.isLastPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSwitcher(
      duration: 300.ms,
      child:
          isLastPage
              ? AppAccentButton.primary(
                text: t.start_title,
                onTapped: () {
                  ref.read(appStorageProvider).setFirstEnter();
                  context.replaceRoute(const SignInRoute());
                },
              )
              : AppAccentButton.white(
                text: 'Продолжить',
                onTapped: () {
                  pageController.nextPage(duration: 300.ms, curve: Curves.ease);
                },
              ),
    );
  }
}
