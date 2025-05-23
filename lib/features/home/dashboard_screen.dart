import 'dart:io';

import 'package:VOX/core/routes/app_router.gr.dart';
import 'package:VOX/providers/authorize.dart';
import 'package:VOX/providers/profile_service.dart';
import 'package:VOX/widgets/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vox_ui_kit/vox_ui_kit.dart';
import 'package:vox_uikit/dev_screen.dart';

@RoutePage()
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final _selectedIndex = ValueNotifier(2);
  final _routes = [
    const BlogRoute(),
    const ChatsRoute(),
    const ServicesRoute(),
    const SubscriptionRoute(),
    const HealthRoute(),
  ];
  final _imageListener = ValueNotifier<XFile?>(null);

  Widget profileAvatar(PorfileState? state) {
    if (state is! ProfileLoaded) {
      return Assets.icons.addPhoto.image(
        width: 48,
        height: 48,
        package: 'vox_ui_kit',
      );
    }
    if (state.profile.urlPath == null) {
      return Assets.icons.addPhoto.image(
        width: 48,
        height: 48,
        package: 'vox_ui_kit',
      );
    }
    return CircleAvatar(
      backgroundImage:
          Image.file(
            File(state.profile.urlPath!),
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ).image,
    );
  }

  @override
  void dispose() {
    _imageListener.dispose();
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final profile = ref.watch(profileNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(
                    top: height / 40,
                    left: width / 18.25,
                  ),
                  children: [
                    ListTile(
                      title: AppText(
                        '${t.hello_user_title}\n${profile.value?.value?.name ?? 'Екатерина'}',
                        type: AppTextType.w400s14h20,
                      ),
                      leading: profileAvatar(profile.value),
                      onTap: () => context.pushRoute(const ProfileRoute()),
                      titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF0B0C0E),
                      ),
                      trailing: const Icon(
                        CupertinoIcons.chevron_right,
                        color: Color(0xFF81899C),
                        size: 16,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListTile(
                      title: Text(t.pets_title),
                      onTap: () {},
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      trailing: const Icon(
                        CupertinoIcons.chevron_right,
                        color: Color(0xFF81899C),
                        size: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListTile(
                      title: Text(t.my_addresses_title),
                      onTap: () {
                        context.pushRoute(const AddresesRoute());
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      trailing: const Icon(
                        CupertinoIcons.chevron_right,
                        color: Color(0xFF81899C),
                        size: 16,
                      ),
                    ),
                    const SizedBox(height: 8),

                    ListTile(
                      title: Text(t.my_subscriptions_title),
                      onTap: () {},
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: SizedBox(
                          width: 43,
                          height: 26,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: primaryColors.shade500,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                spacing: 2,
                                children: [
                                  const Text(
                                    '2',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 14 / 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    Assets.images.temp.paw,
                                    width: 14,
                                    height: 12,
                                    package: 'vox_ui_kit',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListTile(
                      title: Text(t.orders_history_title),
                      onTap: () {},
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      trailing: const Icon(
                        CupertinoIcons.chevron_right,
                        color: Color(0xFF81899C),
                        size: 16,
                      ),
                    ),

                    const SizedBox(height: 8),
                    ListTile(
                      title: Text(t.info_title),
                      onTap: () {
                        context.pushRoute(const InformationRoute());
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      trailing: const Icon(
                        CupertinoIcons.chevron_right,
                        color: Color(0xFF81899C),
                        size: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListTile(
                      title: const Text('Настройки'),
                      onTap: () {
                        context.pushRoute(const InformationRoute());
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      trailing: const Icon(
                        CupertinoIcons.chevron_right,
                        color: Color(0xFF81899C),
                        size: 16,
                      ),
                    ),
                    Builder(
                      builder:
                          (c) => ListTile(
                            onTap: () {
                              Scaffold.of(c).closeDrawer();
                              AdaptiveDialog.showModalBottomSheetLogOut(c, () {
                                ref
                                    .read(profileNotifierProvider.notifier)
                                    .deleteProfile()
                                    .whenComplete(
                                      ref
                                          .read(
                                            authorizeNotifierProvider.notifier,
                                          )
                                          .logout,
                                    );
                              });
                            },
                            title: Text(
                              t.logout_title,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: primaryColors.shade500,
                              ),
                            ),
                          ),
                    ),

                    if (kDebugMode) ...[
                      const SizedBox(height: 8),
                      ListTile(
                        title: const Text('Экранчик'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DevScreen(),
                            ),
                          );
                        },
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        trailing: const Icon(
                          CupertinoIcons.chevron_right,
                          color: Color(0xFF81899C),
                          size: 16,
                        ),
                      ),
                    ],

                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Text(
                        t.socials_footer_title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              launchUrl(
                                Uri.parse('https://vk.com/voxfordogs'),
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            icon: Assets.images.socials.vk.image(
                              height: 28,
                              width: 28,
                              package: 'vox_ui_kit',
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              launchUrl(
                                Uri.parse('https://t.me/voxfordogs'),
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            icon: Assets.images.socials.tg.image(
                              height: 28,
                              width: 28,
                              package: 'vox_ui_kit',
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              launchUrl(
                                Uri.parse(
                                  'https://www.instagram.com/accounts/login/?next=https%3A%2F%2Fwww.instagram.com%2Fvoxfordogs%2F&is_from_rle',
                                ),
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            icon: Assets.images.socials.inst.image(
                              height: 28,
                              width: 28,
                              package: 'vox_ui_kit',
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              launchUrl(
                                Uri.parse(
                                  'https://www.youtube.com/@Voxfordogs_bot',
                                ),
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            icon: Assets.images.socials.ut.image(
                              height: 28,
                              width: 28,
                              package: 'vox_ui_kit',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width / 18.25),
                child: FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (c, a) {
                    final buffer = StringBuffer();
                    buffer.write(a.data?.version ?? '-');
                    buffer.write('+');
                    buffer.write(a.data?.buildNumber ?? '-');

                    return AppText(
                      'Версия: $buffer',
                      type: AppTextType.w400s12h14,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: const AutoRouter(),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (_, value, _) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            currentIndex: value,
            onTap: (value) {
              if (_selectedIndex.value == value) return;
              context.replaceRoute(_routes[value]);
              _selectedIndex.value = value;
            },
            items: [
              BottomNavigationBarItem(
                activeIcon: Assets.icons.newsIcon.image(
                  package: 'vox_ui_kit',
                  width: 24,
                  height: 24,
                  color: primaryColors.shade500,
                ),
                icon: Assets.icons.newsIcon.image(
                  package: 'vox_ui_kit',
                  width: 24,
                  height: 24,
                ),
                label: t.blog_tab_title,
              ),
              BottomNavigationBarItem(
                activeIcon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Assets.icons.message.image(
                      package: 'vox_ui_kit',
                      width: 24,
                      height: 24,
                      color: primaryColors.shade500,
                    ),
                    Positioned(
                      top: -6,
                      right: -15,
                      child: Container(
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              secondaryColors.shade300,
                              secondaryColors.shade500,
                            ],
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: AppText(
                            '123',
                            type: AppTextType.w500s14,
                            color: whiteColors,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Assets.icons.message.image(
                      package: 'vox_ui_kit',
                      width: 24,
                      height: 24,
                    ),
                    Positioned(
                      top: -6,
                      right: -15,
                      child: Container(
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              secondaryColors.shade300,
                              secondaryColors.shade500,
                            ],
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: AppText(
                            '123',
                            type: AppTextType.w500s14,
                            color: whiteColors,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                label: t.chat_tab_title,
              ),
              BottomNavigationBarItem(
                activeIcon: Assets.icons.menuSquareIcon.image(
                  package: 'vox_ui_kit',
                  width: 24,
                  height: 24,
                  color: primaryColors.shade500,
                ),
                icon: Assets.icons.menuSquareIcon.image(
                  package: 'vox_ui_kit',
                  width: 24,
                  height: 24,
                ),
                label: t.services_tab_title,
              ),
              BottomNavigationBarItem(
                activeIcon: Assets.icons.iconPaw.image(
                  package: 'vox_ui_kit',
                  width: 24,
                  height: 24,
                  color: primaryColors.shade500,
                ),
                icon: Assets.icons.iconPaw.image(
                  package: 'vox_ui_kit',
                  width: 24,
                  height: 24,
                ),
                label: t.subscription_tab_title,
              ),
              BottomNavigationBarItem(
                activeIcon: Assets.icons.healthIcon.image(
                  package: 'vox_ui_kit',
                  width: 24,
                  height: 24,
                  color: primaryColors.shade500,
                ),
                icon: Assets.icons.healthIcon.image(
                  package: 'vox_ui_kit',
                  width: 24,
                  height: 24,
                ),
                label: t.health_tab_title,
              ),
            ],
          );
        },
      ),
    );
  }
}
