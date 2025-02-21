import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/features/auth/presentation/widgets/sign-up/sign_up_form.dart';
import 'package:two_website/features/auth/presentation/widgets/sign-up/sign_up_header.dart';

class SignUpMobile extends StatelessWidget {
  const SignUpMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesConfig.defaultSpace),
          child: Column(
            children: [
              //Header
              SignUpHeader(),
              //Form
              SignUpForm()
            ],
          ),
        ),
      ),
    );
  }
}
