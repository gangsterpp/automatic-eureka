import 'package:VOX/core/utils/size_utils.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/data/verification_service.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/widget/agree_button_widget.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/widget/agreement_text_widget.dart';
import 'package:VOX/features/beginning/presentation/pages/auth/widget/phone_number_widget/phone_number_widget.dart';
import 'package:VOX/providers/app_storage.dart';
import 'package:VOX/providers/authorize.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vox_ui_kit/core/theme/colors.dart';
import 'package:vox_ui_kit/core/theme/styles.dart';
import 'package:vox_ui_kit/gen/assets.gen.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';

final phoneNumberProvider = StateProvider<String>((ref) => '');

@RoutePage()
class SignInScreen extends ConsumerStatefulWidget {
  static String routeName = "/signIn";

  const SignInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final VerificationService _verificationService = VerificationService();

  Future<void> handleVerification() async {
    await ref.read(appStorageProvider).setFirstEnter();
    return ref.read(authorizeNotifierProvider.notifier).login();

    final phoneNumber = ref.read(phoneNumberProvider);

    if (phoneNumber.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.enter_phone_title)));
      return;
    }

    String formattedNumber = phoneNumber.startsWith("+") ? phoneNumber : "+7$phoneNumber";

    final uuid = await _verificationService.sendVerificationCode(
      formattedNumber,
      gatewayId: 'abc123',
      channelType: 'SMS',
      destination: formattedNumber,
    );

    if (uuid != null) {
      _showCodeInputDialog(uuid);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.send_code_error_title)));
    }
  }

  Future<void> _showCodeInputDialog(String uuid) async {
    String? userCode = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String enteredCode = '';
        return AlertDialog(
          title: const Text("Введите код"),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              enteredCode = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Подтвердить"),
              onPressed: () {
                Navigator.of(context).pop(enteredCode);
              },
            ),
          ],
        );
      },
    );

    if (userCode != null && userCode.isNotEmpty) {
      _verifyCode(uuid, userCode);
    }
  }

  Future<void> _verifyCode(String uuid, String code) async {
    setState(() {});

    final status = await _verificationService.checkVerificationCode(uuid, code);

    if (status == 'CONFIRMED') {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Код подтвержден!')));
      // Вход или переход на следующий экран
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка подтверждения: $status')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 56.v),
              SvgPicture.asset(Assets.icons.logo, width: 100.h, height: 100.v, package: 'vox_ui_kit'),
              SizedBox(height: 12.v),
              Text('Добро пожаловать', textAlign: TextAlign.center, style: ThemeStyles.s24h700(ThemeColors.black90003)),
              SizedBox(height: 40.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Введите номер телефона', style: ThemeStyles.s12h400(ThemeColors.blueGray400)),
                      SizedBox(height: 4.v),
                      PhoneNumberInput(
                        onChanged: (text) {
                          ref.read(phoneNumberProvider.notifier).state = text.replaceAll(RegExp(r'[^0-9+]'), '');
                          debugPrint("Обновлённый phoneNumberProvider: ${ref.read(phoneNumberProvider)}");
                        },
                      ),
                      SizedBox(height: 24.v),
                      AgreeButton(onPressed: handleVerification),
                      SizedBox(height: 24.v),
                      AgreementText(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
