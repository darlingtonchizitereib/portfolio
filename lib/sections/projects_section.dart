// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 70,
        vertical: isMobile ? 50 : 90,
      ),

      // =========================
      // MAIN SECTION COLUMN
      // =========================
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =========================
          // SECTION HEADER
          // =========================
          _buildSectionHeader(isMobile),

          const SizedBox(height: 18),

          // =========================
          // SECTION DESCRIPTION
          // =========================
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: const Text(
              "A showcase of products I am building to solve meaningful financial and technology problems across Africa and beyond.",
              style: TextStyle(
                color: Color(0xFFE8E8E8),
                fontSize: 16,
                height: 1.7,
              ),
            ),
          ),

          const SizedBox(height: 40),

          // =========================
          // FEATURED PROJECT
          // =========================
          _featuredProject(isMobile),

          const SizedBox(height: 26),

          // =========================
          // SECONDARY PROJECTS
          // =========================
          isMobile
              ? Column(
                  children: [
                    _smallProjectCard(
                      title: "Primus",
                      imagePath: 'assets/images/projects/primus_preview.png',
                      description:
                          "School fee management and SMS automation platform for educational institutions.",
                      technologies: const ["Next.js", "Supabase", "SMS"],
                    ),
                    const SizedBox(height: 22),
                    _smallProjectCard(
                      title: "Portfolio Website",
                      imagePath: "assets/images/projects/portfolio_preview.png",
                      description:
                          "Premium personal portfolio built with Flutter Web to showcase engineering projects and product thinking.",
                      technologies: const ["Flutter", "Firebase", "Web"],
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: HoverProjectCard(
                        child: _smallProjectCard(
                          title: "Primus",
                          imagePath:
                              "assets/images/projects/primus_preview.png",
                          description:
                              "School fee management and SMS automation platform for educational institutions.",
                          technologies: const ["Next.js", "Supabase", "SMS"],
                          liveDemoUrl:
                              "https://primus-beta.vercel.app/dashboard",
                        ),
                      ),
                    ),

                    const SizedBox(width: 22),

                    Expanded(
                      child: HoverProjectCard(
                        child: _smallProjectCard(
                          title: "Portfolio Website",
                          imagePath: "assets/images/projects/portfolio.png",
                          description:
                              "Premium personal portfolio built with Flutter Web to showcase engineering projects and product thinking.",
                          technologies: const ["Flutter", "Firebase", "Web"],
                          liveDemoUrl: null,
                        ),
                      ),
                    ),
                  ],
                ),

          const SizedBox(height: 55),

          // =========================
          // GOLD DIVIDER
          // =========================
          _buildGoldDivider(isMobile),
        ],
      ),
    );
  }

  // =========================================================
  // SECTION HEADER
  // =========================================================
  Widget _buildSectionHeader(bool isMobile) {
    return Row(
      children: [
        Text(
          "Featured Projects",
          style: TextStyle(
            color: const Color(0xFFF8F8F8),
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
    );
  }

  // =========================================================
  // FEATURED PROJECT CARD
  // =========================================================
  Widget _featuredProject(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 18 : 24),
      decoration: _cardDecoration(),

      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _featuredImage(),
                const SizedBox(height: 22),
                _featuredText(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _featuredImage()),
                const SizedBox(width: 28),
                Expanded(flex: 4, child: _featuredText()),
              ],
            ),
    );
  }

  // =========================================================
  // FEATURED IMAGE
  // =========================================================
  Widget _featuredImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),

          child: Image.asset(
            "assets/images/projects/afripay_mockup.png",
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
        ),

        Positioned(
          top: 14,
          left: 14,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Text(
              "FEATURED PROJECT",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 11,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // =========================================================
  // FEATURED TEXT CONTENT
  // =========================================================
  Widget _featuredText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "AfriPay MVP",
          style: TextStyle(
            color: Color(0xFFF8F8F8),
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 16),

        const Text(
          "Cross-border fintech infrastructure designed for African transactions with real-time currency exchange, secure wallet authentication, and scalable payment architecture.",
          style: TextStyle(color: Color(0xFFD9D9D9), fontSize: 13, height: 1.7),
        ),

        const SizedBox(height: 19),

        // TECHNOLOGY CHIPS
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            _TechChip("Flutter"),
            _TechChip("Firebase"),
            _TechChip("REST API"),
            _TechChip("Clean Architecture"),
          ],
        ),

        const SizedBox(height: 26),

        // ACTION BUTTONS
        /* Row(
          children: [
            Expanded(
              child: _actionButton(
                text: "Live Demo",
                filled: true,
                enabled: false,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _actionButton(
                text: "GitHub",
                filled: false,
                enabled: false,
              ),
            ),
          ],
        ),*/
        // COMING SOON BUTTON
        SizedBox(width: double.infinity, child: _comingSoonButton()),
      ],
    );
  }

  // =========================================================
  // SMALL PROJECT CARD
  // =========================================================
  /*Widget _smallProjectCard({
    required String title,
    required String imagePath,
    required String description,
    required List<String> technologies,
    String? liveDemoUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: _cardDecoration(),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PROJECT IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 22),

          // PROJECT TITLE
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFF8F8F8),
              fontSize: 26,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 12),

          // PROJECT DESCRIPTION
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFFD9D9D9),
              fontSize: 12,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 18),

          // TECHNOLOGY CHIPS
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: technologies.map((e) => _TechChip(e)).toList(),
          ),

          const SizedBox(height: 22),

          // ACTION BUTTONS
          Row(
            children: [
              Expanded(
                child: _actionButton(
                  text: "Live Demo",
                  filled: true,
                  enabled: true,
                 url: liveDemoUrl,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _actionButton(
                  text: "GitHub",
                  filled: false,
                  enabled: false,
                ),
              ),
            ],
          ),
          // COMING SOON BUTTON
          //SizedBox(width: double.infinity, child: _comingSoonButton()),
        ],
      ),
    );
  }*/

  // =========================================================
  // SMALL PROJECT CARD
  // =========================================================
  Widget _smallProjectCard({
    required String title,
    required String imagePath,
    required String description,
    required List technologies,
    String? liveDemoUrl,
  }) {
    return HoverProjectCard(
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: _cardDecoration(),

        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobileCard = constraints.maxWidth < 520;

            // =========================
            // MOBILE → STACKED
            // =========================
            if (isMobileCard) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      imagePath,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 22),

                  _smallProjectContent(
                    title: title,
                    description: description,
                    technologies: technologies,
                    liveDemoUrl: liveDemoUrl,
                  ),
                ],
              );
            }

            // =========================
            // DESKTOP → HORIZONTAL
            // =========================
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 230,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      imagePath,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(width: 22),

                Expanded(
                  child: _smallProjectContent(
                    title: title,
                    description: description,
                    technologies: technologies,
                    liveDemoUrl: liveDemoUrl,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // =========================================================
  // SMALL PROJECT CONTENT
  // =========================================================
  Widget _smallProjectContent({
    required String title,
    required String description,
    required List technologies,
    String? liveDemoUrl,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PROJECT TITLE
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFF7F7F7),
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 12),

        // PROJECT DESCRIPTION
        Text(
          description,
          style: const TextStyle(
            color: Color(0xFFE2E2E2),
            fontSize: 13,
            height: 1.7,
          ),
        ),

        const SizedBox(height: 18),

        // TECHNOLOGY CHIPS
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: technologies.map((e) => _TechChip(e.toString())).toList(),
        ),

        const SizedBox(height: 22),

        // ACTION BUTTONS (UNCHANGED)
        Row(
          children: [
            Expanded(
              child: _actionButton(
                text: "Live Demo",
                filled: true,
                enabled: liveDemoUrl != null,
                url: liveDemoUrl,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: _actionButton(
                text: "GitHub",
                filled: false,
                enabled: false,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // =========================================================
  // BOTTOM GOLD DIVIDER
  // =========================================================
  Widget _buildGoldDivider(bool isMobile) {
    return Center(
      child: Container(
        width: isMobile ? 220 : 900,
        height: 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              AppColors.gold.withOpacity(0.22),
              AppColors.gold.withOpacity(0.45),
              AppColors.gold.withOpacity(0.22),
              Colors.transparent,
            ],
          ),
          boxShadow: [
            BoxShadow(color: AppColors.gold.withOpacity(0.10), blurRadius: 12),
          ],
        ),
      ),
    );
  }
}

// ===========================================================
// TECHNOLOGY CHIP
// ===========================================================
class _TechChip extends StatelessWidget {
  final String label;

  const _TechChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1E24),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.gold.withOpacity(0.16)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFFF3F3F3),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// =========================================================
// HOVER PROJECT CARD
// =========================================================
class HoverProjectCard extends StatefulWidget {
  final Widget child;

  const HoverProjectCard({super.key, required this.child});

  @override
  State<HoverProjectCard> createState() => _HoverProjectCardState();
}

class _HoverProjectCardState extends State<HoverProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.gold.withOpacity(0.14),
                    blurRadius: 26,
                    spreadRadius: 1,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}

// =========================================================
// PREMIUM CARD DECORATION
// =========================================================
BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: const Color(0xFF14171D),
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: AppColors.gold.withOpacity(0.18), width: 1.1),
    boxShadow: [
      BoxShadow(
        color: AppColors.gold.withOpacity(0.04),
        blurRadius: 26,
        spreadRadius: 1,
      ),
    ],
  );
}

// =========================================================
// ACTION BUTTON
// =========================================================
// ignore: unused_element
Widget _actionButton({
  required String text,
  required bool filled,
  required bool enabled,
  String? url,
}) {
  return SizedBox(
    height: 48,
    child: ElevatedButton(
      onPressed: enabled && url != null
          ? () async {
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            }
          : null,

      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: filled ? AppColors.gold : Colors.transparent,
        foregroundColor: filled
            ? Colors.black
            : const Color.fromARGB(255, 255, 255, 255),
        disabledBackgroundColor: filled
            ? AppColors.gold.withOpacity(1.0)
            : Colors.transparent,
        disabledForegroundColor: filled
            ? Colors.black87
            : const Color.fromARGB(255, 255, 255, 255),
        side: BorderSide(color: AppColors.gold.withOpacity(filled ? 0 : 0.85)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    ),
  );
}

// =========================================================
// COMING SOON BUTTON
// =========================================================
Widget _comingSoonButton() {
  return SizedBox(
    height: 48,
    child: ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        disabledBackgroundColor: const Color(0xFF1B1E24),
        disabledForegroundColor: const Color(0xFFF3F3F3),
        side: BorderSide(color: AppColors.gold.withOpacity(0.32)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.schedule_rounded,
            size: 18,
            color: AppColors.gold.withOpacity(0.85),
          ),
          const SizedBox(width: 8),
          const Text(
            "Coming Soon",
            style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.2),
          ),
        ],
      ),
    ),
  );
}
