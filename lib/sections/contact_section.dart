import 'package:flutter/material.dart';
import '../widgets/contact_info_card.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Let's Build Something Great Together",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "I'm always interested in discussing software engineering, fintech, startups, and opportunities to build impactful products.",
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          ),

          const SizedBox(height: 40),

          const ContactInfoCard(
            icon: Icons.email_outlined,
            title: "Email",
            value: "your@email.com",
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

          const ContactInfoCard(
            icon: Icons.business_center_outlined,
            title: "LinkedIn",
            value: "linkedin.com/in/yourusername",
          ),

          const SizedBox(height: 40),

          ElevatedButton(
            onPressed: () {},
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
