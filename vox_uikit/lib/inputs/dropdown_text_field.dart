import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vox_uikit/theme/app_colors.dart';
import 'package:vox_uikit/helpers/asset_paths.dart';
import 'package:vox_uikit/theme/app_sizes.dart';
import 'package:vox_uikit/theme/app_text_styles.dart';

class DropdownTextField extends StatefulWidget {
  const DropdownTextField({
    super.key,
    required this.controller,
    required this.items,
    this.hint,
    this.onChanged,
    this.validator,
  });

  final String? hint;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final List<String> items;
  final String? Function(String?)? validator;

  @override
  State<DropdownTextField> createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  final textFieldBorderRadius = BorderRadius.circular(AppSizes.borderRadius12);
  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _isDropdownOpen) {
        _removeOverlay();
      }
    });
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _removeOverlay();
    } else {
      _focusNode.requestFocus();
      _showOverlay();
    }
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;

    _overlayEntry = OverlayEntry(
      builder: (_) => Positioned(
        width: renderBox.size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, renderBox.size.height + 4),
          child: Material(
            elevation: 1,
            borderRadius: textFieldBorderRadius,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: List.generate(widget.items.length * 2 - 1, (index) {
                if (index.isOdd) {
                  return const Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.grayScale100,
                  );
                } else {
                  final itemIndex = index ~/ 2;
                  final item = widget.items[itemIndex];
                  return ListTile(
                    title: Text(
                      item,
                      style: AppTextStyles.inputTextStyle,
                    ),
                    hoverColor: AppColors.grayScale100,
                    onTap: () {
                      widget.controller.text = item;
                      widget.onChanged?.call(item);
                      _focusNode.unfocus();
                      _removeOverlay();
                    },
                  );
                }
              }),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
    setState(() => _isDropdownOpen = true);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) {
      setState(() => _isDropdownOpen = false);
    } else {
      _isDropdownOpen = false;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _overlayEntry?.remove();
    _overlayEntry = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        readOnly: true,
        focusNode: _focusNode,
        controller: widget.controller,
        validator: widget.validator,
        onTap: _toggleDropdown,
        decoration: InputDecoration(
          hintText: widget.hint,
          contentPadding: const EdgeInsets.all(12),
          isCollapsed: true,
          filled: true,
          fillColor: AppColors.grayScale50,
          enabledBorder: OutlineInputBorder(
            borderRadius: textFieldBorderRadius,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: textFieldBorderRadius,
            borderSide: const BorderSide(color: AppColors.main500, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: textFieldBorderRadius,
            borderSide: const BorderSide(color: AppColors.error, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: textFieldBorderRadius,
            borderSide: const BorderSide(color: AppColors.error, width: 2),
          ),
          hintStyle: AppTextStyles.hintTextStyle,
          suffixIcon: SizedBox(
            width: 20,
            height: 20,
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AssetPaths.iconDropDown,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
                package: 'vox_ui_kit',
              ),
            ),
          ),
        ),
        style: AppTextStyles.inputTextStyle,
      ),
    );
  }
}
