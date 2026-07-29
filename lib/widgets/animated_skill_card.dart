import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AnimatedSkillCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const AnimatedSkillCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<AnimatedSkillCard> createState() => _AnimatedSkillCardState();
}

class _AnimatedSkillCardState extends State<AnimatedSkillCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,

        transform: Matrix4.identity()
          ..translate(
            0.0,
            hovering ? -8.0 : 0.0,
          ),

        decoration: BoxDecoration(
          color: hovering
              ? AppColors.card.withValues(alpha: .95)
              : AppColors.card,

          borderRadius: BorderRadius.circular(16),

          border: Border.all(
            color: hovering
                ? AppColors.gold
                : Colors.white10,
          ),

          boxShadow: hovering
              ? [
                  BoxShadow(
                    color: AppColors.gold.withValues(alpha: .15),
                    blurRadius: 20,
                    spreadRadius: 2,
                  )
                ]
              : [],
        ),

        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Icon(
              widget.icon,
              color: AppColors.gold,
              size: 30,
            ),

            const SizedBox(height: 20),

            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              widget.description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}