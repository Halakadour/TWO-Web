import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/fill_profile_body.dart';

class FillProfileMobile extends StatelessWidget {
  const FillProfileMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesConfig.defaultSpace),
          child: Column(
            children: [
              // Body
              FillProfileBody()
            ],
          ),
        ),
      ),
    );
  }
}
