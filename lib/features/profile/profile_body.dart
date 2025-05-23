import 'dart:io';

import 'package:VOX/core/utils/format_phone.dart';
import 'package:VOX/domain/city.dart';
import 'package:VOX/domain/country.dart';
import 'package:VOX/domain/profile.dart';
import 'package:VOX/providers/authorize.dart';
import 'package:VOX/providers/city_provider.dart';
import 'package:VOX/providers/current_country.dart';
import 'package:VOX/providers/profile_service.dart';
import 'package:VOX/widgets/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vox_ui_kit/gen/assets.gen.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';
import 'package:vox_ui_kit/theme/app_button_theme.dart';
import 'package:vox_ui_kit/widgets/dropdowns/app_dropdown.dart';
import 'package:vox_ui_kit/widgets/fields/app_text_field.dart';

class ProfileBody extends ConsumerStatefulWidget {
  const ProfileBody({super.key});

  @override
  ConsumerState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends ConsumerState<ProfileBody> {
  final nameTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final cityTextController = TextEditingController();
  final cityController = ValueNotifier<City?>(null);
  final urlTextController = TextEditingController();

  final isNameValid = ValueNotifier(false);
  final isPhoneValid = ValueNotifier(false);

  late final mergedValidators = Listenable.merge([isNameValid, isPhoneValid]);

  final enabledController = ValueNotifier(true);

  final loadingController = ValueNotifier(false);

  bool get isDisabled => !isNameValid.value || !isPhoneValid.value;

  Profile? profile;
  final russiaFormatter = MaskTextInputFormatter(
    mask: '+7 (###)-###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  final armeniaMaskFormatter = MaskTextInputFormatter(
    mask: '+374 (##)-##-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  final belarusMaskFormatter = MaskTextInputFormatter(
    mask: '+375 (##)-###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  final kazakhstanMaskFormatter = MaskTextInputFormatter(
    mask: '+7 (###)-###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  final kyrgyzstanMaskFormatter = MaskTextInputFormatter(
    mask: '+996 (###)-##-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final _tooltipController = OverlayPortalController();
  final link = LayerLink();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tooltipController.show();
      final state = ref.read(profileNotifierProvider);
      switch (state.value) {
        case ProfileLoaded profile:
          updateValues(profile);
        default:
          break;
      }
    });
    super.initState();
  }

  void updateValues(ProfileLoaded value) {
    loadingController.value = false;
    cityTextController.text = value.profile.city ?? 'Москва';
    nameTextController.text = value.profile.name ?? '';
    phoneTextController.text =
        formatPhone(
          value.profile.phone ?? '',
          ref.read(currentCountryProvider),
        ) ??
        '';
    isPhoneValid.value = phoneTextController.text.isNotEmpty;
    isNameValid.value = nameTextController.text.isNotEmpty;
    urlTextController.text = value.profile.urlPath ?? '';
    profile = value.profile;
  }

  @override
  void dispose() {
    _tooltipController.hide();
    cityController.dispose();
    loadingController.dispose();
    enabledController.dispose();
    urlTextController.dispose();
    isNameValid.dispose();
    isPhoneValid.dispose();
    nameTextController.dispose();
    phoneTextController.dispose();
    cityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttonThemes = Theme.of(context).extension<AppButtonTheme>();
    ref.listen(currentCityProvider, (_, next) {
      cityController.value = next;
      cityTextController.text = cityController.value?.name ?? '-';
    });
    final country = ref.watch(currentCountryProvider);
    ref.listen(profileNotifierProvider, (prev, next) {
      switch (next.value) {
        case ProfileError error:
          loadingController.value = false;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.error)));
          break;
        case ProfileLoaded loaded:
          updateValues(loaded);
          break;
        case null:
          loadingController.value = false;
          break;
        case ProfileIdle():
          loadingController.value = false;
          break;
        case ProfileLoading():
          loadingController.value = true;
          break;
        case ProfileDeleted():
          ref.read(authorizeNotifierProvider.notifier).logout();
      }
    });

    return ListenableBuilder(
      listenable: loadingController,
      builder: (_, _) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 20),
                sliver: SliverToBoxAdapter(
                  child: ListenableBuilder(
                    listenable: urlTextController,
                    builder: (_, _) {
                      final Widget child;

                      if (urlTextController.text.isEmpty) {
                        child = InkWell(
                          onTap:
                              loadingController.value
                                  ? null
                                  : () async {
                                    final imagePicker = ImagePicker();
                                    final photo = await imagePicker.pickImage(
                                      source: ImageSource.gallery,
                                    );
                                    if (photo?.path == null) return;
                                    urlTextController.text = photo!.path;
                                  },
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: CircleAvatar(
                              minRadius: 40,
                              maxRadius: 80,
                              backgroundColor: const Color(0xFFE2E4E9),
                              child: LayoutBuilder(
                                builder: (_, c) {
                                  return Stack(
                                    children: [
                                      Center(
                                        child: Assets.icons.photo.image(
                                          width: 28,
                                          height: 28,
                                          package: 'vox_ui_kit',
                                        ),
                                      ),
                                      Align(
                                        alignment: const Alignment(0.0, 1.3),
                                        child: SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: Material(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            color: const Color(0xFF914DFF),
                                            clipBehavior: Clip.hardEdge,
                                            child: const Icon(
                                              CupertinoIcons.add,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      } else {
                        child = CircleAvatar(
                          minRadius: 40,
                          backgroundImage:
                              Image.file(
                                File(urlTextController.text),
                                fit: BoxFit.cover,
                              ).image,
                        );
                      }
                      return child;
                    },
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.only(bottom: 16),
                sliver: SliverToBoxAdapter(
                  child: AppTextField(
                    enabled: !loadingController.value,
                    labelText: t.name_field_label,
                    hintText: 'Петр',
                    controller: nameTextController,
                    validator: (value) {
                      isNameValid.value = !(value == null || value.isEmpty);
                      if (!isNameValid.value) {
                        return t.field_required_error;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 16),
                sliver: SliverToBoxAdapter(
                  child: AppTextField(
                    enabled: !loadingController.value,
                    keyboardType: TextInputType.phone,
                    labelText: t.phone_field_label,

                    inputFormatters: switch (country) {
                      RU _ => [russiaFormatter],

                      KZ _ => [kazakhstanMaskFormatter],

                      BY _ => [belarusMaskFormatter],

                      AM _ => [armeniaMaskFormatter],

                      KG _ => [kyrgyzstanMaskFormatter],
                    },

                    hintText: switch (country) {
                      RU _ => '+7 (999) 999-99-99',

                      KZ _ => '+7 (999) 999-99-99',

                      BY _ => '+375 (99) 999-99-99',

                      AM _ => '+374 (99) 999-99-99',

                      KG _ => '+996 (99) 999-99-99',
                    },
                    controller: phoneTextController,
                    validator: (value) {
                      isPhoneValid.value = !(value == null || value.isEmpty);
                      if (!isPhoneValid.value) {
                        return t.field_required_error;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 16),
                sliver: SliverToBoxAdapter(
                  child: AppDropdown(
                    controller: cityTextController,
                    onTap: () => AdaptiveDialog.showModalCountries(context),

                    labelText: t.city_label,
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 16,
                      children: [
                        ElevatedButton(
                          style:
                              buttonThemes?.primaryElevatedButtonTheme?.style,
                          onPressed: () {},
                          child: Text(t.delete_account_title),
                        ),

                        ElevatedButton(
                          style:
                              buttonThemes?.primaryElevatedButtonTheme?.style,
                          onPressed: () {},
                          child: Text(t.save_button_title),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
