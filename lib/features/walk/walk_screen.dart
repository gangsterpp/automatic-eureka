import 'package:VOX/domain/pet_type.dart';
import 'package:VOX/features/walk/walk_body.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class WalkScreen extends StatefulWidget {
  final PetType petType;

  const WalkScreen({super.key, required this.petType});

  @override
  State<WalkScreen> createState() => _WalkScreenState();
}

class _WalkScreenState extends State<WalkScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(body: WalkBody()),
    );
  }
}
