// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:VOX/domain/address.dart' as _i19;
import 'package:VOX/domain/pet_type.dart' as _i20;
import 'package:VOX/features/addreses/addreses_screen.dart' as _i1;
import 'package:VOX/features/beginning/presentation/pages/auth/code_screen.dart'
    as _i5;
import 'package:VOX/features/beginning/presentation/pages/auth/privacy_policy/privacy_policy_screen.dart'
    as _i10;
import 'package:VOX/features/beginning/presentation/pages/auth/singIn_screen.dart'
    as _i14;
import 'package:VOX/features/beginning/presentation/pages/onboarding_page/onboarding_screen.dart'
    as _i9;
import 'package:VOX/features/blog/blog_screen.dart' as _i3;
import 'package:VOX/features/chats/chats_screen.dart' as _i4;
import 'package:VOX/features/health/health_screen.dart' as _i7;
import 'package:VOX/features/home/dashboard_screen.dart' as _i6;
import 'package:VOX/features/home/presentation/services/services_screen.dart'
    as _i12;
import 'package:VOX/features/information/information_screen.dart' as _i8;
import 'package:VOX/features/new_address/address_screen.dart' as _i2;
import 'package:VOX/features/profile/profile_screen.dart' as _i11;
import 'package:VOX/features/settings/settings_screen.dart' as _i13;
import 'package:VOX/features/subscription/subscription_screen.dart' as _i15;
import 'package:VOX/features/walk/walk_screen.dart' as _i16;

/// generated route for
/// [_i1.AddresesScreen]
class AddresesRoute extends _i17.PageRouteInfo<void> {
  const AddresesRoute({List<_i17.PageRouteInfo>? children})
    : super(AddresesRoute.name, initialChildren: children);

  static const String name = 'AddresesRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddresesScreen();
    },
  );
}

/// generated route for
/// [_i2.AddressScreen]
class AddressRoute extends _i17.PageRouteInfo<AddressRouteArgs> {
  AddressRoute({
    _i18.Key? key,
    _i19.Address? address,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         AddressRoute.name,
         args: AddressRouteArgs(key: key, address: address),
         initialChildren: children,
       );

  static const String name = 'AddressRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddressRouteArgs>(
        orElse: () => const AddressRouteArgs(),
      );
      return _i2.AddressScreen(key: args.key, address: args.address);
    },
  );
}

class AddressRouteArgs {
  const AddressRouteArgs({this.key, this.address});

  final _i18.Key? key;

  final _i19.Address? address;

  @override
  String toString() {
    return 'AddressRouteArgs{key: $key, address: $address}';
  }
}

/// generated route for
/// [_i3.BlogScreen]
class BlogRoute extends _i17.PageRouteInfo<void> {
  const BlogRoute({List<_i17.PageRouteInfo>? children})
    : super(BlogRoute.name, initialChildren: children);

  static const String name = 'BlogRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i3.BlogScreen();
    },
  );
}

/// generated route for
/// [_i4.ChatsScreen]
class ChatsRoute extends _i17.PageRouteInfo<void> {
  const ChatsRoute({List<_i17.PageRouteInfo>? children})
    : super(ChatsRoute.name, initialChildren: children);

  static const String name = 'ChatsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i4.ChatsScreen();
    },
  );
}

/// generated route for
/// [_i5.CodeScreen]
class CodeRoute extends _i17.PageRouteInfo<CodeRouteArgs> {
  CodeRoute({
    _i18.Key? key,
    required String phoneNumber,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         CodeRoute.name,
         args: CodeRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'CodeRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CodeRouteArgs>();
      return _i5.CodeScreen(key: args.key, phoneNumber: args.phoneNumber);
    },
  );
}

class CodeRouteArgs {
  const CodeRouteArgs({this.key, required this.phoneNumber});

  final _i18.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'CodeRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i6.DashboardScreen]
class DashboardRoute extends _i17.PageRouteInfo<void> {
  const DashboardRoute({List<_i17.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i6.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i7.HealthScreen]
class HealthRoute extends _i17.PageRouteInfo<void> {
  const HealthRoute({List<_i17.PageRouteInfo>? children})
    : super(HealthRoute.name, initialChildren: children);

  static const String name = 'HealthRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i7.HealthScreen();
    },
  );
}

/// generated route for
/// [_i8.InformationScreen]
class InformationRoute extends _i17.PageRouteInfo<void> {
  const InformationRoute({List<_i17.PageRouteInfo>? children})
    : super(InformationRoute.name, initialChildren: children);

  static const String name = 'InformationRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i8.InformationScreen();
    },
  );
}

/// generated route for
/// [_i9.OnboardingScreen]
class OnboardingRoute extends _i17.PageRouteInfo<void> {
  const OnboardingRoute({List<_i17.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i9.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i10.PolicyScreen]
class PolicyRoute extends _i17.PageRouteInfo<void> {
  const PolicyRoute({List<_i17.PageRouteInfo>? children})
    : super(PolicyRoute.name, initialChildren: children);

  static const String name = 'PolicyRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i10.PolicyScreen();
    },
  );
}

/// generated route for
/// [_i11.ProfileScreen]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute({List<_i17.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i11.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i12.ServicesScreen]
class ServicesRoute extends _i17.PageRouteInfo<void> {
  const ServicesRoute({List<_i17.PageRouteInfo>? children})
    : super(ServicesRoute.name, initialChildren: children);

  static const String name = 'ServicesRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i12.ServicesScreen();
    },
  );
}

/// generated route for
/// [_i13.SettingsScreen]
class SettingsRoute extends _i17.PageRouteInfo<void> {
  const SettingsRoute({List<_i17.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i13.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i14.SignInScreen]
class SignInRoute extends _i17.PageRouteInfo<void> {
  const SignInRoute({List<_i17.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i14.SignInScreen();
    },
  );
}

/// generated route for
/// [_i15.SubscriptionScreen]
class SubscriptionRoute extends _i17.PageRouteInfo<void> {
  const SubscriptionRoute({List<_i17.PageRouteInfo>? children})
    : super(SubscriptionRoute.name, initialChildren: children);

  static const String name = 'SubscriptionRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i15.SubscriptionScreen();
    },
  );
}

/// generated route for
/// [_i16.WalkScreen]
class WalkRoute extends _i17.PageRouteInfo<WalkRouteArgs> {
  WalkRoute({
    _i18.Key? key,
    required _i20.PetType petType,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         WalkRoute.name,
         args: WalkRouteArgs(key: key, petType: petType),
         initialChildren: children,
       );

  static const String name = 'WalkRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WalkRouteArgs>();
      return _i16.WalkScreen(key: args.key, petType: args.petType);
    },
  );
}

class WalkRouteArgs {
  const WalkRouteArgs({this.key, required this.petType});

  final _i18.Key? key;

  final _i20.PetType petType;

  @override
  String toString() {
    return 'WalkRouteArgs{key: $key, petType: $petType}';
  }
}
