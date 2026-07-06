import 'package:flutter/material.dart';
import '../widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Technical Arsenal",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "A curated stack of technologies I use to build robust, scalable, and beautiful digital products.",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),

          const SizedBox(height: 40),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.9,
            children: const [
              SkillCard(
                icon: Icons.phone_android,
                title: "Flutter",
                description: "Cross-platform apps from a single codebase.",
              ),

              SkillCard(
                icon: Icons.code,
                title: "Dart",
                description: "Modern language powering Flutter applications.",
              ),

              SkillCard(
                icon: Icons.storage,
                title: "Firebase",
                description: "Authentication, Firestore and Cloud Functions.",
              ),

              SkillCard(
                icon: Icons.api,
                title: "REST APIs",
                description: "Building and consuming scalable APIs.",
              ),

              SkillCard(
                icon: Icons.source,
                title: "Git & GitHub",
                description: "Version control and collaborative development.",
              ),

              SkillCard(
                icon: Icons.design_services,
                title: "UI/UX",
                description: "Creating intuitive user experiences.",
              ),

              SkillCard(
                icon: Icons.psychology,
                title: "Problem Solving",
                description: "Breaking down complex engineering problems.",
              ),

              SkillCard(
                icon: Icons.account_tree,
                title: "Architecture",
                description: "Writing maintainable and scalable software.",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
