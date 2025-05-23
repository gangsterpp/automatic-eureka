import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vox_ui_kit/gen/translations.g.dart';

@RoutePage()
class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: context.pop, icon: const Icon(CupertinoIcons.chevron_back), color: const Color(0xFF0B0C0E)),
        title: Text(t.info_title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xFF0B0C0E))),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          ListTile(title: Text(t.terms_of_offer_title), trailing: const Icon(CupertinoIcons.chevron_forward)),
          ListTile(title: Text(t.license_agreement_title), trailing: const Icon(CupertinoIcons.chevron_forward)),
          ListTile(title: Text(t.privacy_policy_title), trailing: const Icon(CupertinoIcons.chevron_forward)),
          ListTile(title: Text(t.about_title), trailing: const Icon(CupertinoIcons.chevron_forward)),
        ],
      ),
    );
  }
}
