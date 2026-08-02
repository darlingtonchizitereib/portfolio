import 'package:flutter/material.dart';
import '../widgets/contact_info_card.dart';
import '../utils/responsive.dart';
import '../utils/launch_helper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 50 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's Build Something Great Together",
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 32 : 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "I'm always interested in discussing software engineering, fintech, startups, and opportunities to build impactful products.",
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          ),

          const SizedBox(height: 40),

          ContactInfoCard(
            icon: Icons.email_outlined,
            title: "Email",
            value: "dchizitere347@gmail.com",
            onTap: () => launchURL("mailto:dchizitere347@gmail.com"),
          ),
          const SizedBox(height: 20),

          const ContactInfoCard(
            icon: Icons.location_on_outlined,
            title: "Location",
            value: "Nigeria",
          ),

          const SizedBox(height: 20),

          const ContactInfoCard(
            icon: Icons.code,
            title: "GitHub",
            value: "github.com/yourusername",
          ),

          const SizedBox(height: 20),

          ContactInfoCard(
            icon: Icons.business_center_outlined,
            title: "LinkedIn",
            value: "www.linkedin.com/in/darlington-chizitere-ibe-4ba3613a2",
            onTap: () => launchURL("https://linkedin.com/in/yourusername"),
          ),

          const SizedBox(height: 40),

          ElevatedButton(
           onPressed: () => launchURL("mailto:your@email.com"),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              child: Text("Get In Touch"),
            ),
          ),
        ],
      ),
    );
  }
}
