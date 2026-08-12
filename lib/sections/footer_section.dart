// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 70,
        vertical: isMobile ? 32 : 52,
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1))),
      ),
      child: isMobile
          ? Column(
              children: [
                _brandBlock(isMobile),
                const SizedBox(height: 10),
                _socialRow(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _brandBlock(isMobile),
                _socialRow(),
              ],
            ),
    );
  }

  Widget _brandBlock(bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.hexagon_outlined, color: AppColors.gold, size: 20),
            const SizedBox(width: 6),
            const Text(
              "Darlington Ibe Portfolio",
              style: TextStyle(
                color: AppColors.gold,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          "© 2026 Darlington Ibe. All rights reserved.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: const TextStyle(color: Colors.white, fontSize: 12.5),
        ),
      ],
    );
  }

  Widget _socialRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _socialIcon(
          //icon: Icons.code,
          icon: Icons.code,
          url: "https://github.com/darlingtonchizitereib",
        ),
        const SizedBox(width: 14),
        _socialIcon(
          icon: Icons.business_center_outlined,
          url:
              "https://www.linkedin.com/in/darlington-chizitere-ibe-4ba3613a2",
        ),
        const SizedBox(width: 14),
        // TODO: swap icon/url once you have a real X/Twitter handle — disabled for now
        _socialIcon(icon: Icons.close, url: null),
        const SizedBox(width: 14),
        _socialIcon(
          icon: Icons.alternate_email,
          url: "mailto:darlingtonibe09@gmail.com",
        ),
      ],
    );
  }

  Widget _socialIcon({required IconData icon, String? url}) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: url != null
          ? () async {
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            }
          : null,
      child: Icon(
        icon,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}