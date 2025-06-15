import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/features/auth/presentation/widgets/choose-user-type/choose_use_type_body.dart';

class ChooseUserTypeMobile extends StatelessWidget {
  const ChooseUserTypeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesConfig.defaultSpace),
          child: Column(
            children: [
              // Body
              ChooseUseTypeBody()
            ],
          ),
        ),
      ),
    );
  }
}
