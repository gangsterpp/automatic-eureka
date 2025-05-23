import 'package:VOX/core/routes/app_router.gr.dart';
import 'package:VOX/providers/app_storage.dart';
import 'package:VOX/providers/authorize.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  final Ref ref;
  AppRouter({required super.navigatorKey, required this.ref});
  @override
  RouteType get defaultRouteType => const RouteType.adaptive(opaque: false); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    AutoRoute.guarded(
      page: OnboardingRoute.page,
      initial: true,
      onNavigation: (resolver, router) async {
        final isFirstEnter = await ref.read(appStorageProvider).isFirstEnter();

        if (isFirstEnter) {
          return resolver.next();
        } else if (router.currentPath != '/signIn') {
          await router.push(const SignInRoute());
        } else {
          return resolver.next();
        }
      },
    ),
    AutoRoute.guarded(
      page: SignInRoute.page,
      path: '/signIn',
      onNavigation: (resolver, router) async {
        switch (ref.read(authorizeNotifierProvider)) {
          case Authorized _
              when (router.currentPath == '/' ||
                  router.currentPath == '/signIn'):
            await router.push(const DashboardRoute());

            break;

          default:
            return resolver.next();
        }
      },
    ),

    AutoRoute.guarded(
      page: DashboardRoute.page,
      children: [
        AutoRoute(page: BlogRoute.page, path: 'blog'),
        AutoRoute(page: ChatsRoute.page, path: 'chats'),
        AutoRoute(page: ServicesRoute.page, path: 'services', initial: true),
        AutoRoute(page: SubscriptionRoute.page, path: 'subscription'),
        AutoRoute(page: HealthRoute.page, path: 'health'),
      ],
      onNavigation: (NavigationResolver resolver, StackRouter router) async {
        switch (ref.read(authorizeNotifierProvider)) {
          case Unauthorized _:
            await router.push(const SignInRoute());

            break;
          default:
            return resolver.next();
        }
      },
    ),
    AutoRoute(page: InformationRoute.page, path: '/information'),
    AutoRoute(page: ProfileRoute.page, path: '/profile'),
    AutoRoute(page: AddresesRoute.page, path: '/my-addreses'),
    AutoRoute(page: AddressRoute.page, path: '/address'),
    AutoRoute(page: WalkRoute.page, path: '/walk'),
    AutoRoute(page: SettingsRoute.page, path: '/settings'),
  ];
}

@riverpod
AppRouterService appRouterService(Ref ref) => AppRouterService(ref);

base class AppRouterService {
  final Ref _ref;
  const AppRouterService(this._ref);
  AppRouter get router => AppRouter(ref: _ref, navigatorKey: GlobalKey());
}
