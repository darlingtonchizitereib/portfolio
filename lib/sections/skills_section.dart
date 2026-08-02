// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final skills = [
      SkillItem(
        icon: Icons.phone_iphone_outlined,
        title: 'Flutter',
        description:
            'Building high-performance cross-platform apps from a single codebase.',
      ),
      SkillItem(
        icon: Icons.code_outlined,
        title: 'Dart',
        description:
            'Writing clean, maintainable application logic with modern Dart.',
      ),
      SkillItem(
        icon: Icons.storage_outlined,
        title: 'Firebase',
        description:
            'Authentication, Firestore, Cloud Functions, and scalable backend services.',
      ),
      SkillItem(
        icon: Icons.dns_outlined,
        title: 'REST APIs',
        description:
            'Designing and consuming secure, production-ready API integrations.',
      ),
      SkillItem(
        icon: Icons.folder_open_outlined,
        title: 'Git & GitHub',
        description:
            'Version control workflows, collaboration, branching, and CI/CD practices.',
      ),
      SkillItem(
        icon: Icons.grid_view_outlined,
        title: 'UI/UX Design',
        description:
            'Crafting intuitive interfaces with strong visual hierarchy and usability.',
      ),
      SkillItem(
        icon: Icons.manage_search_outlined,
        title: 'Problem Solving',
        description:
            'Debugging, optimization, and analytical thinking for complex systems.',
      ),
      SkillItem(
        icon: Icons.layers_outlined,
        title: 'System Architecture',
        description:
            'Designing modular, scalable, and maintainable software structures.',
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 70,
        vertical: isMobile ? 22 : 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading + gold dash
          Row(
            children: [
              Text(
                'Technical Arsenal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 34 : 42,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 14),
              Container(
                width: 48,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: const Text(
              'A carefully selected stack of technologies I use to build scalable, performant, and user-focused digital products.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: 34),

          // Compact responsive grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = isMobile ? 2 : 4;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skills.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: isMobile ? 0.95 : 1.08,
                ),
                itemBuilder: (context, index) {
                  return HoverSkillCard(
                    skill: skills[index],
                    isMobile: isMobile,
                  );
                },
              );
            },
          ),

          const SizedBox(height: 48),

          // Premium bottom divider
          Center(
            child: Container(
              width: isMobile ? 220 : 900,
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
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gold.withOpacity(0.08),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillItem {
  final IconData icon;
  final String title;
  final String description;

  SkillItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class HoverSkillCard extends StatefulWidget {
  final SkillItem skill;
  final bool isMobile;

  const HoverSkillCard({
    super.key,
    required this.skill,
    required this.isMobile,
  });

  @override
  State<HoverSkillCard> createState() => _HoverSkillCardState();
}

class _HoverSkillCardState extends State<HoverSkillCard> {
  bool _isHovered = false;
  bool _isPressed = false;

  // ignore: unused_element
  void _setActive(bool value) {
    setState(() {
      _isHovered = value;
      _isPressed = value;
    });
  }

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
          padding: EdgeInsets.all(widget.isMobile ? 16 : 18),
          decoration: BoxDecoration(
            color: active ? const Color(0xFF171B25) : const Color(0xFF111318),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: active
                  ? AppColors.gold.withOpacity(0.45)
                  : AppColors.gold.withOpacity(0.16),
              width: active ? 1.4 : 1,
            ),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: AppColors.gold.withOpacity(0.14),
                      blurRadius: 26,
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
                      blurRadius: 18,
                      spreadRadius: 1,
                    ),
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
                width: widget.isMobile ? 44 : 48,
                height: widget.isMobile ? 44 : 48,
                decoration: BoxDecoration(
                  color: active
                      ? AppColors.gold.withOpacity(0.14)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: active
                        ? AppColors.gold.withOpacity(0.28)
                        : Colors.transparent,
                  ),
                ),
                child: Icon(
                  widget.skill.icon,
                  color: AppColors.gold,
                  size: widget.isMobile ? 24 : 26,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                widget.skill.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: widget.isMobile ? 17 : 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: Text(
                  widget.skill.description,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: widget.isMobile ? 12 : 13,
                    height: 1.45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
