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

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 24 : 24,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextContent(isMobile),
                const SizedBox(height: 40),
                Center(child: _buildImage(isMobile)),
              ],
            )
          : Row(
              children: [
                Expanded(flex: 6, child: _buildTextContent(isMobile)),
                const SizedBox(width: 40),
                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: _buildImage(isMobile),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.gold.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.gold),
          ),
          child: const Text(
            "Open to New Opportunities",
            style: TextStyle(
              color: AppColors.gold,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),

        const SizedBox(height: 25),

        //const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: isMobile ? 42 : 72,
              fontWeight: FontWeight.bold,
              height: 0.95,
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
        const SizedBox(height: 25),

        Text(
          "Crafting seamless mobile and web experiences with Flutter.\n"
          "Focused on high-performance, pixel-perfect UI, and scalable\n"
          "cloud integrations.",
          style: TextStyle(
            color: Colors.white70,
            fontSize: isMobile ? 16 : 18,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 35),

        //const SizedBox(height: 30),
        Wrap(
          spacing: 14,
          runSpacing: 14,
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

  Widget _buildImage(bool isMobile) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: isMobile ? 300 : 360,
          height: isMobile ? 360 : 470,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffECE5DA),
              borderRadius: BorderRadius.circular(22),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset("assets/images/image.png", fit: BoxFit.cover),
            ),
          ),
        ),

        Positioned(
          bottom: 18,
          right: -10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white10),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(.25),
                  blurRadius: 18,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: AppColors.gold.withOpacity(.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.code, color: AppColors.gold),
                ),

                const SizedBox(width: 10),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "EXPERIENCE",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 9,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Flutter Expert",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
