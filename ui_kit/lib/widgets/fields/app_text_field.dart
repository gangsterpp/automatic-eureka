import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final Iterable<String>? autofillHints;
  final bool showSuffix;
  final bool showPrefix;
  final String? Function(String? value)? validator;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? enabled;
  final VoidCallback? onTap;
  final TextCapitalization textCapitalization;
  const AppTextField({
    super.key,
    this.labelText,
    this.controller,
    this.autofillHints,
    this.hintText,
    this.showSuffix = false,
    this.showPrefix = false,
    this.validator,
    this.readOnly = false,
    this.inputFormatters,
    this.keyboardType,
    this.enabled,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final focusNode = FocusNode();
  final errorController = ValueNotifier(false);
  late final Listenable listenable;

  String? errorText;
  bool idle = true;

  void validate() {
    if (widget.validator != null) {
      idle = false;
      errorText = widget.validator?.call(widget.controller?.text);
      errorController.value = errorText != null;
    }
  }

  BoxBorder? get _currentBorder {
    if (focusNode.hasFocus) return Border.all(color: const Color(0xFF914DFF));
    if (errorController.value) return Border.all(color: const Color(0xFFF0214E));
    return null;
  }

  @override
  void initState() {
    listenable = Listenable.merge([widget.controller, focusNode]);
    listenable.addListener(validate);
    super.initState();
  }

  @override
  void dispose() {
    listenable.removeListener(validate);
    errorController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        if (widget.labelText != null) ...[
          Text(widget.labelText!, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFF0B0C0E))),
          const SizedBox(height: 6),
        ],

        ListenableBuilder(
          listenable: Listenable.merge([focusNode, errorController]),
          builder: (_, _) {
            return Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),

                border: _currentBorder,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color(0xFFF1F2F4)],
                ),
                boxShadow: const [BoxShadow(color: Color(0xFFF1F2F4), blurRadius: 10, spreadRadius: -4)],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  textCapitalization: widget.textCapitalization,
                  onTap: widget.onTap,
                  readOnly: widget.readOnly,
                  focusNode: focusNode,
                  showCursor: false,
                  controller: widget.controller,
                  autofillHints: widget.autofillHints,
                  keyboardType: widget.keyboardType,
                  enabled: widget.enabled,
                  inputFormatters: widget.inputFormatters,
                  decoration: InputDecoration(
                    isDense: widget.showPrefix,
                    prefixIcon:
                        !widget.showPrefix
                            ? null
                            : const Padding(
                              padding: EdgeInsets.only(top: 12, bottom: 12), // add padding to adjust icon
                              child: Icon(Icons.search, color: Color(0xFF81899C), size: 24),
                            ),
                    contentPadding: !widget.showPrefix ? EdgeInsets.zero : const EdgeInsets.only(top: 16),
                    constraints: const BoxConstraints(),
                    suffixIcon: !(widget.showSuffix) ? null : const Icon(Icons.arrow_drop_down, color: Color(0xFF81899C), size: 24),
                    suffixIconConstraints: const BoxConstraints(minWidth: 2, minHeight: 2),
                    prefixIconConstraints: const BoxConstraints(minWidth: 2, minHeight: 2),
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14, height: 14 / 20, color: Color(0xFF81899C)),
                  ),
                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14, height: 14 / 20, color: Color(0xFF0B0C0E)),
                ),
              ),
            );
          },
        ),

        ListenableBuilder(
          listenable: listenable,
          builder: (context, child) {
            if (errorText == null || idle) return const SizedBox.shrink();
            return Text(errorText!, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFFF0214E)));
          },
        ),
      ],
    );
  }
}
