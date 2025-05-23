import 'package:VOX/providers/city_provider.dart';
import 'package:VOX/providers/search_cities.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';
import 'package:vox_ui_kit/widgets/fields/app_text_field.dart';

class ModalContries extends ConsumerStatefulWidget {
  const ModalContries({super.key});

  @override
  ConsumerState createState() => _ModalContriesState();
}

class _ModalContriesState extends ConsumerState<ModalContries> {
  final contriesController = TextEditingController();

  @override
  void initState() {
    contriesController.addListener(listener);
    super.initState();
  }

  void listener() {
    ref.read(cityQueryProvider.notifier).state = contriesController.text;
  }

  @override
  void dispose() {
    contriesController.removeListener(listener);
    contriesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    t.city_of_residence,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xFF0B0C0E)),
                  ),
                ),
                Material(
                  color: const Color(0xFFF8F9F9),

                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 0.5, color: Color(0xFFE2E4E9)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: context.pop,
                    child: Ink(child: const Padding(padding: EdgeInsets.all(4), child: Icon(Icons.close))),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xFFE2E4E9)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Material(child: AppTextField(showPrefix: true, hintText: 'Санкт-Петербург', controller: contriesController)),
          ),
          const Divider(color: Color(0xFFE2E4E9)),
          const Contries(),
        ],
      ),
    );
  }
}

class Contries extends ConsumerWidget {
  const Contries({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(cityQueryProvider);
    if (query.isEmpty) return const SizedBox.shrink();
    final citiesAsync = ref.watch(fetchCitiesProvider(query));
    return citiesAsync.when(
      error: (error, stackTrace) => Text(error.toString()),
      data: (data) {
        return Expanded(
          child: Material(
            type: MaterialType.transparency,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: data.length,
              itemBuilder: (_, i) {
                return ListTile(
                  title: Text(data[i].name),
                  subtitle: Text(data[i].name),
                  onTap: () {
                    ref.read(currentCityProvider.notifier).state = data[i];
                    context.pop();
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(color: Color(0xFFE2E4E9));
              },
            ),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
    );
  }
}
