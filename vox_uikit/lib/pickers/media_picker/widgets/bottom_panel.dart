part of '../app_media_file_picker.dart';

class _BottomPickerButton extends StatelessWidget {
  const _BottomPickerButton({
    required this.onTapped,
    required this.selectedEntitiesCount,
  });

  final void Function() onTapped;
  final int selectedEntitiesCount;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(
            color: AppColors.gray100,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: AppAccentButton.primary(
          text: 'Готово',
          onTapped: onTapped,
          isDisabled: selectedEntitiesCount == 0,
          trailing: selectedEntitiesCount == 0
              ? null
              : Text(
                  'Выбрано $selectedEntitiesCount',
                  style: AppTextStyles.s12h20w600$ButtonS.copyWith(
                    color: AppColors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
