import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/fill__freelancer_profile_body.dart';

class FillFreelancerProfileMobile extends StatelessWidget {
  const FillFreelancerProfileMobile({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SizesConfig.defaultSpace),
          child: Column(
            children: [
              // Body
              FillFreelancerProfileBody(id: id)
            ],
          ),
        ),
      ),
    );
  }
}
