import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vox_ui_kit/core/theme/styles.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    required this.title,
    required this.imageUrl,
    this.description,
    super.key,
  });

  final String title;
  final String imageUrl;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child:
                  Image.asset(
                        imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                        package: 'vox_ui_kit',
                        errorBuilder: (context, url, error) {
                          return const SizedBox();
                        },
                      )
                      .animate(delay: 100.ms)
                      .slideY(begin: 0.2, curve: Curves.ease)
                      .fade(),
            ),
            Text(
                  title,
                  textAlign: TextAlign.center,
                  style: ThemeStyles.s18h600(),
                )
                .animate(delay: 300.ms)
                .slideY(begin: 0.1, curve: Curves.ease)
                .fade(),
            const SizedBox(height: 8),
            if (description != null)
              Text(
                    description!,
                    textAlign: TextAlign.center,
                    style: ThemeStyles.s14h500(),
                  )
                  .animate(delay: 600.ms)
                  .slideY(begin: 0.3, curve: Curves.ease)
                  .fade(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
