import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Text("Dashoard"),
    );
  }
}
