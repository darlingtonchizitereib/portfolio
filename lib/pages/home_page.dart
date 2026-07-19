import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/custom_navbar.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/projects_section.dart';
import '../sections/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            CustomNavbar(
              onHomePressed: () => _scrollToSection(_heroKey),
              onAboutPressed: () => _scrollToSection(_aboutKey),
              onSkillsPressed: () => _scrollToSection(_skillsKey),
              onProjectsPressed: () => _scrollToSection(_projectsKey),
              onContactPressed: () => _scrollToSection(_contactKey),
            ),

            HeroSection(key: _heroKey),

            AboutSection(key: _aboutKey),

            SkillsSection(key: _skillsKey),

            ProjectsSection(key: _projectsKey),

            ContactSection(key: _contactKey),
          ],
        ),
      ),
    );
  }
}
