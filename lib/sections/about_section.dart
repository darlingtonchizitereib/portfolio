import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 50 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Me",
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 32 : 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Passionate developer dedicated to building the future of mobile technology through clean code and user-centric design.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 40),

          isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _storyCard(),
        ),

        const SizedBox(width: 25),

        Expanded(
          child: Column(
            children: [
              _educationCard(),
              const SizedBox(height: 20),
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

        const SizedBox(height: 20),

        _educationCard(),

        const SizedBox(height: 20),

        _careerCard(),
      ],
    );
  }

  Widget _storyCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Story",
            style: TextStyle(
              color: AppColors.gold,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 15),

          Text(
            "I am a Software Engineering student focused on Flutter development, fintech products, and scalable mobile applications. My goal is to build products that solve real-world problems while delivering excellent user experiences.",
            style: TextStyle(
              color: Colors.white70,
              height: 1.8,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _educationCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Education",
            style: TextStyle(
              color: AppColors.gold,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "B.Sc Software Engineering",
            style: TextStyle(color: Colors.white),
          ),

          Text(
            "Federal University of Technology, Owerri",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _careerCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Career Goals",
            style: TextStyle(
              color: AppColors.gold,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "• Build impactful fintech products\n"
            "• Master Flutter architecture\n"
            "• Secure internship opportunities",
            style: TextStyle(
              color: Colors.white70,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}