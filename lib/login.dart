
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool isLogin = true;
  bool hidePassword = true;

  static const navy = Color(0xFF18232D);
  static const gold = Color(0xFFFFD85C);
  static const muted = Color(0xFF9AA4AE);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isLogin
                ? 'Login form validated'
                : 'Registration form validated',
          ),
          backgroundColor: Colors.green.shade700,
        ),
      );

      // Firebase Authentication yahan connect karein.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      body: Stack(
        children: [
          // Decorative mosque silhouette
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 260,
            child: IgnorePointer(
              child: CustomPaint(
                painter: MosquePainter(),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 20,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 380,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 15),

                        // Brand logo
                        const Icon(
                          Icons.auto_awesome,
                          color: gold,
                          size: 34,
                        ),

                        const SizedBox(height: 5),

                        const Text(
                       'جامعہ عربیہ عباسیہ',
                          style: TextStyle(
                            color: gold,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          isLogin
                              ? 'Welcome back'
                              : 'Create your account',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 34),

                        // Register name field
                        if (!isLogin) ...[
                          buildField(
                            controller: nameController,
                            hint: 'Your Name',
                            icon: Icons.person_outline,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 13),
                        ],

                        // Email field
                        buildField(
                          controller: emailController,
                          hint: 'Your Email',
                          icon: Icons.mail_outline,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                !RegExp(
                                  r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                ).hasMatch(value.trim())) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 13),

                        // Password field
                        TextFormField(
                          controller: passwordController,
                          obscureText: hidePassword,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: muted,
                              fontSize: 12,
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: gold,
                              size: 19,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: muted,
                                size: 19,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xFF202C37),
                            contentPadding:
                                const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: const BorderSide(
                                color: Color(0xFF776B45),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: const BorderSide(
                                color: gold,
                                width: 1.3,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),

                        // Forgot password
                        if (isLogin)
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Connect password reset to Firebase.',
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: muted,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                        else
                          const SizedBox(height: 15),

                        const SizedBox(height: 8),

                        // Login / Register button
                        SizedBox(
                          width: double.infinity,
                          height: 49,
                          child: ElevatedButton(
                            onPressed: submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: gold,
                              foregroundColor: navy,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              isLogin ? 'Sign In' : 'Create Account',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Switch Login / Register
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isLogin
                                  ? "Don't have an account? "
                                  : 'Already have an account? ',
                              style: const TextStyle(
                                color: muted,
                                fontSize: 11,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLogin = !isLogin;
                                  _formKey.currentState?.reset();
                                  nameController.clear();
                                  emailController.clear();
                                  passwordController.clear();
                                });
                              },
                              child: Text(
                                isLogin ? 'Sign Up' : 'Sign In',
                                style: const TextStyle(
                                  color: gold,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 23),

                        const Text(
                          'Or continue with',
                          style: TextStyle(
                            color: muted,
                            fontSize: 11,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // Social login buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            socialButton(
                              'G',
                              Colors.blueAccent,
                              () {},
                            ),
                            const SizedBox(width: 16),
                            socialButton(
                              '●',
                              Colors.white,
                              () {},
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 13,
      ),
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: muted,
          fontSize: 12,
        ),
        prefixIcon: Icon(
          icon,
          color: gold,
          size: 19,
        ),
        filled: true,
        fillColor: const Color(0xFF202C37),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(
            color: Color(0xFF776B45),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(
            color: gold,
            width: 1.3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }

  Widget socialButton(
    String label,
    Color labelColor,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 54,
      height: 44,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFF202C37),
          side: const BorderSide(
            color: Color(0xFF35414D),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: labelColor,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Decorative mosque silhouette
class MosquePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF101B25)
      ..style = PaintingStyle.fill;

    final path = Path();

    // Main mosque building
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.65);
    path.lineTo(size.width * 0.28, size.height * 0.65);

    // Dome
    path.lineTo(size.width * 0.36, size.height * 0.56);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.39,
      size.width * 0.64,
      size.height * 0.56,
    );

    path.lineTo(size.width * 0.72, size.height * 0.65);
    path.lineTo(size.width, size.height * 0.65);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Minarets
    for (final x in [size.width * 0.08, size.width * 0.88]) {
      final minaret = Path()
        ..moveTo(x - 10, size.height)
        ..lineTo(x - 6, size.height * 0.35)
        ..lineTo(x, size.height * 0.29)
        ..lineTo(x + 6, size.height * 0.35)
        ..lineTo(x + 10, size.height)
        ..close();

      canvas.drawPath(minaret, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
