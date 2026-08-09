import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;
  final bool compact;

  const ContactInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 0 : 20,
          vertical: compact ? 10 : 20,
        ),
        decoration: compact
            ? null
            : BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white10),
              ),
        child: Row(
          children: [
            CircleAvatar(
              radius: compact ? 20 : 24,
              backgroundColor: AppColors.gold.withValues(alpha: 0.15),
              child: Icon(icon, color: AppColors.gold, size: compact ? 18 : 24),
            ),
            SizedBox(width: compact ? 16 : 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    compact ? title.toUpperCase() : title,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: compact ? 11 : 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: compact ? 0.6 : 0,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: compact ? 16 : 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}