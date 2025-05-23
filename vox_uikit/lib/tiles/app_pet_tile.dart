import 'package:flutter/material.dart';
import 'package:vox_uikit/avatars/app_circle_avatar.dart';
import 'package:vox_uikit/main.dart';

enum _AppPetTileType { simple, dismissible }

class AppPetTile extends StatelessWidget {
  const AppPetTile.simple({
    required this.avatarUrl,
    required this.name,
    required this.breed,
    required this.age,
    required this.onTapped,
    super.key,
  })  : _type = _AppPetTileType.simple,
        onDeleteRequested = null,
        onDisplaced = null;

  const AppPetTile.dismissible({
    required this.avatarUrl,
    required this.name,
    required this.breed,
    required this.age,
    required this.onTapped,
    required this.onDisplaced,
    required this.onDeleteRequested,
    super.key,
  }) : _type = _AppPetTileType.dismissible;

  final _AppPetTileType _type;
  final String? avatarUrl;
  final String name;
  final String breed;
  final String age;
  final void Function() onTapped;
  final void Function()? onDisplaced;
  final void Function()? onDeleteRequested;

  @override
  Widget build(BuildContext context) {
    if (_type == _AppPetTileType.dismissible) {
      return _DismissiblePetTile(
        avatarUrl: avatarUrl,
        name: name,
        breed: breed,
        age: age,
        onTapped: onTapped,
        onDeleteRequested: onDeleteRequested!,
      );
    }

    return Stack(
      children: [
        _Content(
          avatarUrl: avatarUrl,
          name: name,
          breed: breed,
          age: age,
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTapped,
              overlayColor: WidgetStateProperty.all(
                AppColors.primary300.withAlpha(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DismissiblePetTile extends StatefulWidget {
  const _DismissiblePetTile({
    required this.avatarUrl,
    required this.name,
    required this.breed,
    required this.age,
    required this.onTapped,
    required this.onDeleteRequested,
  });

  final String? avatarUrl;
  final String name;
  final String breed;
  final String age;
  final void Function() onTapped;
  final void Function() onDeleteRequested;

  @override
  State<_DismissiblePetTile> createState() => _DismissiblePetTileState();
}

class _DismissiblePetTileState extends State<_DismissiblePetTile> {
  double _dragOffset = 0.0;

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset = (_dragOffset + details.delta.dx).clamp(-56.0, 0.0);
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    setState(() {
      _dragOffset = _dragOffset <= -28 ? -56.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: Stack(
        children: [
          // Фон с кнопкой удаления
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: double.maxFinite,
                width: 56,
                child: ColoredBox(
                  color: AppColors.redLight500,
                  child: IconButton(
                    onPressed: widget.onDeleteRequested,
                    style: const ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        BeveledRectangleBorder(),
                      ),
                    ),
                    icon: const Icon(
                      Icons.delete,
                      size: 28,
                      color: AppColors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// Смещаемый контент плитки
          Transform.translate(
            offset: Offset(_dragOffset, 0),
            child: Stack(
              children: [
                _Content(
                  avatarUrl: widget.avatarUrl,
                  name: widget.name,
                  breed: widget.breed,
                  age: widget.age,
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: widget.onTapped,
                      overlayColor: WidgetStateProperty.all(
                        AppColors.primary300.withAlpha(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.avatarUrl,
    required this.name,
    required this.breed,
    required this.age,
  });

  final String? avatarUrl;
  final String name;
  final String breed;
  final String age;

  static const double avatarDiameter = 80;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            AppCircleAvatar(imageUrl: avatarUrl, diameter: avatarDiameter),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.s16h20w500$BodyM.copyWith(
                      color: AppColors.gray900,
                    ),
                  ),
                  Text(
                    '${breed.replaceFirst(breed[0], breed[0].toUpperCase())}, '
                    '$age',
                    style: AppTextStyles.s14h16w400$BodyS.copyWith(
                      color: AppColors.gray300,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
