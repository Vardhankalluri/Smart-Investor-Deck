import 'package:flutter/material.dart';

import '../../utilities/styles.dart';
import '../../widgets/contact_us_dialog.dart'; // <-- 1. IMPORT THE NEW DIALOG

// Helper widget for creating text with a gradient fill
class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {
        super.key,
        required this.gradient,
        this.style,
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                // --- HEADER ---
                GradientText(
                  "Unlock Your Complete Business Report!",
                  style: AppStyles.title.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF8B0000), // Dark Red
                      AppStyles.redColor,
                      Color(0xFF4A0000), // Darker Red/Black
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Pay Once – No Recurring Fees.",
                  style: AppStyles.subtitle.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  "Access your full business report and make unlimited updates or revisions anytime.",
                  textAlign: TextAlign.center,
                  style: AppStyles.subtitle.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 40),

                // --- PLAN CARDS ---
                Wrap(
                  spacing: 24, // Horizontal space between cards
                  runSpacing: 24, // Vertical space if they wrap
                  alignment: WrapAlignment.center,
                  children: [
                    _buildPlanCard(
                      title: "Solo",
                      ideaCount: 1,
                      price: "\$39.00",
                      description: "Solo plan for 1 Business Idea",
                    ),
                    _buildPlanCard(
                      title: "Growth Pack",
                      ideaCount: 10,
                      price: "\$126.00",
                      description: "10 Business Ideas",
                    ),
                    _buildPlanCard(
                      title: "Scale Ultra Pack",
                      ideaCount: 20,
                      price: "\$146.00",
                      description: "20 Business Ideas",
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // --- ENTERPRISE CARD ---
                _buildEnterpriseCard(context), // Pass context to the builder
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required int ideaCount,
    required String price,
    required String description,
  }) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppStyles.defaultBorderColor.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.title.copyWith(fontSize: 20)),
          const SizedBox(height: 12),
          Text("No of Business Ideas: $ideaCount", style: AppStyles.subtitle),
          const SizedBox(height: 12),
          Text(
            price,
            style: AppStyles.title.copyWith(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppStyles.redColor,
            ),
          ),
          const SizedBox(height: 12),
          Text(description, style: AppStyles.subtitle),
        ],
      ),
    );
  }

  Widget _buildEnterpriseCard(BuildContext context) { // Accept context here
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppStyles.skyBlueColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppStyles.defaultBorderColor.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enterprise", style: AppStyles.title.copyWith(fontSize: 20)),
                const SizedBox(height: 8),
                Text(
                  "Personalized Business Ideas Designed for You",
                  style: AppStyles.subtitle,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () => showContactUsDialog(context), // <-- 2. SHOW THE DIALOG
            style: ElevatedButton.styleFrom(
              backgroundColor: AppStyles.redColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text("Contact Us", style: AppStyles.buttonText.copyWith(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
