// ignore_for_file: unused_field, unused_element

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/custom_navbar.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/projects_section.dart';
import '../sections/contact_section.dart';
//import '../sections/hero_section_v2.dart';

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

      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 90), // space for fixed navbar

                HeroSection(
                  key: _heroKey,
                  onProjectsPressed: () => _scrollToSection(_projectsKey),
                  onContactPressed: () => _scrollToSection(_contactKey),
                ),

                AboutSection(key: _aboutKey),

                SkillsSection(key: _skillsKey),

                ProjectsSection(key: _projectsKey),

                ContactSection(key: _contactKey),
              ],
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Material(
              elevation: 6,
              color: AppColors.background,
              child: SafeArea(
                bottom: false,
                child: CustomNavbar(
                  onHomePressed: () => _scrollToSection(_heroKey),
                  onAboutPressed: () => _scrollToSection(_aboutKey),
                  onSkillsPressed: () => _scrollToSection(_skillsKey),
                  onProjectsPressed: () => _scrollToSection(_projectsKey),
                  onContactPressed: () => _scrollToSection(_contactKey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
