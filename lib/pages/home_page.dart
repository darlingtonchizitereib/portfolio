import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/custom_navbar.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CustomNavbar(),
            HeroSection(),
            AboutSection(),
            SkillsSection(),
          ],
        ),
      ),
    );
  }
}
