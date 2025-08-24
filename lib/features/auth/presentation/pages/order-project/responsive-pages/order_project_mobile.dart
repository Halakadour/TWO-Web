import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/features/auth/presentation/widgets/order-project/order_project_body.dart';

class OrderProjectMobile extends StatelessWidget {
  const OrderProjectMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SizesConfig.defaultSpace),
          child: Column(
            children: [
              // Body
              OrderProjectBody()
            ],
          ),
        ),
      ),
    );
  }
}
