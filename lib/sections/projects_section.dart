import 'package:flutter/material.dart';
import '../widgets/projects_card.dart';
import '../utils/responsive.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final isTablet =
        MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1100;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 50 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Featured Projects",
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 32 : 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "A selection of products I've built to solve real-world problems.",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),

          const SizedBox(height: 40),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile
                ? 1
                : isTablet
                ? 2
                : 3,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 0.65,
            children: const [
              ProjectCard(
                title: "AfriPay",
                description:
                    "Cross-border fintech platform enabling seamless payments across Africa.",
                technologies: ["Flutter", "Supabase", "REST API"],
                imagePath: "assets/images/image.png",
              ),
              ProjectCard(
                title: "Primus",
                description:
                    "School fee management and SMS automation platform for educational institutions.",
                technologies: ["Next.js", "Firebase", "SMS"],
                imagePath: "assets/images/image.png",
              ),
              ProjectCard(
                title: "Portfolio Website",
                description:
                    "Personal portfolio built with Flutter Web to showcase projects and software engineering capability.",
                technologies: ["Flutter Web", "Git", "Responsive UI"],
                imagePath: "assets/images/image.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
