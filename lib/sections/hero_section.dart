// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/custom_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onProjectsPressed,
    required this.onContactPressed,
  });

  final VoidCallback onProjectsPressed;
  final VoidCallback onContactPressed;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: Stack(
        children: [
          
          // VISILY-STYLE IMAGE-ANCHORED GLOW
          Positioned(
            right: isMobile ? -40 : 40,
            top: isMobile ? 180 : 60,
            child: IgnorePointer(
              child: Container(
                width: isMobile ? 320 : 620,
                height: isMobile ? 320 : 620,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: const Alignment(
                      0.35,
                      -0.1,
                    ), // glow starts near image
                    radius: 1.0,
                    colors: [
                      AppColors.gold.withOpacity(0.20),
                      AppColors.gold.withOpacity(0.09),
                      AppColors.gold.withOpacity(0.05),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.28, 0.55, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // EXISTING HERO CONTENT
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 70,
              vertical: isMobile ? 24 : 15,
            ),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildMobileCircularImage(),
                      const SizedBox(height: 40),
                      _buildTextContent(isMobile),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(flex: 6, child: _buildTextContent(isMobile)),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: 4,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: _buildDesktopFramedImage(),
                        ),
                      ),
                    ],
                  ),
          ),

          // VISILY-STYLE GOLD DIVIDER
          Positioned(
            left: isMobile ? 20 : 70,
            right: 0,
            bottom: 0,
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.gold.withOpacity(0.18),
                    AppColors.gold.withOpacity(0.42),
                    AppColors.gold.withOpacity(0.18),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // "Open to New Opportunities" badge — desktop only per design
        if (!isMobile) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.gold.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: AppColors.gold),
            ),
            child: const Text(
              "Open to New Opportunities",
              style: TextStyle(
                color: AppColors.gold,
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],

        RichText(
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            style: TextStyle(
              fontSize: isMobile ? 32 : 62,
              fontWeight: FontWeight.w900,
              height: 1.09,
              color: Colors.white,
            ),
            children: [
              TextSpan(text: "Software Engineering\n"),
              TextSpan(
                text: "Student",
                style: TextStyle(color: AppColors.gold),
              ),
              TextSpan(text: " &\nFlutter Developer"),
            ],
          ),
        ),
        const SizedBox(height: 15),

        Text(
          "Crafting seamless mobile and web experiences with Flutter.\n"
          "Focused on high-performance, pixel-perfect UI, and scalable\n"
          "cloud integrations.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            color: Colors.white70,
            fontSize: isMobile ? 12 : 14,
            height: 1.5,
          ),
        ),

        const SizedBox(height: 30),

        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 12,
          runSpacing: 12,
          children: [
            CustomButton(text: "View Projects", onPressed: onProjectsPressed),

            CustomButton(
              text: "Contact Me",
              filled: false,
              onPressed: onContactPressed,
            ),
          ],
        ),
      ],
    );
  }

  // =========================================================
  // MOBILE — CIRCULAR AVATAR (matches Visily design)
  // =========================================================
  Widget _buildMobileCircularImage() {
    const double size = 220;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF0A0A0A),
            border: Border.all(color: AppColors.gold, width: 2.5),
            boxShadow: [
              BoxShadow(
                color: AppColors.gold.withOpacity(0.14),
                blurRadius: 26,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset("assets/image.png", fit: BoxFit.cover),
          ),
        ),

        // GREEN ONLINE STATUS DOT
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF22C55E),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF0A0A0A), width: 3),
            ),
          ),
        ),
      ],
    );
  }

  // =========================================================
  // DESKTOP — FRAMED IMAGE + EXPERIENCE BADGE (unchanged)
  // =========================================================
  Widget _buildDesktopFramedImage() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // OUTER PREMIUM FRAME
        Container(
          width: 360,
          height: 470,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFF0A0A0A), // deep black frame
            borderRadius: BorderRadius.circular(34),
            border: Border.all(
              color: AppColors.gold.withOpacity(0.35), // subtle gold stroke
              width: 1.2,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFF111111), // inner dark frame
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: AppColors.gold.withOpacity(0.12),
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset("assets/image.png", fit: BoxFit.cover),
            ),
          ),
        ),

        // EXPERIENCE BADGE
        Positioned(
          bottom: 12,
          right: -6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF141827),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.35),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: AppColors.gold.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.gold.withOpacity(0.18),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.code_rounded,
                    color: AppColors.gold,
                    size: 18,
                  ),
                ),

                const SizedBox(width: 10),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "EXPERIENCE",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 8,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Flutter Expert",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}