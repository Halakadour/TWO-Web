import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/centerd_view.dart';
import 'package:two_website/sections/home/widgets/two_details/two_details.dart';

import '../../config/paths/assets_path.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CenterdView(
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
