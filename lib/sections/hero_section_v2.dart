import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/app_colors.dart';
import '../utils/responsive.dart';

class HeroSectionV2 extends StatelessWidget {
  const HeroSectionV2({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 70,
        vertical: isMobile ? 30 : 40,
      ),
      child: isMobile
          ? const Column(
              children: [
                HeroTextArea(),
                SizedBox(height: 40),
                HeroImageArea(),
              ],
            )
          : const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: HeroTextArea(),
                ),

                SizedBox(width: 60),

                Expanded(
                  flex: 4,
                  child: HeroImageArea(),
                ),
              ],
            ),
    );
  }
}
class HeroTextArea extends StatelessWidget {
  const HeroTextArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: const Color(0x22C9A227),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.gold,
            ),
          ),
          child: const Text(
            "OPEN TO NEW OPPORTUNITIES",
            style: TextStyle(
              color: AppColors.gold,
              fontWeight: FontWeight.w600,
              fontSize: 13,
              letterSpacing: 1,
            ),
          ),
        ),

        const SizedBox(height: 35),

        const Text(
          "Software\nEngineering\nStudent &\nFlutter Developer",
          style: TextStyle(
            color: Colors.white,
            fontSize: 68,
            height: 0.95,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}


class HeroImageArea extends StatelessWidget {
  const HeroImageArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.blue.withValues(alpha: .1),
    );
  }
}