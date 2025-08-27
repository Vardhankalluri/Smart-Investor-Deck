import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import '../../routes/app_pages.dart'; // <-- 1. IMPORT APP PAGES
import '../../utilities/styles.dart';

// --- NEW WIDGET FOR GRADIENT TEXT ---
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


class BusinessIdeasScreen extends StatefulWidget {
  const BusinessIdeasScreen({super.key});

  @override
  State<BusinessIdeasScreen> createState() => _BusinessIdeasScreenState();
}

class _BusinessIdeasScreenState extends State<BusinessIdeasScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedLanguage = 'English';
  final List<String> _languages = ['English', 'Spanish', 'French', 'German'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    // USE THE NEW GRADIENT WIDGET
                    child: GradientText(
                      "Create Business Ideas",
                      style: AppStyles.title.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF8B0000), // Dark Red
                          AppStyles.redColor,
                          Color(0xFF4A0000), // Darker Red/Black
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      "Enter your business website URL to auto-fill details, or skip and enter them manually.",
                      textAlign: TextAlign.center,
                      style: AppStyles.subtitle,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Business Name Field
                  Text("Enter Business Name *", style: AppStyles.label),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: AppStyles.getInputDecoration(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Business name is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Website URL Field
                  Text("Enter website URL", style: AppStyles.label),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: AppStyles.getInputDecoration(),
                    validator: (value) {
                      if (value != null && value.isNotEmpty && !GetUtils.isURL(value)) {
                        return "Enter a valid website URL (e.g., https://example.com)";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Language Dropdown
                  Text("Select Language", style: AppStyles.label),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _selectedLanguage,
                    decoration: AppStyles.getInputDecoration(),
                    items: _languages.map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLanguage = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 40),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        // <-- 2. ADD NAVIGATION LOGIC
                        onPressed: () => Get.offAllNamed(AppPages.dashboard),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppStyles.redColor,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        child: Text("Cancel", style: AppStyles.buttonText),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle next action
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppStyles.blueColor,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        child: Text("Next", style: AppStyles.buttonText),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
