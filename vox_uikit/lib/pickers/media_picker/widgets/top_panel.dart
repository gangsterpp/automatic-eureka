part of '../app_media_file_picker.dart';

class _TopPickerPanel extends StatelessWidget {
  const _TopPickerPanel({
    required this.albums,
    required this.selectedAlbum,
    required this.onAlbumSelected,
  });

  final List<AssetPathEntity> albums;
  final AssetPathEntity? selectedAlbum;

  final Function(AssetPathEntity) onAlbumSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            color: AppColors.gray100,
            width: 1,
          ),
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 56),
        child: Row(
          children: [
            const SizedBox(width: 56),
            Expanded(
              child: albums.isEmpty
                  ? const SizedBox()
                  : ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 56),
                      child: Center(
                        child: _AlbumSelectButton(
                          onAlbumSelected: onAlbumSelected,
                        ),
                      ),
                    ),
            ),
            SizedBox(
              width: 56,
              child: Center(
                child: AppIconButtonMini.closeTertiary(
                  onTapped: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class _AlbumSelectButton extends StatefulWidget {
  const _AlbumSelectButton({required this.onAlbumSelected});

  final Function(AssetPathEntity) onAlbumSelected;

  @override
  State<_AlbumSelectButton> createState() => _AlbumSelectButtonState();
}

class _AlbumSelectButtonState extends State<_AlbumSelectButton> {
  List<AssetPathEntity> _albums = [];
  AssetPathEntity? _selectedAlbum;
  bool _isLoading = true;
  final GlobalKey _dropdownKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _checkAndLoadAlbums();
  }

  Future<void> _checkAndLoadAlbums() async {
    final permission = await PhotoManager.requestPermissionExtend();

    if (permission.isAuth) {
      await _loadAlbums();
    } else {
      // Подпишемся на будущее изменение (если пользователь разрешит позже через системный диалог)
      PhotoManager.addChangeCallback(_onPhotoChange);
      PhotoManager.startChangeNotify();
    }
  }

  void _onPhotoChange(MethodCall call) async {
    if (call.method == 'change') {
      final permission = await PhotoManager.requestPermissionExtend();
      if (permission.isAuth) {
        PhotoManager.removeChangeCallback(_onPhotoChange);
        PhotoManager.stopChangeNotify();
        await _loadAlbums();
      }
    }
  }

  @override
  void dispose() {
    PhotoManager.removeChangeCallback(_onPhotoChange);
    PhotoManager.stopChangeNotify();
    super.dispose();
  }

  Future<void> _loadAlbums() async {
    final albums = await PhotoManager.getAssetPathList(
      onlyAll: false,
      type: RequestType.common,
    );
    setState(() {
      _albums = albums;
      _selectedAlbum = albums.firstOrNull;
      _isLoading = false;
    });
    if (_selectedAlbum != null) {
      widget.onAlbumSelected(_selectedAlbum!);
    }
  }

  void _showDropdownMenu() {
    final RenderBox renderBox =
        _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;
    final screenWidth = MediaQuery.of(context).size.width;
    final menuWidth = screenWidth * 0.5;

    final left = (screenWidth - menuWidth) / 2;
    final top = offset.dy + size.height;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, left, 0),
      constraints: BoxConstraints(
        maxHeight: 300,
        maxWidth: menuWidth,
      ),
      color: AppColors.gray100,
      menuPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      items: List.generate(
        _albums.length,
        (index) {
          final album = _albums.elementAt(index);

          return PopupMenuItem(
            padding: EdgeInsets.zero,
            onTap: () => _onItemTapped(album),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (index > 0)
                  const Divider(
                    color: AppColors.gray200,
                    height: 0,
                    thickness: 0.5,
                  ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              album.name,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.s16h20w500$BodyM.copyWith(
                                color: AppColors.gray900,
                              ),
                            ),
                            FutureBuilder(
                              future: album.assetCountAsync,
                              builder: (context, snapshot) =>
                                  snapshot.connectionState !=
                                          ConnectionState.done
                                      ? Text(
                                          ' ',
                                          style: AppTextStyles.s14h16w400$BodyS
                                              .copyWith(
                                            color: AppColors.gray400,
                                          ),
                                        )
                                      : Text(
                                          '${snapshot.data ?? 0}',
                                          style: AppTextStyles.s14h16w400$BodyS
                                              .copyWith(
                                            color: AppColors.gray400,
                                          ),
                                        ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      FutureBuilder<List<AssetEntity>>(
                        future: album.getAssetListRange(start: 0, end: 1),
                        builder: (context, snapshot) {
                          final thumb = snapshot.data?.isNotEmpty == true
                              ? snapshot.data!.first
                              : null;
                          return thumb == null
                              ? const SizedBox(width: 40, height: 40)
                              : FutureBuilder<Uint8List?>(
                                  future: thumb.thumbnailDataWithSize(
                                      const ThumbnailSize(40, 40)),
                                  builder: (context, snap) {
                                    if (snap.connectionState !=
                                            ConnectionState.done ||
                                        snap.data == null) {
                                      return const SizedBox(
                                          width: 40, height: 40);
                                    }
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.memory(
                                        snap.data!,
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const SizedBox.shrink()
        : GestureDetector(
            key: _dropdownKey,
            onTap: _showDropdownMenu,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 2,
              children: [
                if (_selectedAlbum != null)
                  Text(
                    _selectedAlbum!.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.s18h24w500$H3.copyWith(
                      color: AppColors.gray900,
                    ),
                  ),
                const Icon(
                  AppIcons.arrowDown,
                  color: AppColors.gray400,
                  size: 16,
                ),
              ],
            ),
          );
  }

  void _onItemTapped(AssetPathEntity album) {
    try {
      setState(() => _selectedAlbum = album);
      widget.onAlbumSelected(album);
    } on Object catch (e, s) {
      print('$e \n $s');
    }
  }
}
