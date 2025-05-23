import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          decoration: BoxDecoration(color: const Color(0xFF914DFF), borderRadius: BorderRadius.circular(12)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: const Alignment(0.0, -0.8),
                end: const Alignment(0.0, 0.8),
                colors: [Colors.white.withOpacity(0.4), Colors.transparent, Colors.black.withOpacity(0.04)],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: RadialGradient(
                  center: const Alignment(0.0, -0.5),
                  radius: 1.2,
                  colors: [Colors.white.withOpacity(0.2), Colors.transparent],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: RadialGradient(
                    center: const Alignment(0.0, 0.8),
                    radius: 1.0,
                    colors: [Colors.black.withOpacity(0.02), Colors.transparent],
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 20 / 14,
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
