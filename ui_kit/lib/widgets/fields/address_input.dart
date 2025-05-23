import 'package:flutter/material.dart';

import '../../domain/address_model.dart';
import '../../vox_ui_kit.dart';

enum AddressInputState { initial, filled, disabled }

class AddressInput extends StatefulWidget {
  final AddressModel? Function()? onTap;
  final AddressModel? initialAddress;
  final AddressModel? Function()? onSpecifyAddress;
  final VoidCallback onMoveToCurrentLocation;
  final ValueNotifier<AddressModel?>? addressNotifier;

  /// [isValidAddress] - если определена, поведение геттера [isValid] будет определяться её результатом
  final bool Function(AddressModel value)? isValidAddress;

  const AddressInput({
    super.key,
    required this.onTap,
    this.initialAddress,
    required this.onSpecifyAddress,
    required this.isValidAddress,
    required this.onMoveToCurrentLocation,
    this.addressNotifier,
  });

  @override
  State<AddressInput> createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  final _widgetState = ValueNotifier<Set<AddressInputState>>({AddressInputState.initial});
  late final _address = widget.addressNotifier ?? ValueNotifier<AddressModel?>(null);

  @override
  void didChangeDependencies() {
    if (widget.onTap == null) {
      _widgetState.value = {AddressInputState.disabled};
    } else {
      if (_address.value?.isValid == true) {
        _widgetState.value = {AddressInputState.filled};
      } else {
        _widgetState.value = {AddressInputState.initial};
      }
    }
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant AddressInput oldWidget) {
    if (widget.onTap == null) {
      _widgetState.value = {AddressInputState.disabled};
    } else {
      if (_address.value?.isValid == true) {
        _widgetState.value = {AddressInputState.filled};
      } else {
        _widgetState.value = {AddressInputState.initial};
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _widgetState.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _widgetState,
      builder: (_, value, _) {
        final Color pinColor;
        if (value.contains(AddressInputState.initial)) {
          pinColor = primaryColors.shade600;
        } else if (value.contains(AddressInputState.filled) && !value.contains(AddressInputState.disabled)) {
          pinColor = primaryColors.shade600;
        } else if (value.contains(AddressInputState.disabled) && !value.contains(AddressInputState.filled)) {
          pinColor = primaryColors.shade300;
        } else {
          pinColor = primaryColors.shade300;
        }
        final Color addressColor;
        if (value.contains(AddressInputState.initial)) {
          addressColor = grayColors.shade200;
        } else if (value.contains(AddressInputState.filled) && !value.contains(AddressInputState.disabled)) {
          addressColor = grayColors.shade900;
        } else if (value.contains(AddressInputState.disabled) && !value.contains(AddressInputState.filled)) {
          addressColor = grayColors.shade200;
        } else {
          addressColor = grayColors.shade200;
        }
        // ignore: unused_local_variable
        final Color specifyColor;
        final bool hasButton;
        if (value.contains(AddressInputState.initial)) {
          specifyColor = primaryColors.shade600;
          hasButton = false;
        } else if (value.contains(AddressInputState.filled) && !value.contains(AddressInputState.disabled)) {
          specifyColor = primaryColors.shade500;
          hasButton = true;
        } else if (value.contains(AddressInputState.disabled) && !value.contains(AddressInputState.filled)) {
          specifyColor = primaryColors.shade600;
          hasButton = false;
        } else {
          specifyColor = primaryColors.shade300;
          hasButton = true;
        }
        return Material(
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.hardEdge,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),

              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [whiteColors.shade900, grayColors.shade100],
              ),
              boxShadow: [BoxShadow(color: grayColors.shade100, blurRadius: 10, spreadRadius: -4)],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 12,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: widget.onMoveToCurrentLocation,
                      child: Assets.icons.pinLocationIcon.image(color: pinColor, height: 20, width: 20, package: 'vox_ui_kit'),
                    ),
                  ),
                  Expanded(
                    flex: _widgetState.value.contains(AddressInputState.filled) ? 14 : 10,
                    child: InkWell(
                      onTap:
                          widget.onTap == null
                              ? null
                              : () {
                                final result = widget.onTap?.call();
                                if (result != null) {
                                  _address.value = result;
                                  _widgetState.value = {AddressInputState.filled};
                                } else {
                                  _widgetState.value = {AddressInputState.initial};
                                }
                              },
                      child: Ink(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppText(t.where_to_take_walker_title, type: AppTextType.w400s12h1P2),
                            ListenableBuilder(
                              listenable: _address,
                              builder: (_, __) {
                                return AppText(
                                  _address.value?.isValid == true
                                      ? t.address_example_title(address: _address.value?.address ?? '')
                                      : t.address_placeholder_title,
                                  type: AppTextType.w400s14h20,
                                  color: addressColor,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (!hasButton)
                    const SizedBox.shrink()
                  else
                    Expanded(
                      flex: _widgetState.value.contains(AddressInputState.filled) ? 4 : 1,
                      child: InkWell(
                        onTap:
                            widget.onSpecifyAddress == null
                                ? null
                                : () {
                                  final address = widget.onSpecifyAddress?.call();
                                  if (address != null) {
                                    _address.value = address;
                                    _widgetState.value = {AddressInputState.filled};
                                  }
                                },
                        child: AppText(
                          t.specify_address_button_title,
                          type: AppTextType.w600s12h20,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
