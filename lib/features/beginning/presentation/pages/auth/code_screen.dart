import 'package:VOX/core/utils/size_utils.dart';
import 'package:VOX/extensions/build_context_ext.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/widget/phone_number_widget/neumorphic_code_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vox_ui_kit/core/theme/colors.dart';
import 'package:vox_ui_kit/core/theme/styles.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';

@RoutePage()
class CodeScreen extends ConsumerStatefulWidget {
  static String routeName = "/code";
  final String phoneNumber;

  const CodeScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CodeScreenState();
}

class _CodeScreenState extends ConsumerState<CodeScreen> {
  // The correct pin code for verification
  final String correctPin = '1234';

  // Method to verify the entered pin
  void _verifyPin(String enteredPin) {
    if (enteredPin == correctPin) {
      // Pin is correct
      // Proceed to the next screen or show success message
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Placeholder()), // Replace with next screen
      );
    } else {
      // Pin is incorrect
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.wrong_code_title)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.whiteA70001,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20.v),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 44.h,
                    height: 44.v,
                    decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(color: Color(0x140C001A), blurRadius: 12.0, offset: Offset(0.0, 6.0))],
                    ),
                    child: Image.asset('assets/images/arrow_left_button.png'),
                  ),
                ),
              ),
              SizedBox(height: 20.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(t.incoming_call_title, style: ThemeStyles.s24h700(ThemeColors.black90003)),
              ),
              SizedBox(height: 28.v),
              NeumorphicPinCodeField(
                onPinEntered: _verifyPin, // Pass the callback for pin verification
              ),
              SizedBox(height: 40.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    text: t.did_not_receive_call_title,
                    style: ThemeStyles.s14h400lS33(ThemeColors.blueGray600),
                    children: [
                      TextSpan(
                        text: t.repeat_call_title,
                        style: ThemeStyles.s14h400lS33(ThemeColors.deepPurpleA20005),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder()));
                              },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.v),
              ElevatedButton(
                style: context.buttonThemes.primaryElevatedButtonTheme?.style,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder()));
                },
                child: Text(t.confirm_title),
              ),
              SizedBox(height: 16.v),
            ],
          ),
        ),
      ),
    );
  }
}
