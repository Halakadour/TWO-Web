import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/templates/login_template.dart';
import 'package:two_website/features/auth/presentation/widgets/order-project/order_project_body.dart';

class OrderProjectDesktopTablet extends StatelessWidget {
  const OrderProjectDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollTemplate(
        child: Column(
      children: [
        // Body
        OrderProjectBody()
      ],
    ));
  }
}
