import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';
//import 'package:url_launcher/url_launcher.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;

class CustomNavbar extends StatefulWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onContactPressed;

  const CustomNavbar({
    super.key,
    required this.onHomePressed,
    required this.onAboutPressed,
    required this.onSkillsPressed,
    required this.onProjectsPressed,
    required this.onContactPressed,
  });

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  bool _isMenuOpen = false;

  void _openResume() {
  html.window.open(
    'assets/images/resume/Ibe_Darlington_Chizitere_Resume_MAIN.pdf',
    '_blank',
  );
}

  @override
  Widget build(BuildContext context) {
    Widget buildDesktopNavbar() {
      return Column(
        children: [
          Container(
            color: AppColors.background,
            
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15,11,15,10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // LEFT NAVIGATION
                  Expanded(
                    child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: widget.onHomePressed,
                          child: const Text("Home"),
                        ),
              
                        const SizedBox(width: 12),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: widget.onAboutPressed,
                          child: const Text("About"),
                        ),
              
                        const SizedBox(width: 12),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: widget.onSkillsPressed,
                          child: const Text("Skills"),
                        ),
              
                        const SizedBox(width: 12),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: widget.onProjectsPressed,
                          child: const Text("Projects"),
                        ),
              
                        const SizedBox(width: 12),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: widget.onContactPressed,
                          child: const Text("Contact"),
                        ),
                      ],
                    ),
                  ),
              
                  // CENTER LOGO
                  Row(
                    children: [
                      Container(
                        width: 33,
                        height: 33,
                        decoration: BoxDecoration(
                          color: AppColors.gold,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.hexagon_outlined,
                          color: Colors.black,
                          size: 22,
                        ),
                      ),
              
                      const SizedBox(width: 10),
              
                      const Text(
                        "DARLINGTON IBE",
                        style: TextStyle(
                          color: AppColors.gold,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
              
                  // RIGHT SIDE
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.gold),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 23,
                              vertical: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: _openResume,
                          child: const Text(
                            "Resume",
                            style: TextStyle(
                              color: AppColors.gold,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
              
                        const SizedBox(width: 9),
              
                        Stack(
                          children: [
                            const CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage(
                                "assets/images/image.png",
                              ),
                            ),
              
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.background,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // THIN PREMIUM DIVIDER
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.yellow.withValues(alpha: 0.2),
          ),
        ],
      );
    }

    Widget buildMobileNavbar() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "DARLINGTON IBE",
                  style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isMenuOpen = !_isMenuOpen;
                    });
                  },
                  icon: const Icon(Icons.menu, color: Colors.white),
                ),
              ],
            ),

            if (_isMenuOpen) ...[
              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  widget.onHomePressed();
                  setState(() => _isMenuOpen = false);
                },
                child: const Text("Home"),
              ),

              TextButton(
                onPressed: () {
                  widget.onAboutPressed();
                  setState(() => _isMenuOpen = false);
                },
                child: const Text("About"),
              ),

              TextButton(
                onPressed: () {
                  widget.onSkillsPressed();
                  setState(() => _isMenuOpen = false);
                },
                child: const Text("Skills"),
              ),

              TextButton(
                onPressed: () {
                  widget.onProjectsPressed();
                  setState(() => _isMenuOpen = false);
                },
                child: const Text("Projects"),
              ),

              TextButton(
                onPressed: () {
                  widget.onContactPressed();
                  setState(() => _isMenuOpen = false);
                },
                child: const Text("Contact"),
              ),
            ],
          ],
        ),
      );
    }

    final isMobile = Responsive.isMobile(context);

    return isMobile ? buildMobileNavbar() : buildDesktopNavbar();
  }
}
