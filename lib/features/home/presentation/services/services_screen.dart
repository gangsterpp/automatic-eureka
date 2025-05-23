import 'package:VOX/core/routes/app_router.gr.dart';
import 'package:VOX/domain/pet_type.dart';
import 'package:VOX/features/home/presentation/services/services_tab.dart';
import 'package:VOX/features/home/presentation/services/widgets/notification_icon.dart';
import 'package:VOX/widgets/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vox_ui_kit/gen/assets.gen.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';
import 'package:vox_ui_kit/theme/colors.dart';
import 'package:vox_ui_kit/widgets/cards/ai_assistant_card.dart';
import 'package:vox_ui_kit/widgets/cards/service_cards/day_nany_card.dart';
import 'package:vox_ui_kit/widgets/cards/service_cards/dog_service_card.dart';
import 'package:vox_ui_kit/widgets/cards/service_cards/nothing_service_card.dart';
import 'package:vox_ui_kit/widgets/cards/service_cards/pet_sittings_card.dart';
import 'package:vox_ui_kit/widgets/cards/service_cards/service_card_text.dart';
import 'package:vox_ui_kit/widgets/cards/service_cards/specialist_service_card.dart';
import 'package:vox_uikit/buttons/app_accent_button.dart';

@RoutePage()
class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final _selectedIndex = ValueNotifier(0);
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final maxHeight = constraints.maxHeight / 2.96;
        return Stack(
          children: [
            // Верхняя часть с PageView
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: maxHeight,
                maxWidth: constraints.maxWidth,
              ),
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Stack(
                        children: [
                          Assets.images.blog.newsJpg.image(
                            fit: BoxFit.cover,
                            width: constraints.maxWidth,
                            height: maxHeight,
                            package: 'vox_ui_kit',
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 50,
                              ),
                              child: Text(
                                t.boarding_service_info_title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  height: 28 / 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 37,
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),

                          color: const Color(
                            0xff0b0c0e66,
                          ).withOpacity(0.4), // Цвет фона для точки
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: 6,
                            effect: CustomizableEffect(
                              spacing: 2,
                              activeDotDecoration: DotDecoration(
                                width:
                                    10, // ширина активной точки (можно увеличить для акцента)
                                height: 5, // высота активной точки
                                color: Colors.white,
                                // Например, если в макете точки имеют скругленные углы:
                                borderRadius: BorderRadius.circular(8),
                              ),
                              dotDecoration: DotDecoration(
                                width: 5, // ширина неактивной точки
                                height: 5, // высота неактивной точки
                                color: Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: Scaffold.of(context).openDrawer,
                        icon: SvgPicture.asset(
                          Assets.icons.userProfile,
                          width: 32,
                          height: 32,
                          package: 'vox_ui_kit',
                        ),
                      ),
                    ),
                  ),
                  const SafeArea(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: NotificationIcon(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Нижняя панель, которую можно перетаскивать целиком
            DraggableScrollableSheet(
              // Рассчитываем начальный размер как пропорцию от доступной высоты
              initialChildSize:
                  (constraints.maxHeight - maxHeight + 20) /
                  constraints.maxHeight,
              minChildSize:
                  (constraints.maxHeight - maxHeight + 20) /
                  constraints.maxHeight,
              maxChildSize: 1.0,
              builder: (context, scrollController) {
                return DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: AiAssistantCard(
                            image: Assets.images.temp.aiAssistant.image(
                              width: 132,
                              height: 129,
                              fit: BoxFit.cover,
                              package: 'vox_ui_kit',
                            ),
                            button: AppAccentButton.primary(
                              text: t.ask_question_button,
                              onTapped: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            bottom: 12,
                            top: 12,
                          ),
                          child: Text(
                            t.services_tab_title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              height: 24 / 18,
                              fontSize: 18,
                              color: Color(0xFF0B0C0E),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: 0,
                              maxHeight: 48,
                              minWidth: constraints.minWidth,
                              maxWidth: constraints.maxWidth,
                            ),
                            child: ServicesTab(
                              onTap: (index) => _selectedIndex.value = index,
                            ),
                          ),
                        ),
                        // Пример добавления контента в зависимости от выбранной вкладки
                        ListenableBuilder(
                          listenable: _selectedIndex,
                          builder: (_, __) {
                            if (_selectedIndex.value != 0) {
                              return const SizedBox.shrink();
                            }
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 12,
                              ),
                              child: AspectRatio(
                                aspectRatio: 2.93,
                                child: DogServiceCard(
                                  onTap: () {
                                    context.router.push(
                                      WalkRoute(petType: const DogType()),
                                    );
                                  },
                                  text: ServiceCardText(
                                    title: t.dog_walk_title,
                                    price: '600',
                                  ),
                                  color: const Color(0xFFF0E6FF),
                                  textWithBorder: (_, sW, sH, _) {
                                    return Positioned(
                                      bottom: 14 * sW,
                                      left: 12 * sH,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8 * sW,
                                            vertical: 4 * sW,
                                          ),
                                          child: Text(
                                            t.from_30_min,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: primaryColors.shade500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 28,
                          ),
                          child: ListenableBuilder(
                            listenable: _selectedIndex,
                            builder: (_, __) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                spacing: 12,
                                children: [
                                  if (_selectedIndex.value == 0) ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 12,
                                      children: [
                                        Flexible(
                                          child: AspectRatio(
                                            aspectRatio: 1.418,
                                            child: PetSittingsCard(
                                              text: ServiceCardText(
                                                title: t.pet_sitting_title,
                                                price: '1200',
                                                period: t.per_day,
                                              ),
                                              color: const Color(0xFFD9EBFC),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: AspectRatio(
                                            aspectRatio: 1.418,
                                            child: DayNanyCard(
                                              text: ServiceCardText(
                                                title: t.day_nanny_title,
                                                price: '1100',
                                              ),
                                              color: const Color(0xFFFFF9E5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 12,
                                      children: [
                                        Flexible(
                                          child: AspectRatio(
                                            aspectRatio: 1.418,
                                            child: SpecialistServiceCard(
                                              text: ServiceCardText(
                                                title: t.to_specialist_title,
                                                price: '900',
                                              ),
                                              color: const Color(0xFFE5FFE9),
                                              textWithBorder: (_, sW, sH, _) {
                                                return Positioned(
                                                  bottom: 14 * sW,
                                                  left: 12 * sH,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 8 * sW,
                                                            vertical: 4 * sW,
                                                          ),
                                                      child: Text(
                                                        t.vet_groomer_title,

                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                            0xFF318A41,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: AspectRatio(
                                            aspectRatio: 1.418,
                                            child: NothingServiceCard(
                                              onTap:
                                                  () =>
                                                      AdaptiveDialog.showDialod(
                                                        context,
                                                      ),
                                              text: ServiceCardText(
                                                title:
                                                    t.did_not_find_service_alt_title,
                                              ),
                                              color: const Color(0xFFFFE5FC),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ] else if (_selectedIndex.value == 1) ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 12,
                                      children: [
                                        Flexible(
                                          child: AspectRatio(
                                            aspectRatio: 1.418,
                                            child: PetSittingsCard(
                                              isDog: false,
                                              text: ServiceCardText(
                                                title: t.pet_sitting_title,
                                                price: '1200',
                                                period: t.per_day,
                                              ),
                                              color: const Color(0xFFD9EBFC),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: AspectRatio(
                                            aspectRatio: 1.418,
                                            child: DayNanyCard(
                                              dayNany: DayNany.cat,
                                              text: ServiceCardText(
                                                title: t.day_nanny_title,
                                                price: '1100',
                                              ),
                                              color: const Color(0xFFFFF9E5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 12,
                                      children: [
                                        Flexible(
                                          child: AspectRatio(
                                            aspectRatio: 1.418,
                                            child: SpecialistServiceCard(
                                              text: ServiceCardText(
                                                title: t.to_specialist_title,
                                                price: '900',
                                              ),
                                              color: const Color(0xFFE5FFE9),
                                              textWithBorder: (_, sW, sH, _) {
                                                return Positioned(
                                                  bottom: 14 * sW,
                                                  left: 12 * sH,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 8 * sW,
                                                            vertical: 4 * sW,
                                                          ),
                                                      child: Text(
                                                        t.vet_groomer_title,

                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                            0xFF318A41,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: AspectRatio(
                                            aspectRatio: 1.418,
                                            child: NothingServiceCard(
                                              text: ServiceCardText(
                                                title:
                                                    t.did_not_find_service_alt_title,
                                              ),
                                              color: const Color(0xFFFFE5FC),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ] else if (_selectedIndex.value == 2) ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 12,
                                      children: [
                                        Flexible(
                                          child: AspectRatio(
                                            aspectRatio: 1.418,
                                            child: PetSittingsCard(
                                              isDog: false,
                                              text: ServiceCardText(
                                                title: t.pet_sitting_title,
                                                price: '1200',
                                                period: t.per_day,
                                              ),
                                              color: const Color(0xFFD9EBFC),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: AspectRatio(
                                            aspectRatio: 1.418,
                                            child: DayNanyCard(
                                              dayNany: DayNany.other,
                                              text: ServiceCardText(
                                                title: t.day_nanny_title,
                                                price: '1100',
                                              ),
                                              color: const Color(0xFFFFF9E5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 12,
                                      children: [
                                        Flexible(
                                          child: AspectRatio(
                                            aspectRatio: 1.418,
                                            child: SpecialistServiceCard(
                                              text: ServiceCardText(
                                                title: t.to_specialist_title,
                                                price: '900',
                                              ),
                                              color: const Color(0xFFE5FFE9),
                                              textWithBorder: (_, sW, sH, _) {
                                                return Positioned(
                                                  bottom: 14 * sW,
                                                  left: 12 * sH,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 8 * sW,
                                                            vertical: 4 * sW,
                                                          ),
                                                      child: Text(
                                                        t.vet_groomer_title,

                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                            0xFF318A41,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: AspectRatio(
                                            aspectRatio: 1.418,
                                            child: NothingServiceCard(
                                              text: ServiceCardText(
                                                title:
                                                    t.did_not_find_service_alt_title,
                                              ),
                                              color: const Color(0xFFFFE5FC),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
    // return ;
  }
}
