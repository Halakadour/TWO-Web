import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/features/auth/presentation/widgets/login/login_form.dart';
import 'package:two_website/features/auth/presentation/widgets/login/login_header.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesConfig.defaultSpace),
          child: Column(
            children: [
              //Header
              LoginHeader(),
              //Form
              LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
