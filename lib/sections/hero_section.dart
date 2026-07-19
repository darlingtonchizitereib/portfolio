import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 30 : 40,
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
                Expanded(
                  child: _buildTextContent(isMobile),
                ),
                const SizedBox(width: 60),
                _buildImage(isMobile),
              ],
            ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Building Real-World\nFintech & Mobile\nApplications",
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 38 : 55,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          "Software Engineering student focused on Flutter, fintech solutions, and scalable mobile experiences.",
          style: TextStyle(
            color: Colors.white70,
            fontSize: isMobile ? 16 : 18,
          ),
        ),

        const SizedBox(height: 30),

        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("View Projects"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("Contact Me"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImage(bool isMobile) {
    return Container(
      width: isMobile ? 280 : 350,
      height: isMobile ? 340 : 420,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.gold,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(
          "assets/images/image.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}