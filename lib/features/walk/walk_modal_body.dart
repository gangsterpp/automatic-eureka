import 'package:VOX/widgets/walk_card.dart';
import 'package:flutter/material.dart';
import 'package:vox_ui_kit/domain/address_model.dart';
import 'package:vox_ui_kit/theme/app_text.dart';
import 'package:vox_ui_kit/theme/colors.dart';
import 'package:vox_ui_kit/widgets/fields/address_input.dart';
import 'package:vox_uikit/main.dart';

class WalkModalBody extends StatefulWidget {
  final VoidCallback onMoveToCurrentLocation;
  final bool isHorizontal;
  const WalkModalBody({
    super.key,
    required this.onMoveToCurrentLocation,
    this.isHorizontal = false,
  });

  @override
  State<WalkModalBody> createState() => _WalkModalBodyState();
}

class _WalkModalBodyState extends State<WalkModalBody> {
  final _selectedCardNotifier = ValueNotifier<int>(0);
  final _addressNotifier = ValueNotifier<AddressModel?>(null);
  final _petNotifier = ValueNotifier<bool>(false);

  bool get isDisabled => _addressNotifier.value == null || !_petNotifier.value;

  @override
  void dispose() {
    _addressNotifier.dispose();
    _selectedCardNotifier.dispose();
    _petNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {}
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: whiteColors,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(32),
            topRight:
                widget.isHorizontal ? Radius.zero : const Radius.circular(32),
            bottomLeft:
                widget.isHorizontal ? const Radius.circular(32) : Radius.zero,
          ),
        ),
        child: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  SafeArea(
                    top: widget.isHorizontal,
                    bottom: false,
                    left: false,
                    right: widget.isHorizontal,
                    minimum:
                        widget.isHorizontal
                            ? const EdgeInsets.all(2)
                            : EdgeInsets.zero,
                    child: AddressInput(
                      addressNotifier: _addressNotifier,
                      onMoveToCurrentLocation: widget.onMoveToCurrentLocation,
                      onSpecifyAddress: () {
                        _addressNotifier.value = const AddressModel(
                          addressCity: '',
                          addressStreet: '',
                          addressHouse: '',
                          addressIntercom: '',
                          addressFloor: '',
                          addressFlat: '',
                          addressComment: '',
                          isValidAddress: null,
                        );
                        return _addressNotifier.value;
                      },
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder:
                              (context) => AppBottomSheetDecoration.fixed(
                                leading: IconButton(
                                  icon: const Icon(AppIcons.arrowLeft),
                                  onPressed:
                                      () => Navigator.of(context).maybePop(),
                                ),
                                title: 'Адрес',
                                child: IntrinsicHeight(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsGeometry.all(
                                            16,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            spacing: 16,
                                            children: [
                                              Flexible(
                                                child: TextFieldWidget(
                                                  title: 'Город',
                                                  controller:
                                                      TextEditingController()
                                                        ..text =
                                                            'Санкт-Петербург',
                                                ),
                                              ),
                                              Flexible(
                                                child: Row(
                                                  spacing: 12,
                                                  children: [
                                                    Flexible(
                                                      flex: 2,
                                                      child: TextFieldWidget(
                                                        title: 'Улица',
                                                        controller:
                                                            TextEditingController()
                                                              ..text =
                                                                  'Маяковского',
                                                      ),
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      child: TextFieldWidget(
                                                        title: 'Дом',
                                                        controller:
                                                            TextEditingController()
                                                              ..text = '12',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: Row(
                                                  spacing: 12,
                                                  children: [
                                                    Flexible(
                                                      flex: 1,
                                                      child: TextFieldWidget(
                                                        title: 'Домофон',
                                                        controller:
                                                            TextEditingController(),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      child: TextFieldWidget(
                                                        title: 'Этаж',
                                                        controller:
                                                            TextEditingController(),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      child: TextFieldWidget(
                                                        title: 'Квартира',
                                                        controller:
                                                            TextEditingController(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: TextFieldWidget(
                                                  title:
                                                      'Дополнительные комментарии',
                                                  controller:
                                                      TextEditingController(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: SafeArea(
                                          minimum: const EdgeInsets.only(
                                            left: 16,
                                            top: 16,
                                            right: 16,
                                            bottom: 4,
                                          ),
                                          child: AppAccentButton.primary(
                                            text: 'Сохранить',
                                            onTapped: () {
                                              _addressNotifier
                                                  .value = const AddressModel(
                                                addressCity: 'Санкт-Петербург',
                                                addressStreet: 'Маяковского',
                                                addressHouse: '12',
                                                addressIntercom: '123',
                                                addressFloor: '',
                                                addressFlat: '',
                                                addressComment: '',
                                                isValidAddress: null,
                                              );
                                              Navigator.of(context).maybePop();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        );
                        return null;
                      },
                      isValidAddress: null,
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(12),
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {
                        _petNotifier.value = !_petNotifier.value;
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),

                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white, Color(0xFFF1F2F4)],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFF1F2F4),
                              blurRadius: 10,
                              spreadRadius: -4,
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Center(
                            child: AppText(
                              'Добавить питомца',
                              type: AppTextType.w600s16h24,
                              color: grayColors,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 71,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ValueListenableBuilder<int?>(
                          valueListenable: _selectedCardNotifier,
                          builder: (context, selectedIndex, _) {
                            switch (index) {
                              case 0:
                                return WalkCard(
                                  price:
                                      (_) => const Text(
                                        '580 ₽',
                                        style: AppTextStyles.s16h20w500$BodyM,
                                      ),
                                  description:
                                      (_) => const Text(
                                        'Через 60-90 минут',
                                        style: AppTextStyles.s14h20w500$Caption,
                                      ),
                                  controller: _selectedCardNotifier,
                                  index: index,
                                );
                              case 1:
                                return WalkCard(
                                  price:
                                      (_) => const Text(
                                        '550 ₽',
                                        style: AppTextStyles.s16h20w500$BodyM,
                                      ),
                                  description:
                                      (_) => const Text(
                                        'Абонемент 10',
                                        style: AppTextStyles.s14h20w500$Caption,
                                      ),
                                  controller: _selectedCardNotifier,
                                  index: index,
                                );
                              case 2:
                                return WalkCard(
                                  price:
                                      (_) => const Text(
                                        '530 ₽',
                                        style: AppTextStyles.s16h20w500$BodyM,
                                      ),
                                  description:
                                      (_) => const Text(
                                        'Абонемент 20',
                                        style: AppTextStyles.s14h20w500$Caption,
                                      ),
                                  controller: _selectedCardNotifier,
                                  index: index,
                                );
                              default:
                                return const SizedBox.shrink();
                            }
                          },
                        );
                      },
                    ),
                  ),

                  Flexible(
                    child: AppText(
                      'Продолжительность прогулки – 1 час',
                      type: AppTextType.w400s14h20,
                      color: grayColors.shade400,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SafeArea(
                    top: false,
                    child: ListenableBuilder(
                      listenable: Listenable.merge([
                        _selectedCardNotifier,
                        _addressNotifier,
                        _petNotifier,
                      ]),
                      builder: (context, child) {
                        return AppAccentButton.primary(
                          text:
                              'Уточнить детали${switch (_selectedCardNotifier.value) {
                                0 => '\n580 ₽',
                                1 => '\n550 ₽',
                                2 => '\n530 ₽',
                                _ => '',
                              }}',
                          onTapped: isDisabled ? null : () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
