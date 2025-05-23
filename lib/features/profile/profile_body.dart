import 'package:VOX/core/utils/format_phone.dart';
import 'package:VOX/domain/city.dart';
import 'package:VOX/domain/country.dart';
import 'package:VOX/domain/profile.dart';
import 'package:VOX/providers/authorize.dart';
import 'package:VOX/providers/city_provider.dart';
import 'package:VOX/providers/current_country.dart';
import 'package:VOX/providers/profile_service.dart';
import 'package:VOX/widgets/profile/city_selection.dart';
import 'package:VOX/widgets/profile/gender_selection.dart';
import 'package:VOX/widgets/profile/local_circle_avatar.dart';
import 'package:VOX/widgets/profile/phone_number_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vox_uikit/buttons/app_accent_button.dart';
import 'package:vox_uikit/inputs/text_field_widget.dart';

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
    ref.listen(currentCityProvider, (_, next) {
      cityController.value = next;
      cityTextController.text = cityController.value?.name ?? '';
    });

    final Country country = ref.watch(currentCountryProvider);

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
      builder: (_, __) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      sliver: SliverToBoxAdapter(
                        child: LocalCircleAvatar(onAvatarTap: () {}),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(bottom: 16),
                      sliver: SliverToBoxAdapter(
                        child: TextFieldWidget(
                          hint: 'Имя',
                          title: 'Имя',
                          controller: nameTextController,
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(bottom: 16),
                      sliver: SliverToBoxAdapter(
                        child: GenderSelector(
                          selectedGender:
                              ref
                                  .watch(profileNotifierProvider)
                                  .value
                                  ?.value
                                  ?.userGender ??
                              UserGender.female,
                          onChanged:
                              ref
                                  .read(profileNotifierProvider.notifier)
                                  .changeGender,
                        ),
                      ),
                    ),
                    const SliverPadding(
                      padding: EdgeInsets.only(bottom: 16),
                      sliver: SliverToBoxAdapter(child: PhoneNumberSelection()),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(bottom: 16),
                      sliver: SliverToBoxAdapter(
                        child: CitySelection(
                          cityTextController: cityTextController,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: AppAccentButton.primary(
                    isDisabled: isDisabled,
                    text: 'Сохранить',
                    onTapped: () {
                      ref
                          .read(profileNotifierProvider.notifier)
                          .updateProfile(
                            Profile(
                              urlPath: '',
                              name: nameTextController.text,
                              phone: phoneTextController.text,
                              city: cityTextController.text,
                              userGender:
                                  ref
                                      .watch(profileNotifierProvider)
                                      .value
                                      ?.value
                                      ?.userGender,
                            ),
                          );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    //       SliverPadding(
    //         padding: const EdgeInsets.only(bottom: 16),
    //         sliver: SliverToBoxAdapter(
    //           child: AppTextField(
    //             enabled: !loadingController.value,
    //             keyboardType: TextInputType.phone,
    //             labelText: t.phone_field_label,
    //             inputFormatters: switch (country) {
    //               RU _ => [russiaFormatter],

    //               KZ _ => [kazakhstanMaskFormatter],

    //               BY _ => [belarusMaskFormatter],

    //               AM _ => [armeniaMaskFormatter],

    //               KG _ => [kyrgyzstanMaskFormatter],
    //             },

    //             hintText: switch (country) {
    //               RU _ => '+7 (999) 999-99-99',

    //               KZ _ => '+7 (999) 999-99-99',

    //               BY _ => '+375 (99) 999-99-99',

    //               AM _ => '+374 (99) 999-99-99',

    //               KG _ => '+996 (99) 999-99-99',
    //             },
    //             controller: phoneTextController,
    //             validator: (value) {
    //               isPhoneValid.value = !(value == null || value.isEmpty);
    //               if (!isPhoneValid.value) {
    //                 return t.field_required_error;
    //               }
    //               return null;
    //             },
    //           ),
    //         ),
    //       ),
  }
}
