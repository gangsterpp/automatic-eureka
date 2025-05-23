part of '../app_media_file_picker.dart';

class _MediaTile extends StatelessWidget {
  const _MediaTile({
    required this.onItemSelected,
    required this.previews,
    required this.entities,
    required this.selectedEntities,
    required this.mode,
    required this.index,
  });

  final void Function(AssetEntity) onItemSelected;
  final List<Widget> previews;
  final List<AssetEntity> entities;
  final List<AssetEntity> selectedEntities;
  final _Mode mode;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
              ),
            ),
          ),

          /// Превью
          previews.elementAt(index),

          /// Чекбокс
          if (mode == _Mode.multipleMedia)
            Positioned(
              top: 10,
              right: 10,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: AppCheckbox(
                  isChecked: selectedEntities.contains(
                    entities.elementAt(index),
                  ),
                ),
              ),
            ),

          /// Нажималка
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onItemSelected.call(entities.elementAt(index)),
              overlayColor: WidgetStateProperty.all(
                AppColors.primary300.withAlpha(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
