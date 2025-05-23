import 'package:flutter/material.dart';
import '../../../gen/translations.g.dart';

class ServiceCardText extends StatelessWidget {
  final String title;
  final String? price;
  final String? period;
  const ServiceCardText({super.key, this.period, this.price, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 0,
      children: [
        Text.rich(
          TextSpan(
            text: '$title\n',
            children: [
              if (price != null)
                TextSpan(
                  text: '${t.price_from_text} $price',
                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFF0B0C0E)),
                  children: [
                    const TextSpan(
                      text: ' ₽\n',
                      style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Roboto', fontSize: 12, color: Color(0xFF0B0C0E)),
                    ),
                    if (period != null)
                      TextSpan(
                        text: '$period',
                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xFF0B0C0E)),
                      ),
                  ],
                ),
            ],
          ),
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF0B0C0E)),
        ),
      ],
    );
  }
}
