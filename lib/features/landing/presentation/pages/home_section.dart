import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/two_details.dart';

import '../../../../config/strings/assets_path.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
        image: const DecorationImage(
            image: AssetImage(
              IconsPath.homeDecor,
            ),
            fit: BoxFit.fill),
        child: Row(
          children: [
            const Expanded(child: TwoDetails()),
            Expanded(child: Image.asset(ImagesPath.office)),
          ],
        ));
  }
}
