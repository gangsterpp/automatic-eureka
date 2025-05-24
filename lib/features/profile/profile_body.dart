import 'dart:developer';
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
    final String prefix = ref.read(currentCountryProvider).dialCode;
    final String phoneNumber =
        ref.read(profileNotifierProvider).value?.value?.phone ?? '';
    phoneTextController.text = '$prefix $phoneNumber';
    isPhoneValid.value = phoneTextController.text.isNotEmpty;
    isNameValid.value = nameTextController.text.isNotEmpty;
    urlTextController.text = value.profile.urlPath ?? '';
    profile = value.profile;
  }

  void updatePhoneNumberController() {
    phoneTextController.clear();
    final String prefix = ref.read(currentCountryProvider).dialCode;
    phoneTextController.text = prefix;
  }

  String getFormattedPhoneNumberForSave({
    required TextEditingController phoneController,
    required Country country,
  }) {
    final String dial = country.dialCode;
    String raw = phoneController.text.trim();

    if (raw.startsWith(dial)) {
      raw = raw.substring(dial.length).trimLeft();
      return raw;
    }

    final String dialNoPlus = dial.startsWith('+') ? dial.substring(1) : dial;

    if (raw.startsWith(dialNoPlus)) {
      return raw.substring(dialNoPlus.length);
    }

    return raw;
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
    log(
      ref.watch(profileNotifierProvider).value?.value?.toJson().toString() ??
          '',
    );
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
                          onChanged:
                              ref
                                  .read(profileNotifierProvider.notifier)
                                  .onUsernameChanged,
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
                    SliverPadding(
                      padding: const EdgeInsets.only(bottom: 16),
                      sliver: SliverToBoxAdapter(
                        child: PhoneNumberSelection(
                          onChanged:
                              ref
                                  .read(profileNotifierProvider.notifier)
                                  .onPhoneNumberChanged,
                          onCountryChanged: updatePhoneNumberController,
                          textEditingController: phoneTextController,
                        ),
                      ),
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
                    text: 'Сохранить',
                    onTapped: () {
                      ref
                          .read(profileNotifierProvider.notifier)
                          .updateProfile(
                            Profile(
                              urlPath: '',
                              name: nameTextController.text,
                              countryCode: country,
                              phone: getFormattedPhoneNumberForSave(
                                country: country,
                                phoneController: phoneTextController,
                              ),
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
  }
}
