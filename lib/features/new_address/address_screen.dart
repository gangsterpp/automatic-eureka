import 'package:VOX/domain/address.dart';
import 'package:VOX/providers/addresses_service.dart';
import 'package:VOX/providers/city_provider.dart';
import 'package:VOX/widgets/dropdown_textfield_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';
import 'package:vox_uikit/appbar/custom_app_bar_widget.dart';
import 'package:vox_uikit/buttons/app_accent_button.dart';
import 'package:vox_uikit/inputs/text_field_widget.dart';

@RoutePage()
class AddressScreen extends ConsumerStatefulWidget {
  final Address? address;
  const AddressScreen({super.key, this.address});

  @override
  ConsumerState createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends ConsumerState<AddressScreen> {
  final nameAddressController = TextEditingController();
  final cityTextController = TextEditingController();
  final streetController = TextEditingController();
  final houseController = TextEditingController();
  final flatController = TextEditingController();
  final intercomController = TextEditingController();
  final floorController = TextEditingController();
  final nameEstablishmentController = TextEditingController();
  final commentController = TextEditingController();

  final deleteLoadingProgress = ValueNotifier<bool>(false);
  final saveLoadingProgress = ValueNotifier<bool>(false);

  @override
  void initState() {
    saveLoadingProgress.addListener(saveListener);
    deleteLoadingProgress.addListener(deleteListener);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final address = widget.address;
      if (address == null) return;

      nameAddressController.text = address.name ?? '';
      cityTextController.text = address.city ?? '';
      streetController.text = address.street ?? '';
      houseController.text = address.home ?? '';
      flatController.text = address.appartment ?? '';
      intercomController.text = address.intercom ?? '';
      floorController.text = address.floor ?? '';
      nameEstablishmentController.text = address.establishmentName ?? '';
      commentController.text = address.comment ?? '';
    });
  }

  void saveListener() {
    setState(() {});
  }

  void deleteListener() {
    setState(() {});
  }

  @override
  void dispose() {
    deleteLoadingProgress.removeListener(deleteListener);
    saveLoadingProgress.removeListener(saveListener);
    deleteLoadingProgress.dispose();
    saveLoadingProgress.dispose();
    nameAddressController.dispose();
    cityTextController.dispose();
    streetController.dispose();
    houseController.dispose();
    flatController.dispose();
    intercomController.dispose();
    floorController.dispose();
    nameEstablishmentController.dispose();
    commentController.dispose();
    super.dispose();
  }

  bool get isLoading =>
      saveLoadingProgress.value || deleteLoadingProgress.value;

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(addressNotifierProvider);
    ref.listen(addressNotifierProvider, (_, next) {
      switch (next.value) {
        case AddressUpdated _:
          context.pop();
          break;
        default:
          break;
      }
    });
    ref.listen(currentCityProvider, (_, next) {
      cityTextController.text = next?.name ?? '-';
    });
    final address = widget.address;

    return IgnorePointer(
      ignoring: isLoading,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: CustomAppBar(title: t.add_address_title),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 36, right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Flexible(
                      child: TextFieldWidget(
                        title: 'Название адреса',
                        controller: nameAddressController,
                      ),
                    ),

                    DropdownTextFieldWidget(
                      controller: cityTextController,

                      hint: 'Москва',
                      items: const [
                        'Москва',
                        'Санкт-Петербург',
                        'Екатеринбург',
                        'Ростов-на-Дону',
                        'Нижний Новгород',
                        'Краснодар',
                        'Сочи',
                        'Адлер',
                        'Красная Поляна',
                      ],
                      subItems: const [
                        'Москва',
                        'Ленинградская область',
                        'Свердловская область',
                        'Ростовская область',
                        'Нижегородская область',
                        'Краснодарский край',
                        'Краснодарский край',
                        'Краснодарский край',
                        'Краснодарский край',
                      ],
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 64,
                        maxHeight: 64,
                      ),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 12,
                        children: [
                          Flexible(
                            child: TextFieldWidget(
                              title: 'Улица',
                              controller: streetController,
                            ),
                          ),
                          Flexible(
                            child: TextFieldWidget(
                              title: 'Дом',
                              controller: houseController,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 64,
                        maxHeight: 64,
                      ),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 12,
                        children: [
                          Flexible(
                            child: TextFieldWidget(
                              title: 'Домофон',
                              controller: intercomController,
                            ),
                          ),
                          Flexible(
                            child: TextFieldWidget(
                              title: 'Этаж',
                              controller: floorController,
                            ),
                          ),
                          Flexible(
                            child: TextFieldWidget(
                              title: 'Квартира',
                              controller: flatController,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: TextFieldWidget(
                        title: 'Название организации',
                        controller: nameEstablishmentController,
                      ),
                    ),
                    Flexible(
                      child: TextFieldWidget(
                        hint:
                            'Допишите важные детали, например особенности входа',
                        title: 'Комментарий',
                        multiline: true,
                        controller: commentController,
                      ),
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
                        child: ListenableBuilder(
                          listenable: Listenable.merge([
                            streetController,
                            nameAddressController,
                            houseController,
                          ]),
                          child: const Text('Добавить адрес'),
                          builder: (_, child) {
                            final isDisabled =
                                streetController.text.isEmpty ||
                                nameAddressController.text.isEmpty ||
                                houseController.text.isEmpty;

                            if (address != null) {
                              return Row(
                                spacing: c.maxWidth / 31.25,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: AppAccentButton.secondary(
                                      text: t.delete_address_title,
                                      isLoading: deleteLoadingProgress.value,
                                      onTapped: () {
                                        final addresses =
                                            notifier.value?.value ??
                                            <Address>[];
                                        addresses.remove(address);
                                        ref
                                            .read(
                                              addressNotifierProvider.notifier,
                                            )
                                            .updateAddress([...addresses]);
                                        deleteLoadingProgress.value = true;
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: AppAccentButton.primary(
                                      text: 'Изменить',
                                      isLoading: saveLoadingProgress.value,
                                      isDisabled: isDisabled,

                                      onTapped: () {
                                        final addresses =
                                            notifier.value?.value ??
                                            <Address>[];

                                        final index = addresses.indexOf(
                                          address,
                                        );
                                        if (index == -1) return;

                                        final newAddress = Address(
                                          name: nameAddressController.text,
                                          appartment: flatController.text,
                                          city: cityTextController.text,
                                          establishmentName:
                                              nameEstablishmentController.text,
                                          floor: floorController.text,
                                          home: houseController.text,
                                          intercom: intercomController.text,
                                          street: streetController.text,
                                          comment: commentController.text,
                                        );
                                        addresses.removeAt(index);
                                        addresses.insert(index, newAddress);
                                        ref
                                            .read(
                                              addressNotifierProvider.notifier,
                                            )
                                            .updateAddress([...addresses]);
                                        saveLoadingProgress.value = true;
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }

                            return AppAccentButton.primary(
                              text: t.add_address_title,
                              isDisabled: isDisabled,
                              isLoading: saveLoadingProgress.value,
                              onTapped: () {
                                final addresses =
                                    notifier.value?.value ?? <Address>[];
                                addresses.add(
                                  Address(
                                    name: nameAddressController.text,
                                    appartment: flatController.text,
                                    city: cityTextController.text,
                                    establishmentName:
                                        nameEstablishmentController.text,
                                    floor: floorController.text,
                                    home: houseController.text,
                                    intercom: intercomController.text,
                                    street: streetController.text,
                                    comment: commentController.text,
                                  ),
                                );
                                ref
                                    .read(addressNotifierProvider.notifier)
                                    .updateAddress([...addresses]);
                                saveLoadingProgress.value = true;
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
