import 'package:flutter/material.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as fiw;

import '../../vox_ui_kit.dart';

class AiAssistantCard extends StatelessWidget {
  final Widget image;
  final Widget button;
  const AiAssistantCard({super.key, required this.image, required this.button});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: fiw.BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          fiw.BoxShadow(offset: const Offset(0, -4), blurRadius: 5, color: Colors.black.withOpacity(0.04), inset: true),
          fiw.BoxShadow(offset: const Offset(0, 4), blurRadius: 3, color: Colors.white.withOpacity(0.4)),
        ],
      ),

      child: Card(
        elevation: 0,
        color: const Color(0xFFD9EBFC),
        margin: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 20, top: 16, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      t.ai_assistant_title,
                      style: const TextStyle(fontWeight: FontWeight.w500, height: 2, color: Color(0xFF0B0C0E), fontSize: 16),

                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      t.ai_assistant_subtitle,
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFF0B0C0E)),
                    ),

                    const SizedBox(height: 18),
                    button,
                  ],
                ),
              ),
            ),
            image,
          ],
        ),
      ),
    );
  }
}

/// Плавная кнопка-фабл с градиентом и внутренней тенью
class GradientQuestionButton extends StatelessWidget {
  /// Текст кнопки
  final Widget child;

  /// Обработчик нажатия
  final VoidCallback onPressed;

  /// Ширина кнопки
  final double? width;

  /// Высота кнопки
  final double height;

  const GradientQuestionButton({super.key, required this.child, required this.onPressed, this.width, this.height = 48});

  @override
  Widget build(BuildContext context) {
    // Центрируем текст и добавляем плавный эффект нажатия
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFA370FF), Color(0xFF7A00FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            // Внешняя тень
            BoxShadow(color: Colors.black.withOpacity(0.15), offset: const Offset(0, 4), blurRadius: 8, spreadRadius: 1),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
