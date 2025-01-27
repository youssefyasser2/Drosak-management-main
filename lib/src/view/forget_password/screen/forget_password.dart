import 'package:drosak/src/core/resources/routes_mananger.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18171C), // Black background
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              // Logo (optional)
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color(0xff8012DC), // Purple circle
                  child: Image.asset(
                    'assets/images/logo.png', // Replace with your logo path
                    width: 40, // Adjust size as needed
                    height: 40, // Adjust size as needed
                    color: Colors.white, // White color for the logo
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Title Text
              const Text(
                'نسيت كلمة السر؟',
                style: TextStyle(
                  fontFamily: 'AA-GALAXY', // Custom font
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'أدخل بريدك الإلكتروني لإعادة تعيين كلمة السر',
                style: TextStyle(
                  fontFamily: 'AA-GALAXY', // Custom font
                  fontSize: 16,
                  color: Colors.grey, // Grey text
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Email Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xff292A33), // Dark grey background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Color(0xff8012DC)), // Purple border
                  ),
                  prefixIcon: const Icon(Icons.email, color: Colors.grey),
                ),
                style: const TextStyle(color: Colors.white), // White text
              ),
              const SizedBox(height: 30),

              // Reset Password Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add logic to send reset password email
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff8012DC), // Purple button
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5, // Button shadow
                  ),
                  child: const Text(
                    'إعادة تعيين كلمة السر',
                    style: TextStyle(
                      fontFamily: 'AA-GALAXY', // Custom font
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Back to Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RoutesName.kLoginScreenRoute);
                    },
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontFamily: 'AA-GALAXY', // Custom font
                        fontSize: 14,
                        color: Color(0xff8012DC), // Purple text
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    'تذكرت كلمة السر؟',
                    style: TextStyle(
                      fontFamily: 'AA-GALAXY', // Custom font
                      fontSize: 14,
                      color: Colors.white, // White text
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
