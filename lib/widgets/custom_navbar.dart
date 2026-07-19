import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';

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

  @override
  Widget build(BuildContext context) {
    Widget buildDesktopNavbar() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Row(
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
            Row(
              children: [
                TextButton(
                  onPressed: widget.onHomePressed,
                  child: const Text("Home"),
                ),
                TextButton(
                  onPressed: widget.onAboutPressed,
                  child: const Text("About"),
                ),
                TextButton(
                  onPressed: widget.onSkillsPressed,
                  child: const Text("Skills"),
                ),
                TextButton(
                  onPressed: widget.onProjectsPressed,
                  child: const Text("Projects"),
                ),
                TextButton(
                  onPressed: widget.onContactPressed,
                  child: const Text("Contact"),
                ),
              ],
            ),
          ],
        ),
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
