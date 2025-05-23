import 'package:VOX/core/routes/app_router.dart';
import 'package:VOX/providers/authorize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vox_ui_kit/vox_ui_kit.dart' as uiKit;
import 'package:vox_uikit/main.dart';

class CustomersApp extends ConsumerStatefulWidget {
  const CustomersApp({super.key});

  @override
  ConsumerState createState() => _CustomersAppState();
}

class _CustomersAppState extends ConsumerState<CustomersApp> {
  final reevaluateListenable = ValueNotifier<AuthorizeState>(
    const AuthorizeState.initial(),
  );
  @override
  void dispose() {
    reevaluateListenable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authorizeNotifierProvider, (_, value) {
      reevaluateListenable.value = value;
    });

    return MaterialApp.router(
      routerConfig: ref
          .read(appRouterServiceProvider)
          .router
          .config(reevaluateListenable: reevaluateListenable),
      locale:
          uiKit.TranslationProvider.of(context).flutterLocale, // use provider
      supportedLocales: uiKit.AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      title: uiKit.t.app_title,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
