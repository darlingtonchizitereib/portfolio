import 'package:flutter/material.dart';
import '../widgets/projects_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Featured Projects",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "A selection of products I've built to solve real-world problems.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 40),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 0.65,
            children: const [
              ProjectCard(
                title: "AfriPay",
                description:
                    "Cross-border fintech platform enabling seamless payments across Africa.",
                technologies: [
                  "Flutter",
                  "Supabase",
                  "REST API",
                ],
                imagePath: "assets/images/image.png",
              ),
              ProjectCard(
                title: "Primus",
                description:
                    "School fee management and SMS automation platform for educational institutions.",
                technologies: [
                  "Next.js",
                  "Firebase",
                  "SMS",
                ],
                imagePath: "assets/images/image.png",
              ),
              ProjectCard(
                title: "Portfolio Website",
                description:
                    "Personal portfolio built with Flutter Web to showcase projects and software engineering capability.",
                technologies: [
                  "Flutter Web",
                  "Git",
                  "Responsive UI",
                ],
                imagePath: "assets/images/image.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}