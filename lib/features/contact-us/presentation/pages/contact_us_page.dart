import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Text("Contact Us"),
    );
  }
}
