import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/fill__client_profile_body.dart';

class FillClientProfileMobile extends StatelessWidget {
  const FillClientProfileMobile({super.key, required this.id});
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
              FillClientProfileBody(
                id: id,
              )
            ],
          ),
        ),
      ),
    );
  }
}
