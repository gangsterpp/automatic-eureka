import 'package:VOX/core/utils/size_utils.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class NeumorphicPinCodeField extends StatefulWidget {
  final Function(String) onPinEntered; // Callback to handle the entered pin

  const NeumorphicPinCodeField({super.key, required this.onPinEntered});

  @override
  State createState() => _NeumorphicPinCodeFieldState();
}

class _NeumorphicPinCodeFieldState extends State<NeumorphicPinCodeField> {
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    // Call the callback when the last field is filled
    if (_controllers.every((controller) => controller.text.isNotEmpty)) {
      String enteredPin = _controllers.map((controller) => controller.text).join('');
      widget.onPinEntered(enteredPin); // Pass entered pin to parent widget
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus(); // Устанавливаем фокус на первое поле
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Neumorphic(
            style: NeumorphicStyle(
              depth: -4,
              intensity: 0.5,
              shape: NeumorphicShape.convex,
              lightSource: LightSource.bottom,
              // color: appTheme.gray10002,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            ),
            child: SizedBox(
              width: 76.h,
              height: 56.v,
              child: Center(
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  maxLength: 1,
                  // style: CustomTextStyles.headlineSmallBlack90003,
                  decoration: InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        // color: appTheme.deepPurpleA20002,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                  // cursorColor: appTheme.deepPurpleA20002,
                  cursorWidth: 1.h,
                  cursorHeight: 32.v,
                  onChanged: (value) => _onChanged(value, index),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
