import 'package:VOX/features/home/presentation/services/service_button.dart';
import 'package:flutter/material.dart';
import 'package:vox_ui_kit/gen/assets.gen.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';

class ServicesTab extends StatefulWidget {
  final void Function(int index)? onTap;
  const ServicesTab({super.key, this.onTap});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  final selectedIndex = ValueNotifier(0);
  final _scrollController = ScrollController();
  final _keys = [GlobalKey(), GlobalKey(), GlobalKey()];
  double width = 0;

  void init() {
    width = 0;
    for (var key in _keys) {
      if (key.currentContext == null) continue;
      final size = key.currentContext!.size;
      if (size == null) continue;
      width += size.width + 100;
    }
  }

  @override
  void initState() {
    super.initState();

    selectedIndex.addListener(onSelectedIndexChanged);
  }

  Future<void> onSelectedIndexChanged() async {
    widget.onTap?.call(selectedIndex.value);
    await Future.delayed(const Duration(milliseconds: 250), () {});
    if (_keys[selectedIndex.value].currentContext == null || selectedIndex.value < 3) return;
    final RenderBox renderBox = _keys[selectedIndex.value].currentContext!.findRenderObject() as RenderBox;
    final widgetSize = renderBox.size;
    final widgetOffset = renderBox.localToGlobal(Offset.zero);

    if (!mounted) return;
    final viewportWidth = MediaQuery.of(context).size.width - 30;

    // Если правый край виджета выходит за пределы экрана,
    // то вычисляем на сколько нужно прокрутить:
    final widgetRight = widgetOffset.dx + widgetSize.width;
    double offsetDelta = 0.0;
    if (widgetRight > viewportWidth) {
      offsetDelta = widgetRight - viewportWidth;
    } else if (widgetOffset.dx < 0) {
      // Если виджет обрезается с левой стороны,
      // прокручиваем в обратную сторону.
      offsetDelta = widgetOffset.dx;
    }

    if (offsetDelta != 0) {
      final newOffset = _scrollController.offset + offsetDelta;
      _scrollController.animateTo(newOffset, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    selectedIndex.removeListener(onSelectedIndexChanged);
    _scrollController.dispose();
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        children: [
          ListenableBuilder(
            listenable: selectedIndex,
            builder: (_, _) {
              return ServiceButton(
                key: _keys[0],
                isSelected: selectedIndex.value == 0,
                onTap: () {
                  selectedIndex.value = 0;
                },

                icon: Assets.icons.serviceDog.image(package: 'vox_ui_kit', width: 24, height: 24),

                title: t.dog_services_title,
                backgroundColor: const Color(0xFFFFF9E5),
              );
            },
          ),
          const SizedBox(width: 12),
          ListenableBuilder(
            listenable: selectedIndex,
            builder: (_, _) {
              return ServiceButton(
                key: _keys[1],
                isSelected: selectedIndex.value == 1,
                onTap: () {
                  selectedIndex.value = 1;
                },
                icon: Assets.icons.serviceCat.image(package: 'vox_ui_kit', width: 24, height: 24),
                title: t.cat_services_title,
                backgroundColor: const Color(0xFFFFE5FC),
              );
            },
          ),
          const SizedBox(width: 12),
          ListenableBuilder(
            key: _keys[2],
            listenable: selectedIndex,
            builder: (_, _) {
              return ServiceButton(
                isSelected: selectedIndex.value == 2,
                onTap: () {
                  selectedIndex.value = 2;
                },

                icon: Assets.icons.serviceOther.image(package: 'vox_ui_kit', width: 24, height: 24),
                title: t.other_pets_services_title,
                backgroundColor: const Color(0xFFE5FFE9),
              );
            },
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
