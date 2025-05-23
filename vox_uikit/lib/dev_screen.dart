import 'package:flutter/material.dart';
import 'package:vox_uikit/main.dart';
import 'package:vox_uikit/select_controls/app_radio.dart';

class DevScreen extends StatefulWidget {
  const DevScreen({super.key});

  @override
  State<DevScreen> createState() => _DevScreenState();
}

class _DevScreenState extends State<DevScreen> {
  final _radioValue = ValueNotifier<int>(0);
  final _sliderValue = ValueNotifier<double>(20);
  final _checkBoxTileValue = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'VOX UIKit'),
      body: SingleChildScrollView(
        child: Column(
          spacing: 8,
          children: [
            /// Радио
            /// ----------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                spacing: 8,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 24,
                    children: [
                      AppIconButton.white(
                        onTapped: () => _onPopUpNoButtonTapped(context),
                        icon: Icons.messenger_outline_rounded,
                      ),
                      const Expanded(child: Text('PopUp - No button'))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 24,
                    children: [
                      AppIconButton.white(
                        onTapped: () => _onPopUpOneButtonTapped(context),
                        icon: Icons.messenger_outline_rounded,
                      ),
                      const Expanded(child: Text('PopUp - 1 button'))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 24,
                    children: [
                      AppIconButton.white(
                        onTapped: () => _onPopUpTwoButtonTapped(context),
                        icon: Icons.messenger_outline_rounded,
                      ),
                      const Expanded(child: Text('PopUp - 2 button'))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 24,
                    children: [
                      AppIconButton.white(
                        onTapped: () => _onPopUpValidationTapped(context),
                        icon: Icons.messenger_outline_rounded,
                      ),
                      const Expanded(child: Text('PopUp - validation'))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 24,
                    children: [
                      AppIconButton.white(
                        onTapped: () => _onPopUpConfirmTapped(context),
                        icon: Icons.messenger_outline_rounded,
                      ),
                      const Expanded(child: Text('PopUp - confirm'))
                    ],
                  ),
                ],
              ),
            ),

            /// Радио
            /// ----------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(24),
              child: ValueListenableBuilder(
                  valueListenable: _radioValue,
                  builder: (context, v, _) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 24,
                      children: [
                        const AppRadio(isSelected: null),
                        const AppRadio(isSelected: true),
                        const AppRadio(isSelected: false),
                        const SizedBox(width: 20),
                        ...List.generate(
                          4,
                          (i) => Listener(
                            onPointerDown: (_) => _radioValue.value = i,
                            child: AppRadio(isSelected: i == v),
                          ),
                        ),
                      ],
                    );
                  }),
            ),

            /// Шиммеры
            /// ----------------------------------------------------------------
            const Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  AppShimmer.rectangle(height: 25),
                  Row(
                    spacing: 8,
                    children: [
                      AppShimmer.circle(),
                      Expanded(child: AppShimmer.rectangle()),
                    ],
                  ),
                  AppShimmer.rectangle(),
                  AppShimmer.rectangle(width: 150),
                ],
              ),
            ),

            /// Аватарки нажимаемые
            /// ----------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  AppPetPin(
                    imageUrl:
                        'https://i.pinimg.com/736x/37/d1/28/37d12877e296094971827f1e8b909bd4.jpg',
                    name: 'Сильвер',
                    isActive: true,
                    onTapped: () {},
                  ),
                  AppPetPin(
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJRVcem2nQBnjt_Y5Vxo0ajI7rdm4br_CmfQ2J2UCcRBS45bUO7pmT40m0Mh7s0_CqdiU&usqp=CAU',
                    name: 'Бобик',
                    isActive: false,
                    onTapped: () {},
                  ),
                ],
              ),
            ),

            /// Мини Icon-кнопки
            /// ----------------------------------------------------------------
            const Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: AppStepHeader.done(index: 1, title: 'Шаг'),
                  ),
                  Expanded(
                    child: AppStepHeader.active(index: 2, title: 'Общее'),
                  ),
                  Expanded(
                    child: AppStepHeader.disabled(index: 3, title: 'На улице'),
                  ),
                ],
              ),
            ),

            /// Мини Icon-кнопки
            /// ----------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 28,
                children: [
                  AppIconButtonMini.addPrimary(onTapped: () {}),
                  AppIconButtonMini.addTertiary(onTapped: () {}),
                  AppIconButtonMini.closeTertiary(onTapped: () {}),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 28,
                children: [
                  AppIconButtonMini.addPrimary(
                    onTapped: () {},
                    isLoading: true,
                  ),
                  AppIconButtonMini.addTertiary(
                    onTapped: () {},
                    isLoading: true,
                  ),
                  AppIconButtonMini.closeTertiary(
                    onTapped: () {},
                    isLoading: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 28,
                children: [
                  AppIconButtonMini.addPrimary(
                    onTapped: () {},
                    isDisabled: true,
                  ),
                  AppIconButtonMini.addTertiary(
                    onTapped: () {},
                    isDisabled: true,
                  ),
                  AppIconButtonMini.closeTertiary(
                    onTapped: () {},
                    isDisabled: true,
                  ),
                ],
              ),
            ),

            /// Чекбокс
            /// ----------------------------------------------------------------
            ValueListenableBuilder(
              valueListenable: _checkBoxTileValue,
              builder: (_, value, __) => AppCheckboxTile(
                title: 'Надпись на тайле',
                value: value,
                onChanged: (v) => _checkBoxTileValue.value = v,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _checkBoxTileValue,
              builder: (_, value, __) => AppCheckboxTile(
                title:
                    'Очень длинный текст на плитке, который не помещается в одну строку и должен перенестись на следующие строки, а потом еще и еще итак пока не надоест мне его писать...',
                value: value,
                onChanged: (v) => _checkBoxTileValue.value = v,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _checkBoxTileValue,
              builder: (_, value, __) => AppCheckboxTile(
                title:
                    'Очень длинный текст на плитке, который не помещается в одну строку и должен перенестись на следующие строки, а потом еще и еще итак пока не надоест мне его писать...',
                value: value,
                onChanged: (v) => _checkBoxTileValue.value = v,
                lockButton: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Пройти обучение',
                    style: AppTextStyles.s12h20w600$ButtonS.copyWith(
                      color: AppColors.primary500,
                    ),
                  ),
                ),
              ),
            ),

            /// Слайдер
            /// ----------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 24,
              ),
              child: ValueListenableBuilder<double>(
                valueListenable: _sliderValue,
                builder: (_, value, __) => AppSlider(
                  min: 0,
                  max: 100,
                  value: value,
                  onChanged: (v) => _sliderValue.value = v,
                ),
              ),
            ),

            /// Icon-кнопки
            /// ----------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    spacing: 16,
                    children: [
                      AppIconButton.primary(
                        onTapped: () {},
                        icon: AppIcons.bellRingingStroke,
                      ),
                      AppIconButton.primary(
                        onTapped: () {},
                        icon: AppIcons.bellRingingStroke,
                        isLoading: true,
                      ),
                      const AppIconButton.primary(
                        onTapped: null,
                        icon: AppIcons.bellRingingStroke,
                      ),
                    ],
                  ),
                  Column(
                    spacing: 16,
                    children: [
                      AppIconButton.tertiary(
                        onTapped: () {},
                        icon: AppIcons.bellRingingStroke,
                      ),
                      AppIconButton.tertiary(
                        onTapped: () {},
                        icon: AppIcons.bellRingingStroke,
                        isLoading: true,
                      ),
                      const AppIconButton.tertiary(
                        onTapped: null,
                        icon: AppIcons.bellRingingStroke,
                      ),
                    ],
                  ),
                  Column(
                    spacing: 16,
                    children: [
                      AppIconButton.white(
                        onTapped: () {},
                        icon: AppIcons.bellRingingStroke,
                      ),
                      AppIconButton.white(
                        onTapped: () {},
                        icon: AppIcons.bellRingingStroke,
                        isLoading: true,
                      ),
                      const AppIconButton.white(
                        onTapped: null,
                        icon: AppIcons.bellRingingStroke,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// Акцентные кнопки
            /// ----------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  AppAccentButton.primary(
                    onTapped: () {},
                    text: 'Надпись на кнопке',
                  ),
                  AppAccentButton.primary(
                    onTapped: () {},
                    text: 'Надпись на кнопке',
                    isLoading: true,
                  ),
                  const AppAccentButton.primary(
                    onTapped: null,
                    text: 'Надпись на кнопке',
                  ),
                  AppAccentButton.secondary(
                    onTapped: () {},
                    text: 'Надпись на кнопке',
                  ),
                  AppAccentButton.secondary(
                    onTapped: () {},
                    text: 'Надпись на кнопке',
                    isLoading: true,
                  ),
                  const AppAccentButton.secondary(
                    onTapped: null,
                    text: 'Надпись на кнопке',
                  ),
                  AppAccentButton.tertiary(
                    onTapped: () {},
                    text: 'Надпись на кнопке',
                  ),
                  AppAccentButton.tertiary(
                    onTapped: () {},
                    text: 'Надпись на кнопке',
                    isLoading: true,
                  ),
                  const AppAccentButton.tertiary(
                    onTapped: null,
                    text: 'Надпись на кнопке',
                  ),
                  AppAccentButton.warning(
                    onTapped: () {},
                    text: 'Надпись на кнопке',
                  ),
                  AppAccentButton.warning(
                    onTapped: () {},
                    text: 'Надпись на кнопке',
                    isLoading: true,
                  ),
                  const AppAccentButton.warning(
                    onTapped: null,
                    text: 'Надпись на кнопке',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPopUpNoButtonTapped(BuildContext context) {
    AppPopUp.noButton(
      context,
      title: 'Вакцинация — это забота о вашем питомце и окружающих',
      message:
          'Исполнитель имеет право отказаться от оказания услуги в целях безопасности. Пожалуйста, позаботьтесь о вакцинации вашего любимца!',
    );
  }

  void _onPopUpOneButtonTapped(BuildContext context) {
    AppPopUp.oneButton(
      context,
      title: 'Не нашли нужную услугу?',
      message:
          'Если среди наших услуг нет нужной вам, напишите нашим операторам в чат — мы постараемся помочь и всё организовать!',
      buttonLabel: 'Написать в чат',
    );
  }

  void _onPopUpTwoButtonTapped(BuildContext context) {
    AppPopUp.twoButtons(
      context,
      title: 'Не нашли нужную услугу?',
      message:
          'Если среди наших услуг нет нужной вам, напишите нашим операторам в чат — мы постараемся помочь и всё организовать!',
      secondButtonLabel: 'Отмена',
      mainButtonLabel: 'Продолжить',
    );
  }

  void _onPopUpValidationTapped(BuildContext context) {
    AppPopUp.validated(
      context,
      title: 'Заказ оплачен',
    );
  }

  void _onPopUpConfirmTapped(BuildContext context) {
    AppPopUp.confirmed(
      context,
      title: 'Форма отправлена!',
    );
  }
}
