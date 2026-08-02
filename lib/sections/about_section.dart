// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  BoxDecoration premiumCardDecoration() {
    return BoxDecoration(
      color: const Color(0xFF111318),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: AppColors.gold.withOpacity(0.18), width: 1.1),
      boxShadow: [
        BoxShadow(
          color: AppColors.gold.withOpacity(0.03),
          blurRadius: 24,
          spreadRadius: 1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 70,
        vertical: isMobile ? 50 : 90,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading with gold dash
          Row(
            children: [
              Text(
                "About Me",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 34 : 42,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 14),
              Container(
                width: 46,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const SizedBox(
            width: 620,
            child: Text(
              "Passionate developer dedicated to building the future of mobile technology through clean code and user-centric design.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: 40),

          isMobile ? _buildMobileLayout() : _buildDesktopLayout(),

          const SizedBox(height: 55),

          Center(
            child: Container(
              width: isMobile ? 220 : 900,
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.gold.withOpacity(0.22),
                    AppColors.gold.withOpacity(0.45),
                    AppColors.gold.withOpacity(0.22),
                    Colors.transparent,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gold.withOpacity(0.10),
                    blurRadius: 12,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _storyCard()),

        const SizedBox(width: 28),

        Expanded(
          child: Column(
            children: [
              _educationCard(),
              const SizedBox(height: 22),
              _careerCard(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _storyCard(),
        const SizedBox(height: 22),
        _educationCard(),
        const SizedBox(height: 22),
        _careerCard(),
      ],
    );
  }

  Widget _storyCard() {
    return HoverInfoCard(
  child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: premiumCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.public, color: AppColors.gold, size: 22),
              SizedBox(width: 10),
              Text(
                "My Story",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Text(
            "I am a Software Engineering student with a deep interest in cross-platform product development, fintech infrastructure, and scalable mobile systems. My journey began with curiosity about how digital products are built and evolved into a focused commitment to Flutter engineering, clean architecture, and production-quality software.",
            style: TextStyle(color: Colors.white70, height: 1.9, fontSize: 15),
          ),

          const SizedBox(height: 18),

          const Text(
            "I enjoy working at the intersection of product design and engineering, ensuring that every feature delivers real value to users. My long-term vision is to build globally competitive technology products that combine excellent user experience with reliable, scalable backend systems.",
            style: TextStyle(color: Colors.white70, height: 1.9, fontSize: 15),
          ),
        ],
      ),
    ),
    );
  }

  Widget _educationCard() {
    return HoverInfoCard(
  child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: premiumCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.school_outlined, color: AppColors.gold, size: 22),
              SizedBox(width: 10),
              Text(
                "Education",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Text(
            "B.Sc. Software Engineering",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            "Federal University of Technology, Owerri",
            style: TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 10),

          Text(
            "2024 — 2028 (Expected)",
            style: TextStyle(
              color: AppColors.gold,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _careerCard() {
    Widget goalItem(String text) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.chevron_right, color: AppColors.gold, size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white70,
                  height: 1.6,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }

   return HoverInfoCard(
  child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: premiumCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.track_changes, color: AppColors.gold, size: 22),
              SizedBox(width: 10),
              Text(
                "Career Goals",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          goalItem(
            "Build world-class cross-border fintech infrastructure used across multiple continents.",
          ),

          goalItem(
            "Lead the creation of scalable payment and financial products serving millions of users globally.",
          ),

          goalItem(
            "Bridge premium product design with reliable backend architecture to deliver production-ready technology.",
          ),
        ],
      ),
    ),
   );
  }
}

class HoverInfoCard extends StatefulWidget {
  final Widget child;

  const HoverInfoCard({
    super.key,
    required this.child,
  });

  @override
  State<HoverInfoCard> createState() => _HoverInfoCardState();
}

class _HoverInfoCardState extends State<HoverInfoCard> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final active = _isHovered || _isPressed;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, active ? -6 : 0, 0),
          decoration: BoxDecoration(
            color: active
                ? const Color(0xFF171B25)
                : const Color(0xFF111318),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: active
                  ? AppColors.gold.withOpacity(0.45)
                  : AppColors.gold.withOpacity(0.18),
              width: active ? 1.4 : 1.1,
            ),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: AppColors.gold.withOpacity(0.14),
                      blurRadius: 28,
                      spreadRadius: 1,
                      offset: const Offset(0, 10),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.28),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: AppColors.gold.withOpacity(0.03),
                      blurRadius: 24,
                      spreadRadius: 1,
                    ),
                  ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

