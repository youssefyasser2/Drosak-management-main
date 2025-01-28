import 'package:drosak/src/core/resources/routes_mananger.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final userForm = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      )
          .then((userCredential) {
        // Signed in successfully, show the home screen
        print("User signed in successfully: ${userCredential.user?.uid}");
        Navigator.pushReplacementNamed(context, RoutesName.kMainScreenRoute);
      }).catchError((error) {
        // Handle error
        print("Error signing in: $error");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18171C), // Black background
      body: SingleChildScrollView(
        child: Form(
          key: userForm,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 80),
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
                // Welcome Text
                const Text(
                  'مرحبًا بعودتك!',
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
                  'يرجى تسجيل الدخول إلى حسابك',
                  style: TextStyle(
                    fontFamily: 'AA-GALAXY', // Custom font
                    fontSize: 16,
                    color: Colors.grey, // Grey text
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // email Field
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجي ادخال البريد الإلكتروني ';
                    }
                    return null;
                  },
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
                const SizedBox(height: 20),

                // Password Field
                TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى ادخال كلمة المرور';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'كلمة السر',
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
                    prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  ),
                  style: const TextStyle(color: Colors.white), // White text
                ),
                const SizedBox(height: 10),

                // Forgot Password Link
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RoutesName.kForgotPasswordScreenRoute);
                    },
                    child: const Text(
                      'هل نسيت كلمة المرور؟',
                      style: TextStyle(
                        fontFamily: 'AA-GALAXY', // Custom font
                        fontSize: 14,
                        color: Color(0xff8012DC), // Purple text
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (userForm.currentState!.validate()) {
                        signIn(context);
                      }
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
                      'تسجيل الدخول',
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

                // Social Login Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: const BorderSide(
                              color: Colors.white), // White border
                        ),
                        child: const Text(
                          'Google',
                          style: TextStyle(
                            fontFamily: 'AA-GALAXY', // Custom font
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // White text
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: const BorderSide(
                              color: Colors.white), // White border
                        ),
                        child: const Text(
                          'Facebook',
                          style: TextStyle(
                            fontFamily: 'AA-GALAXY', // Custom font
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // White text
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.kRegisterScreenRoute);
                      },
                      child: const Text(
                        'إنشاء حساب',
                        style: TextStyle(
                          fontFamily: 'AA-GALAXY', // Custom font
                          fontSize: 14,
                          color: Color(0xff8012DC), // Purple text
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      'ليس لديك حساب ؟',
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
      ),
    );
  }
}
