import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shelfaware_website/Pages/appbar.dart';
import 'package:shelfaware_website/design/design.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Container(
  width: 350, // Adjust width of the box
  padding: const EdgeInsets.all(16), // Add padding inside the box
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        spreadRadius: 5,
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        'assets/icon_black.png', 
        width: 100, 
        height: 100, 
      ),
      const SizedBox(height: 20),
      Text(
        'Log in your account',
        style: GoogleFonts.poppins(
          fontSize: 18, // Font size of 18
          fontWeight: FontWeight.w500, // Bold text
        ),
      ),
      const SizedBox(height: 20),
      // Using the custom text field for email
      CustomTextField(
        label: 'Email',
        controller: emailController,
      ),
      const SizedBox(height: 15),
      // Using the custom text field for password
      CustomTextField(
        label: 'Password',
        obscureText: true,
        controller: passwordController,
      ),
      const SizedBox(height: 20),
      // Using the custom button
      CustomButton(
        text: 'Log In',
        onPressed: () {
          Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const AppBarPage()),
);

        },
      ),
    ],
  ),
)

      ),
    );
  }
}
