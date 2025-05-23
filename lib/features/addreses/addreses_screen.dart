import 'package:VOX/core/routes/app_router.gr.dart';
import 'package:VOX/domain/address.dart';
import 'package:VOX/providers/addresses_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vox_ui_kit/vox_ui_kit.dart';
import 'package:vox_uikit/main.dart';

@RoutePage()
class AddresesScreen extends ConsumerWidget {
  const AddresesScreen({super.key});

  void onTap(BuildContext context) {
    context.pushRoute(AddressRoute());
  }

  void onTapSelected(BuildContext context, Address address) {
    context.pushRoute(AddressRoute(address: address));
  }

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Адреса'),
      body: switch (ref.watch(addressNotifierProvider).value) {
        AddressLoading _ => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),

        AddressError error => Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppText(
              error.error,
              type: AppTextType.w70020s28H,
              textAlign: TextAlign.center,
              color: grayColors.shade300,
            ),
          ),
        ),

        AddressLoaded loaded when loaded.addresses.isNotEmpty => Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverList.builder(
                  itemBuilder:
                      (_, i) => Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          ListTile(
                            onTap:
                                () =>
                                    onTapSelected(context, loaded.addresses[i]),
                            title: Text(
                              loaded.addresses[i].name ?? '',
                              style: AppTextStyles.s16h20w500$BodyM,
                            ),
                            subtitle: Text(
                              'ул. ${loaded.addresses[i].street ?? ''} ${loaded.addresses[i].home ?? ''}',
                              style: AppTextStyles.s14h20w600$ButtonM.copyWith(
                                color: AppColors.gray300,
                              ),
                            ),

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),

                            trailing: Image.asset(
                              'assets/edit_icon.png',
                              color: const Color(0xFF81899C),
                              width: 24,
                              height: 24,
                            ),
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFF1F2F4),
                          ),
                        ],
                      ),
                  itemCount: loaded.addresses.length,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                minimum: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 46,
                ),
                child: LayoutBuilder(
                  builder: (_, c) {
                    return SizedBox(
                      width: c.maxWidth,
                      child: AppAccentButton.primary(
                        onTapped: () => onTap(context),
                        text: t.add_address_button_title,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        AddressUpdated updated when updated.addresses.isNotEmpty => Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverList.builder(
                  itemBuilder:
                      (_, i) => Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          ListTile(
                            onTap:
                                () => onTapSelected(
                                  context,
                                  updated.addresses[i],
                                ),
                            title: Text(
                              updated.addresses[i].name ?? '',
                              style: AppTextStyles.s16h20w500$BodyM,
                            ),
                            subtitle: Text(
                              'ул. ${updated.addresses[i].street ?? ''} ${updated.addresses[i].home ?? ''}',
                              style: AppTextStyles.s14h20w600$ButtonM.copyWith(
                                color: AppColors.gray300,
                              ),
                            ),

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),

                            trailing: Image.asset(
                              'assets/edit_icon.png',
                              color: const Color(0xFF81899C),
                              width: 24,
                              height: 24,
                            ),
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFF1F2F4),
                          ),
                        ],
                      ),
                  itemCount: updated.addresses.length,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                minimum: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 46,
                ),
                child: LayoutBuilder(
                  builder: (_, c) {
                    return SizedBox(
                      width: c.maxWidth,
                      child: AppAccentButton.primary(
                        onTapped: () => onTap(context),
                        text: t.add_address_button_title,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        _ => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 164),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  Image.asset('assets/3d_sticker.png', width: 100, height: 100),
                  AppText(
                    t.no_addresses_text_title,
                    type: AppTextType.w70020s28H,
                    textAlign: TextAlign.center,
                    color: grayColors.shade300,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                minimum: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 46,
                ),
                child: LayoutBuilder(
                  builder: (_, c) {
                    return SizedBox(
                      width: c.maxWidth,
                      child: AppAccentButton.primary(
                        onTapped: () => onTap(context),
                        text: t.add_address_button_title,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      },
    );
  }
}
