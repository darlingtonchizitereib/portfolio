import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/contact_info_card.dart';
import '../constants/app_colors.dart';
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
        vertical: isMobile ? 30 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Get in Touch",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 32 : 40,
                  fontWeight: FontWeight.bold,
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
          const SizedBox(height: 16),
          const Text(
            "I'm always interested in discussing software engineering, fintech, startups, and opportunities to build impactful products.",
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          ),
          const SizedBox(height: 48),

          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoColumn(),
                    const SizedBox(height: 40),
                    const _ContactForm(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: _buildInfoColumn()),
                    const SizedBox(width: 40),
                    Expanded(flex: 6, child: const _ContactForm()),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Contact Information",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          "Feel free to reach out via the form or through my professional channels. I typically respond within 24 hours.",
          style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.2),
        ),
        const SizedBox(height: 25),

        ContactInfoCard(
          icon: Icons.email_outlined,
          title: "Email Me",
          value: "darlingtonibe09@gmail.com",
          compact: true,
          onTap: () => launchURL("mailto:darlingtonibe09@gmail.com"),
        ),
        const SizedBox(height: 12),

        ContactInfoCard(
          icon: Icons.business_center_outlined,
          title: "Connect",
          value: "linkedin.com/in/darlington-chizitere-ibe-4ba3613a2",
          compact: true,
          onTap: () => launchURL(
            "https://www.linkedin.com/in/darlington-chizitere-ibe-4ba3613a2",
          ),
        ),
        const SizedBox(height: 12),

        ContactInfoCard(
          icon: Icons.code,
          title: "Codebase",
          value: "https://github.com/darlingtonchizitereib",
          compact: true,
          onTap: () => launchURL("https://github.com/darlingtonchizitereib"),
        ),
        const SizedBox(height: 12),

        const ContactInfoCard(
          icon: Icons.location_on_outlined,
          title: "Location",
          value: "California",
          compact: true,
        ),
        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.gold.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.gold.withValues(alpha: 0.35),
              width: 1,
            ),
          ),
          child: const Text(
            '"Designing software is like composing a symphony; every line of code should play in harmony."',
            style: TextStyle(
              color: AppColors.gold,
              fontSize: 14,
              fontStyle: FontStyle.italic,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}

// =========================================================
// CONTACT FORM (functional — sends via EmailJS)
// =========================================================
class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSending = false;

  // TODO: replace with your real EmailJS values (see steps below)
  static const String _serviceId = 'service_xcgn5qc';
  static const String _templateId = 'template_lf6q78q';
  static const String _publicKey = 'KPKgW0YlLbefmuqv4';

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSending = true);

    try {
      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'service_id': _serviceId,
          'template_id': _templateId,
          'user_id': _publicKey,
          'template_params': {
            'first_name': _firstNameController.text.trim(),
            'last_name': _lastNameController.text.trim(),
            'email': _emailController.text.trim(),
            'message': _messageController.text.trim(),
          },
        }),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        _firstNameController.clear();
        _lastNameController.clear();
        _emailController.clear();
        _messageController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Message sent — thanks for reaching out!'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Something went wrong. Please try again.'),
          ),
        );
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Network error. Please try again.')),
      );
    } finally {
      if (mounted) setState(() => _isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.18),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.06),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildField(
                    label: "First Name",
                    hint: "John",
                    controller: _firstNameController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildField(
                    label: "Last Name",
                    hint: "Doe",
                    controller: _lastNameController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildField(
              label: "Email Address",
              hint: "john@example.com",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Required';
                if (!v.contains('@') || !v.contains('.')) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            _buildField(
              label: "Message",
              hint: "Tell me about your project...",
              controller: _messageController,
              maxLines: 5,
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _isSending ? null : _sendMessage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: _isSending
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          color: Colors.black,
                        ),
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Send Message',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.send, size: 18),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          validator:
              validator ??
              (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white38),
            filled: true,
            fillColor: Colors.black.withValues(alpha: 0.25),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.gold, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}
